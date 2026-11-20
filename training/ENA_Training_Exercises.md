## ENA Training Exercises

Answers are in [ENA_Training_Answers.md](ENA_Training_Answers.md) - try the exercises first!

### 1. Data model

1.1 Where (which ENA object and file) does each of these Loculus metadata fields end up?

- `sampleCollectionDate`
- `authors`
- `sequencingInstrument`
- The group's institution
- `depthOfCoverage`

1.2 Why can't we submit the assembly before the raw reads?

1.3 What happens to a sequence with no raw reads?

### 2. Status lifecycle

What state is each entry in, and is that a problem? What (if anything) should you do?

2.1 An assembly has been in `WAITING` for 30h.

2.2 A sample has been in `SUBMITTING` for 2h.

2.3 A raw reads entry is in `HAS_ERRORS` with "FTP service authentication error".

2.4 An assembly has been in `WAITING` for 6 days.

### 3. Triage the `get_ena_submission_list` cronjob Slack notifications

What do you do if the `get_ena_submission_list` cronjob sends you zipped data with:

3.1 A sequence with `insdcAccessionBase` filled in

3.2 Two sequences that share the same `biosampleAccession`

3.3 A revocation notice
