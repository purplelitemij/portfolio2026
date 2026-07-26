---
layout: page
title: Documentation Intake
description: Managing end-to-end documentation processes for docs-as code development.
category: administration
---

## Overview

This section will highlight my working with Engineering (SMEs) to bundle the product/feature release. As a writer for more than 15 years, I know that it is immportant and constructive to work in unison with the product and engineering teams. Many a time I ahve encountered that changes to code (feature) is not always dcumented. It could be a miss on any ones part, but identifying the gap and fixing the loop has been key to support mitigation.

During my time at JPMC, I supported 20+ teams, but each at a differnt level of connect. Teams were global and it was not always possible to attend all agile ceremonies, so I chose to attend teh ones that were on my timezone and those with most change (by priority). 

I created the same intake process for all teams to streamline my work and being able to track it all at one time. Engineering planning was key to understand teh upcoming chnages that would lead to new content, content updates, removing content,... Our content was architected into Getting Started, User Guides, Concepts, Reference, and Troubleshooting.

During the plannings, a Dev task was discussed and was labeled for documentation as "doc-required". This made it easier to craete a rule in Jira to extract all stories impacted for documentation. During this time, I also noticed some discrepancies that we had to fix.

## Identifiying missing documentation

Support tickets and Page credit metrics sometimes showed that we had missed content updates for configurations, code samples, APIs.... This wasn't very common but definitely had to be fixed. Engineering would miss the label "doc-required" hence forget the need for a doc update. This was caught during a release meeting where we reviewed the release go/no-go. This would create trailing documentation.
This became unacceptable as "Docs-as-code" meant releasing code and docs together, trying to accomplish a more robust understanding of teh feature changes.

We came up with a doc intake form that we linked into all Engineering teams dashboards and roadmaps. The below screenshot details what Documentation needed. 

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Doc intake
</div>

THis definitely forced eyes on the issue as well, it drove priorities, I was able to point teams to this intake form along with using a "doc-required" label to keep docs and code in sync. The intake form provided specifics for:
- Documentation Priority
- Worklow process details (providing SME, Product Mananger, Related references,....)
- New documnttaion request
- Update to existing content
- Hotfix





<!-->
Every project has a beautiful feature showcase page.
It's easy to include images in a flexible 3-column grid format.
Make your photos 1/3, 2/3, or full width.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/1.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images, even citations {% cite einstein1950meaning %}.
Say you wanted to write a bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, _bled_ for your project, and then... you reveal its glory in the next row of images.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
-->