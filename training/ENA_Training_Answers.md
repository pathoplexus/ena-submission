## ENA Training Exercises - Answer Sheet

Exercises are in [ENA_Training_Exercises.md](ENA_Training_Exercises.md).

### 1. Data model

1.1 Where does each field end up?

| Loculus field | ENA object | File |
| --- | --- | --- |
| `sampleCollectionDate` | BioSample and Assembly | `collection date` attribute in `sample.xml`; `/collection_date` in the assembly flatfile (`sequences.embl.gz`) |
| `authors` | Assembly | `AUTHORS` in the assembly `manifest.tsv`, and the `RA` line of the flatfile |
| `sequencingInstrument` | Experiment/Run and Assembly | `INSTRUMENT` (or `PLATFORM`) in the reads `manifest.tsv`; `PLATFORM` in the assembly `manifest.tsv` |
| The group's institution | All objects | `center_name` on the BioProject and BioSample XML, and `-centername` for webin-cli |
| `depthOfCoverage` | Assembly | `COVERAGE` in the assembly `manifest.tsv` |

1.2 The assembly manifest links to the run via `RUN_REF`, so we need the run accession (ERR...) before we can submit the assembly.

1.3 It skips the raw reads step: `status_all` goes straight from `SUBMITTED_SAMPLE` to `SUBMITTING_ASSEMBLY`, and the assembly manifest has no `RUN_REF`.

### 2. Status lifecycle

2.1 Not a problem yet, no action needed. ENA usually assigns a GCA within 48h; the pipeline polls every 5 minutes. A Slack alert fires after 48h in `WAITING`.

2.2 A problem: BioSample submission should be instant (a synchronous POST). The pipeline alerts after 15 min in `SUBMITTING`. Investigate - check the pod logs and the `sample_table` entry in the db.

2.3 Most likely a transient ENA issue. "FTP service authentication error" is in `slack_retry_substrings`, so the pipeline will reset the entry to `READY` and retry automatically (every 4h). If it keeps failing, investigate. You can also retry manually by setting the status to `READY`.

2.4 A problem: file a ticket with the ENA help-desk (https://www.ebi.ac.uk/ena/browser/support). Get the ERZ accession from `assembly_table` first, identify yourself as a broker, sign on behalf of the Pathoplexus team and CC our Slack channel. Do **not** reset to `READY` - once an ERZ has been assigned it cannot be retried via the pipeline.

### 3. Triage the `get_ena_submission_list` cronjob Slack notifications

3.1 Do not submit it. INSDC/GenBank assembly accessions (`insdcAccessionBase`, `insdcVersion`, `insdcAccessionFull`) should never be supplied by a user - this means the sequence most likely already exists in the INSDC. Remove it from the list, and check whether it needs to be revoked on Pathoplexus.

3.2 Do not submit them. There must be ONE unique biosample for EACH sequence - submitting the second sequence would revise the BioSample of the first, incorrectly changing the earlier submission. Remove them from the list and contact the submitter to get the correct biosamples.

3.3 Investigate whether the revoked sequence needs to be suppressed on ENA. If so:

1. File a ticket with the ENA help-desk (https://www.ebi.ac.uk/ena/browser/support) to suppress it.
2. Add the accessionVersion to `suppressed/ppx-accessions-suppression-list.txt` (e.g. `python3 add_to_suppressed.py input.json`) so we stop getting notified about it.
3. Once ENA has confirmed, email biosamplehelp@ncbi.nlm.nih.gov to request the same suppression at NCBI, naming both the assembly and its linked biosample(s) - suppression at EBI does not propagate to NCBI.
