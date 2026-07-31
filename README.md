# ENA Submission - Approved Sequences Repository

This repo should be used for uploading sequences that have been approved for release to ENA. Once sequences are uploaded to the `approved` folder the ena-submission pipeline will ingest them and add them to the `submission-database` - triggering ENA submission. We assume only approved sequences are uploaded here and only perform minimal checks.

To gain an understanding of the ENA metadata model we recommend reading [ENA Submission](https://github.com/loculus-project/loculus/blob/main/ena-submission/ENA_submission.md). Pathoplexus tracks ENA submission status and performs ENA submissions in a specialized pod (can be thought of as a state-machine). For details on our submission process read the [ENA submission pod overview](https://github.com/loculus-project/loculus/blob/main/ena-submission/README.md).

See [docs/SOP.md](docs/SOP.md) for how this repo should be used.
See [docs/ISSUE_TRACKING.md](docs/ISSUE_TRACKING.md) for how to track ENA submissions that need intervention using GitHub issues.

## Repository Structure

The `loculus-get-ena-submission-list-cronjob` should generate a file that is the correct format. If you are ok with the contents of this file you can rename the file as `approved_ena_submission_list.json` and upload it to the `approved` folder. (See the `test` folder for an example).

Note the `test` folder can be used to test your submissions on PPX staging. Staging reads sequences in the `test` folder and submits them to the ENA dev website using the ENA broker account (we do not have a separate test account the only difference is that submissions are made to the ENA dev instance but all credentials are the same as prod).

After sequences have been uploaded to the database the corresponding files can be removed, but you can also append new sequences to the `approved_ena_submission_list.json`.

A list of sequences that should be suppressed on ENA can be found in the `suppressed` folder.
