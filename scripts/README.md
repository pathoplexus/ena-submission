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
    1 distinct value(s) across 12 sequence(s)
    12 2026-05-20
  group 102 (Example Institute B, Exampleland)
    1 distinct value(s) across 6 sequence(s)
    6 2026-06-25

> submissionId
  group 101 (Example Lab A, Testland)
    12 distinct value(s) across 12 sequence(s)
    1 Example_TL0001_2026
    1 Example_TL0002_2026
    1 Example_TL0003_2026
    1 Example_TL0004_2026
    1 Example_TL0005_2026
    1 Example_TL0006_2026
    1 Example_TL0007_2026
    1 Example_TL0008_2026
    1 Example_TL0009_2026
    1 Example_TL0010_2026
    ... 2 additional value(s) omitted
  group 102 (Example Institute B, Exampleland)
    6 distinct value(s) across 6 sequence(s)
    1 Example_EX0001_2026
    1 Example_EX0002_2026
    1 Example_EX0003_2026
    1 Example_EX0004_2026
    1 Example_EX0005_2026
    1 Example_EX0006_2026

> specimenCollectorSampleId
  group 101 (Example Lab A, Testland)
    12 distinct value(s) across 12 sequence(s)
    1 Example_TL0001_2026
    1 Example_TL0002_2026
    1 Example_TL0003_2026
    1 Example_TL0004_2026
    1 Example_TL0005_2026
    1 Example_TL0006_2026
    1 Example_TL0007_2026
    1 Example_TL0008_2026
    1 Example_TL0009_2026
    1 Example_TL0010_2026
    ... 2 additional value(s) omitted
  group 102 (Example Institute B, Exampleland)
    6 distinct value(s) across 6 sequence(s)
    1 Example_EX0001_2026
    1 Example_EX0002_2026
    1 Example_EX0003_2026
    1 Example_EX0004_2026
    1 Example_EX0005_2026
    1 Example_EX0006_2026

...
```

