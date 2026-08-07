#!/usr/bin/env bash

if ! command -v jq > /dev/null; then
  echo "jq is not installed" >&2
  exit 1
fi

# Fields to report
FIELDS=(
  releasedDate
  submissionId
  specimenCollectorSampleId
  authors
  authorAffiliations
  bioprojectAccession
  biosampleAccession
  insdcAccessionBase
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
      ( [.[].value] | group_by(.) | sort_by(-length)
        | "    \(length) distinct value(s) across \(map(length) | add) sequence(s)",
          (.[0:$max] | map("    \(length) \(.[0])")[]) )' "$1"
  echo ""
done
