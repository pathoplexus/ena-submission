# Tracking ENA submissions that need intervention

We track any submission that leaves the happy path as a [GitHub issue](https://github.com/pathoplexus/ena-submission/issues).

## TL;DR

- Log every DB surgery, ENA email, and relevant Slack link on the issue (see [below](#what-must-always-be-logged-on-an-issue)).
- Typically one issue per submission (group + organism + submission day + type) - see [Scoping issues](#scoping-issues).
- Keep the title current and specific - see [Issue titles](#issue-titles).
- Whoever is on ENA duty reviews open issues weekly - see [Weekly review](#weekly-review).
- Every comment says what happens next and by when - see [Always state the next action](#always-state-the-next-action).

## What must always be logged on an issue

- **DB surgery** - e.g. manually changing states - must be tracked.
- **Emails to ENA** must be referenced in a comment mentioning the ticket number, subject line, and a quick summary.
- **Slack threads** - link any discussion there that could give a future operator useful context.

## Scoping issues

An issue should usually cover a single submission: one group, one organism, submitted to our DB on the same day, and of the same type (initial submission vs. revision).

- **Too broad** (e.g. lumping submissions together) lets states diverge - some sequences finish while others error - making status hard to reason about.
- **Too narrow** (one issue per sequence) creates needless overhead.
- When in doubt, err toward granularity - it's easy to close an issue, harder to untangle a merged one.

Multiple distinct submissions can share a single **umbrella issue** while they're hitting the same problem at the same point in time. Split it into separate issues as soon as their states diverge.

> **Example:** 100 sequences across 4 organisms have assemblies submitted but no NUC/GCA accessions yet. All were submitted 4-5 days ago, so this isn't unusual yet and doesn't warrant an ENA email - but it's worth tracking, with a plan to escalate if nothing changes in a week. One umbrella issue is fine for now; split it out as soon as some submissions enter a different error state. See [#303](https://github.com/pathoplexus/ena-submission/issues/303).

## Issue titles

Titles should be specific enough to tell what's going on at a glance, and updated whenever the underlying problem changes (e.g. "bioproject not live" becomes "bioproject live, biosample missing").

| Good | Not so good |
|---|---|
| "Submit 1 andv sequence with linked umbrella bioproject" | "Sequences waiting for assembly" (which sequences? routine delay or something longer?) |
| "Submission of Boston RSV-A and RSV-B sequences with user-supplied reads: Biosample not propagated to ENA hence erroring, waiting on ENA" | "Assemblies waiting" |
| "Revoke/Suppress 98 mpox Philippines sequences waiting on ENA" | |

The middle "not so good" example above was rewritten to: "Assemblies (RSV, Ebola, ANDV) submitted 2026-07-23/2026-07-24 waiting for assembly accessions".

## Weekly review

Whoever is on ENA duty goes through all open issues **at least once a week**, checks status, and updates each issue accordingly.

Additionally, they should check the `pathoplexus-notifications` slack channel **daily** for any new sequences to submit to ENA. Any alerts about submissions that are in an error state or stuck in submitting state for too long should also be reviewed (this will most likely require checking the ena submission database for the error status).

## Always state the next action

Every state change - essentially every comment - should say what's expected or hoped for, and by when.

> **Example:** "Sequences should process in the next few days. If sequences still not processed by Aug 3, open a ticket with the ENA helpdesk."
