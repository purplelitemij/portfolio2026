---
layout: page
title: Release Management
description: Managing end-to-end formation and publication of release notes
importance: 3
category: administration
---

A large part of my focus as a writer has been working with the engineering teams to publish their release artifacts and release notes.

The process highlights the Release Management process and my role in working with SMEs and the Release Engineer, to create the content for the extraction of the release notes. I supported multiple teams, one of which was the Continuous Integration team which had a weekly release cadence.

This process was created was to bring efficiency to the Release process. In working with the teams, we noticed that content was missing with relationship to new features/ changes. Developers were having difficulty in understanding the upcoming features and the guidance on using the feature developed was missing. This was a recurring issue that needed to be addressed. 
We noticed that all code changes need not be release-noted, as some were internal changes which led us to track wheter a change needed to be Release Noted.

To run through the process created for extraction of the Release Notes, I created a Confluence page that captured the dev task, developer, changes, impact to the user, and related doc impact (new feature addition/modification). We noticed that every dev change did not require documentation updates. The developers worked closely with me to understand the doc deliverables, which made it easier for us to collaborate and show the importance of documentation inline with code changes (user guides, configurations, communication to external teams, deveper guides,...).

**The following process became a part of the bi-weekly scrum:**
 - Identify the dev story that required documentation. 
 - Create a doc task linked to the dev task.
 - Close the tasks with SMEs to ensure content accuracy.
 - Publish the doc in line with code changes.

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

 **The weekly release tracked:**
  - Dev tasks were merged and ready for the weekly release. Release engineer cuts the release.
  - Related doc changes review targeting the release. The related doc task would be merged and pushed to production **only on the day of the release**.
  - Release review meeting scheduled weekly for a go/no go. SMEs, Product team, and Docs participated to ensure accuracy and completion of feature changes. Any change that required extra effort for communication was handled at this time.
  - The following areas are discussed in detail:
    - Release manager and their confidence in the release (tested and ready)
    - Feature change
    - Feature's impact to the user
    - Related documentation
    - Communication to users via the Release Notes?
    <br>While creating the Release Notes, only those marked for this communication is extracted for the release notes.
  
**Day of Release:**
 - Release Manager completes the release and notifies documentation , who in turn proceeds to publish the release notes and communicate it to the users via the Documentation Portal and on chatrooms.
    
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/IMG_1037_RNPublishFeaturePage-edtd.png" title="doc update inline with code changes" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Published content updated for the code and doc feature rollout during the weekly release.
</div>
