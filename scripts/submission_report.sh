#!/usr/bin/env bash

if ! command -v jq > /dev/null; then
  echo "jq is not installed" >&2
  exit 1
fi

# Fields to report
FIELDS=(
  releasedDate
  accessionVersion
  submissionId
  specimenCollectorSampleId
  authors
  authorAffiliations
  bioprojectAccession
  biosampleAccession
  insdcAccessionBase
  insdcVersion
  insdcAccessionFull
  insdcRawReadsAccession
  gisaidIsolateId
  assemblyReferenceGenomeAccession
)

# How many of the most common values to list per field
MAX_VALUES=10

for f in "${FIELDS[@]}"; do
  echo "> $f"
  jq -r --arg f "$f" --argjson max "$MAX_VALUES" '
    def classify($f):
      if has($f) | not then "<field absent>"
      elif .[$f] == null then "<null>"
      elif .[$f] == "" then "<empty string>"
      elif (.[$f] | type) == "string" and (.[$f] | test("^\\s+$")) then "<whitespace only>"
      else (.[$f] | tostring)
      end;
    [.[].metadata | {group: "\(.groupId) (\(.groupName))", value: classify($f)}]
    | group_by(.group) | .[]
    | "  group \(.[0].group)",
      ( ([.[].value] | group_by(.) | sort_by(-length)) as $values
        | "    \($values | length) distinct value(s) across \($values | map(length) | add) sequence(s)",
          ($values[0:$max] | map("    \(length) \(.[0])")[]),
          (if ($values | length) > $max
           then "    ... \(($values | length) - $max) additional value(s) omitted"
           else empty end) )' "$1"
  echo ""
done
