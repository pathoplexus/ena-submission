# ENA Submission - Approved Sequences Repository

This repo should be used for uploading sequences that have been approved for release to ENA. Once sequences are uploaded to the `approved` folder the ena-submission pipeline will ingest them and add them to the `submission-database` - triggering ENA submission. We assume only approved sequences are uploaded here and only perform minimal checks.

## File Format

The `loculus-get-ena-submission-list-cronjob` should generate a file that is the correct format. If you are ok with the contents of this file you can rename the file as `approved_ena_submission_list.json` and upload it to the `approved` folder. (See the `test` folder for an example).

Note the `test` folder can be used to test your submissions on PPX staging. Staging reads sequences in the `test` folder and submits them to the ENA dev website using the ENA broker account (we do not have a separate test account the only difference is that submissions are made to the ENA dev instance but all credentials are the same as prod).

After sequences have been uploaded to the database the corresponding files can be removed, but you can also append new sequences to the `approved_ena_submission_list.json`.

## IMPORTANT CHECKS

There have been cases where the formatting of names or institutions have been messed up, we have found that running `jq` over the file often will fix these mis-formatted names but it is still good to check manually: 

```
FILE="test/approved_ena_submission_list.json"
jq '' "$FILE" | sponge "$FILE"
```

If you are submitting an assembly with ena-specific metadata fields check that the bioproject, biosamples and raw reads accessions are valid. There should be **ONE unique biosample FOR EACH sequence**. Submitting sequences with the wrong biosample will lead to previous submissions linked to that biosample being incorrectly revised.

If you submit sequences with the wrong biosamples they will need to be resubmitted with the correct biosample. This can be accomplished by deleting the previous submissions from the ena deposition DB. However, the sequence that was incorrectly revised will have to be resubmitted by generating the submission files in dry-run.

# Revoked Sequences

If revoked sequences need to be suppressed on ENA this must be done by sending an email to the ENA help-desk. Then, a list of suppressed sequences (PPX accessionVersion) should be added to the `suppressed/ppx-accessions-suppression-list.txt` file (this just stops us receiving notifications about sequences that need to be suppressed).

If `approved_ena_submission_list.json` contains sequences to be suppressed run 
```
python3 add_to_suppressed.py input.json
```
to add the accessionVersions to the suppression list.


