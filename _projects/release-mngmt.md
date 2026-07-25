---
layout: page
title: Release Management
description: Managing end-to-end formation and publication of release notes
importance: 3
category: administration
---

A large part of my focus as a writer has been working with the engineering teams to publish their release artifacts and release notes.

This highlights the Release Management process and my role in working with SMEs and the Release Engineer to create the content for extracting the release notes. I supported multiple teams, one of which was the Continuous Integration team, which had a weekly release cadence.

## Release process

This process was created to bring efficiency to the release process. In working with the teams, I noticed that content was missing in relation to new features/changes. Developers were having difficulty understanding upcoming features and the guidance on using the feature developed was missing. This was a recurring issue that was identified.
I noticed that not all code changes needed to be release-noted, as some were internal changes, which led us to track whether a change needed to be release-noted.

To run through the process created for extraction of the release notes, I created a Confluence page that captured the dev task, developer, changes, impact to the user, and related doc impact (new feature addition/modification). I noticed that every dev change did not require documentation updates. The developers worked closely with me to understand the doc deliverables, which made it easier for us to collaborate and show the importance of documentation inline with code changes (user guides, configurations, communication to external teams, developer guides).

## Release cadence

<strong>The following process became a part of the bi-weekly scrum:</strong>
 - Identifying the dev story that required documentation. 
 - Creating a doc task linked to the dev task.
 - Closeing the tasks with SMEs to ensure content accuracy.
 - Publishing the doc in line with code changes.

<div markdown="1">
 <div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/IMG_1034_RN_DevReqmnts_edtd.png" title="dev_requirements" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/IMG_1031_RN_DevJira_edtd.png" title="dev-jira" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/IMG_1035_RNECPRMerge_edtd.png" title="doc_merge_release" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
</div>

### Release tracking metrics

 The weekly release tracked the following:

 - Dev tasks merged and ready for the weekly release. The Release engineer creates the release bundle of all merged changes.
 - Related doc changes review aligned to the weekly release. The related doc task would be merged and pushed to production <strong>only on the day of the release</strong>.
 - Release review meeting scheduled weekly for a go/no go. SMEs, Product team, and Docs participated to ensure accuracy and completion of feature changes. Any change that required extra effort for communication was also handled at this time.

The following topics were vetted for release readiness and confidence:

 - Release manager and their confidence in the release (tested and ready)
 - Feature change (Dev task)
 - Feature's impact to the user
 - Related documentation
 - User impact <br> If user impact was identified, the feature change was release noted.
 - Communication to users via the Release Notes?<br>While creating the Release Notes, only those marked for Release communication was extracted to the release notes.

### Release availability

 - I publish the release notes and communicate the availability to users via the Documentation Portal and chatrooms once the Release Manager completes the release and notifies documentation.

</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/IMG_1037_RNPublishFeaturePage-edtd.png" title="doc update inline with code changes" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Published content updated for the code and doc feature rollout during the weekly release.
</div>
