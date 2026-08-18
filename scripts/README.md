## ENA Submission Scripts

This folder contains various scripts useful for ENA work.

### `submission_report.sh`

#### Summary

This script can be used to generate a quick summary of a set of sequences in a JSON file. For a defined set of fields, it displays (for each submitting group) the number of distinct values for that field, and lists the first ten most common of them.

#### Usage

The script requires `jq` to be installed. Then, to use it, run:

```
./scripts/submission_report.sh example_ena_submission_list.json
```

and it will output a report:

```
> releasedDate
  group 101 (Example Lab A, Testland)
    2 distinct value(s) across 3 sequence(s)
    2 2026-05-20
    1 2026-05-21
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 2026-06-25

> submissionId
  group 101 (Example Lab A, Testland)
    3 distinct value(s) across 3 sequence(s)
    1 Example_TL0001_2026
    1 Example_TL0002_2026
    1 Example_TL0003_2026
  group 102 (Example Institute B, Exampleland)
    2 distinct value(s) across 2 sequence(s)
    1 Example_EX0001_2026
    1 Example_EX0002_2026

> specimenCollectorSampleId
  group 101 (Example Lab A, Testland)
    3 distinct value(s) across 3 sequence(s)
    1 Example_TL0001_2026
    1 Example_TL0002_2026
    1 Example_TL0003_2026
  group 102 (Example Institute B, Exampleland)
    2 distinct value(s) across 2 sequence(s)
    1 Example_EX0001_2026
    1 Example_EX0002_2026

> authors
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 Example, Ann; Sample, Sam
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 Example, Ann; Sample, Sam

> authorAffiliations
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 Example Lab A, Testland
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 Example Institute B, Exampleland

> bioprojectAccession
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 PRJEB00000
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 PRJEB00000

> biosampleAccession
  group 101 (Example Lab A, Testland)
    3 distinct value(s) across 3 sequence(s)
    1 SAMEA100000001
    1 SAMEA100000002
    1 SAMEA100000003
  group 102 (Example Institute B, Exampleland)
    2 distinct value(s) across 2 sequence(s)
    1 SAMEA100000004
    1 SAMEA100000005

> insdcAccessionBase
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 <null>
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 <null>

> insdcVersion
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 <null>
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 <null>

> insdcAccessionFull
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 <null>
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 <null>

> insdcRawReadsAccession
  group 101 (Example Lab A, Testland)
    3 distinct value(s) across 3 sequence(s)
    1 ERR10000001
    1 ERR10000002
    1 ERR10000003
  group 102 (Example Institute B, Exampleland)
    2 distinct value(s) across 2 sequence(s)
    1 ERR10000004
    1 ERR10000005

> gisaidIsolateId
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 <null>
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 <null>

> assemblyReferenceGenomeAccession
  group 101 (Example Lab A, Testland)
    1 distinct value(s) across 3 sequence(s)
    3 <null>
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 2 sequence(s)
    2 <null>
```

