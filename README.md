# ENA Submission - Approved Sequences Repository

This repo should be used for uploading sequences that have been approved for release to ENA. Once sequences are uploaded to the `approved` folder the ena-submission pipeline will ingest them and add them to the `submission-database` - triggering ENA submission. We assume only approved sequences are uploaded here and only perform minimal checks. 

### File Format

The `loculus-get-ena-submission-list-cronjob` should generate a file that is the correct format. If you are ok with the contents of this file you can rename the file as `approved_ena_submission_list.json` and upload it to the `approved` folder. (See the `test` folder for an example).

After sequences have been uploaded to the database the corresponding files can be removed, but you can also append new sequences to the `approved_ena_submission_list.json`.
