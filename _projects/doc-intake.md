---
layout: page
title: Documentation Intake
description: Managing end-to-end documentation processes for docs-as code development.
category: administration
---

## Overview

This section highlights my work with Engineering (SMEs) to bundle documentation into product/feature releases. As a writer for more than 15 years, I've learned it's important and constructive to work in unison with the product and engineering teams. More than once I've seen a code change ship without its documentation update, often not anyone's fault in particular, but identifying the gap and closing the loop has been key to reducing support escalations.

During my time at JPMC, I supported 20+ teams, each at a different level of engagement. Teams were global, so it wasn't always possible to attend every agile ceremony. I prioritized the ones in my timezone and the ones with the most feature changes in flight.

I built the same intake process for every team so I could streamline my own work and track it all in one place. Engineering planning was key to understanding upcoming changes that would lead to new content, content updates, and content removals. Our content was organized into Getting Started, User Guides, Concepts, Reference, and Troubleshooting.

During planning, a dev task would be discussed and labeled for documentation as "doc-required." That made it easy to build a Jira rule that could extract every story with a documentation impact. Along the way, I also noticed a few recurring gaps worth fixing.

### Identifying missing documentation

Support tickets and content metrics sometimes showed that we missed updates for configurations, code samples, or APIs. It wasn't common, but it happened enough to address directly: Engineering would occasionally miss the "doc-required" label, so the need for a doc update went unnoticed. It usually surfaced during release go/no-go meetings or through SME check-ins, by which point the documentation was trailing the release instead of shipping alongside it.

That wasn't acceptable, since "docs-as-code" meant releasing code and documentation together, in service of a more complete understanding of each feature change.

## Documentation request intake

The gap above was really a relationship gap: Engineering owned the code and the timeline, and I owned the documentation, but nothing formally connected the two. The doc intake process closed that gap: it's the bridge between Engineering and the Technical Writer, giving every code change a clear, trackable path to its documentation update instead of relying on someone remembering to loop me in.

An intake form, paired with the "doc-required" label, was the mechanism: Engineering flagged a change as soon as it was known to need documentation, and the label kept that request visible on my side from planning through release, rather than surfacing only when something was already missing. The intake form captured:
- Documentation priority
- Workflow process details (SME, Product Manager, related references)
- New documentation requests
- Updates to existing content
- Hotfixes

### Requesting a documentation update

Here's a simplified version of the request-intake guide I published for Engineering, Product Managers, and Customer Support teams so they'd always know where and how to loop in the Technical Writer.

This gave Engineering, Product Managers, and Customer Support teams a single place to notify the Technical Writer of documentation needs. Before submitting a request, consider:

- What is the priority? (If High, what story will it take precedence over?)
- Who is/are the SME(s) for the subject matter?
- What is the context? (How did this come to be known? What's the background?)
- Where is any related material (Word files, Confluence pages, etc.), and its source, if available?

Priority is defined as follows:

| Priority | Definition |
|---|---|
| Critical | Needs to be completed within the current sprint. This is treated as a spike, and something else gets bumped to the next sprint to make room. |
| High | Needs to be completed within the next sprint. |
| Medium | Needs to be completed within two sprints. |
| Low | Can be completed at any time, within reason. |

### Workflow for doc-intake

1. Navigate to the intake log:
   - Review the priority table to determine what priority the request falls under.
   - Review the questions above so you're ready to complete the intake form.
2. Click **Submit Documentation Update Request** and complete the fields:
   - Summary (title of the request)
   - Description (answers to the questions above)
   - Priority (per the table)
   - Target completion date (an estimate is fine)
   - Name and email of the requester
3. Click **Submit**: this auto-labels the ticket (doc-required) created from the form.
4. Open the **Not Started** tab of the backlog table and click **Refresh**. The new request appears at the top of the list.
