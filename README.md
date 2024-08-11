# ENA Submission - Approved Sequences Repository

This repo should be used for uploading sequences that have been approved for release to ENA. Once sequences are uploaded to this folder the ena-submission pipeline will ingest them and add them to the `submission-database`. We assume only approved sequences are uploaded here and do not perform any further checks.

Please upload sequences in a file called `approved_ena_submission_list.json` to the approved folder. This file should be in the same format you received sequences for approval in. (See the `test` folder for an example).

After sequences have been uploaded to the database the corresponding files can be removed, however to avoid issues we suggest when possible appending new sequences to the `approved_ena_submission_list.json`.
