---
layout: page
title: Analytics
description: Sample initiatives aimed at better understanding customer behavior and engineering needs.
importance: 2
category: administration
---
<i>The sample data was used to create an analytics exposure that supported documentation updates, reducing customer feedback during my tenure at JPMorganChase.</i>

As part of understanding how engineers actually used our documentation, I partnered with analytics to instrument a documentation portal (referred to below by the fictional name **Nimbus Docs**; the figures throughout are illustrative, not real production data) and track both where readers dropped off and what they were searching for but couldn't find. The two dashboards below are mock-ups in that same style: one on page traffic and usage, the other on search behavior and how it reshaped our content organization.

<div class="nimbus-viz">
<style>
.nimbus-viz {
  --surface-1: #fcfcfb;
  --page-plane: #f9f9f7;
  --text-primary: #0b0b0b;
  --text-secondary: #52514e;
  --text-muted: #898781;
  --gridline: #e1e0d9;
  --baseline: #c3c2b7;
  --border: rgba(11,11,11,0.10);
  --accent: #184f95;
  --accent-wash: rgba(24,79,149,0.10);
  --accent-2: #eb6834;
  --accent-2-wash: rgba(235,104,52,0.10);
  --good: #006300;
  font-family: system-ui, -apple-system, "Segoe UI", sans-serif;
  color: var(--text-primary);
}
@media (prefers-color-scheme: dark) {
  .nimbus-viz {
    --surface-1: #1a1a19;
    --page-plane: #0d0d0d;
    --text-primary: #ffffff;
    --text-secondary: #c3c2b7;
    --text-muted: #898781;
    --gridline: #2c2c2a;
    --baseline: #383835;
    --border: rgba(255,255,255,0.10);
    --accent: #256abf;
    --accent-wash: rgba(37,106,191,0.16);
    --accent-2: #d95926;
    --accent-2-wash: rgba(217,89,38,0.18);
    --good: #0ca30c;
  }
}
:root[data-theme="dark"] .nimbus-viz {
  --surface-1: #1a1a19;
  --page-plane: #0d0d0d;
  --text-primary: #ffffff;
  --text-secondary: #c3c2b7;
  --text-muted: #898781;
  --gridline: #2c2c2a;
  --baseline: #383835;
  --border: rgba(255,255,255,0.10);
  --accent: #256abf;
  --accent-wash: rgba(37,106,191,0.16);
  --accent-2: #d95926;
  --accent-2-wash: rgba(217,89,38,0.18);
  --good: #0ca30c;
}
:root[data-theme="light"] .nimbus-viz {
  --surface-1: #fcfcfb;
  --page-plane: #f9f9f7;
  --text-primary: #0b0b0b;
  --text-secondary: #52514e;
  --text-muted: #898781;
  --gridline: #e1e0d9;
  --baseline: #c3c2b7;
  --border: rgba(11,11,11,0.10);
  --accent: #184f95;
  --accent-wash: rgba(24,79,149,0.10);
  --accent-2: #eb6834;
  --accent-2-wash: rgba(235,104,52,0.10);
  --good: #006300;
}

.nimbus-viz .kpi-row {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
  margin-bottom: 16px;
}
.nimbus-viz .stat-tile {
  background: var(--surface-1);
  border: 1px solid var(--border);
  border-radius: 10px;
  padding: 14px 16px;
}
.nimbus-viz .stat-label {
  font-size: 0.78rem;
  color: var(--text-secondary);
}
.nimbus-viz .stat-value {
  font-size: 1.6rem;
  font-weight: 600;
  margin-top: 4px;
}
.nimbus-viz .stat-delta {
  font-size: 0.8rem;
  color: var(--good);
  margin-top: 2px;
}

.nimbus-viz .dash-label {
  font-size: 0.72rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  color: var(--accent);
  margin: 4px 0 10px;
}
.nimbus-viz .dash-2 .dash-label { color: var(--accent-2); }

.nimbus-viz .chart-card {
  background: var(--surface-1);
  border: 1px solid var(--border);
  border-radius: 10px;
  padding: 16px 18px 8px;
  margin-bottom: 16px;
}
.nimbus-viz .chart-title {
  font-size: 0.92rem;
  font-weight: 600;
  margin-bottom: 2px;
}
.nimbus-viz .chart-subtitle {
  font-size: 0.78rem;
  color: var(--text-secondary);
  margin-bottom: 8px;
}
.nimbus-viz svg { width: 100%; height: auto; display: block; }
.nimbus-viz .grid-line { stroke: var(--gridline); stroke-width: 1; }
.nimbus-viz .axis-line { stroke: var(--baseline); stroke-width: 1; }
.nimbus-viz .axis-label { fill: var(--text-muted); font-size: 11px; }
.nimbus-viz .value-label { fill: var(--text-primary); font-size: 12px; font-weight: 600; }
.nimbus-viz .cat-label { fill: var(--text-secondary); font-size: 12px; }
.nimbus-viz .annotation-label { fill: var(--text-secondary); font-size: 11px; }

.nimbus-viz .trend-line { fill: none; stroke: var(--accent); stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
.nimbus-viz .trend-area { fill: var(--accent-wash); }
.nimbus-viz .trend-dot { fill: var(--accent); stroke: var(--surface-1); stroke-width: 2; }
.nimbus-viz .bar { fill: var(--accent); }

.nimbus-viz .dash-2 .trend-line { stroke: var(--accent-2); }
.nimbus-viz .dash-2 .trend-area { fill: var(--accent-2-wash); }
.nimbus-viz .dash-2 .trend-dot { fill: var(--accent-2); stroke: var(--surface-1); }
.nimbus-viz .dash-2 .bar { fill: var(--accent-2); }

.nimbus-viz .annotation-dot { fill: var(--text-muted); }
.nimbus-viz .annotation-leader { stroke: var(--text-muted); stroke-width: 1; }
.nimbus-viz details.table-toggle { margin: 6px 0 10px; }
.nimbus-viz details.table-toggle summary {
  font-size: 0.78rem; color: var(--text-secondary); cursor: pointer;
}
.nimbus-viz table.viz-table {
  width: 100%; border-collapse: collapse; font-size: 0.82rem; margin-top: 8px;
}
.nimbus-viz table.viz-table th, .nimbus-viz table.viz-table td {
  text-align: left; padding: 4px 8px; border-bottom: 1px solid var(--gridline);
}
@media (max-width: 600px) {
  .nimbus-viz .kpi-row { grid-template-columns: repeat(2, 1fr); }
}
</style>

<div class="dash-1">
<div class="dash-label">Dashboard 1 &middot; Traffic</div>

<div class="kpi-row">
  <div class="stat-tile">
    <div class="stat-label">Page views (H1)</div>
    <div class="stat-value">92.4K</div>
    <div class="stat-delta">&#9650; 38% vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Unique visitors</div>
    <div class="stat-value">18.7K</div>
    <div class="stat-delta">&#9650; 24% vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Avg. time on page</div>
    <div class="stat-value">2m 51s</div>
    <div class="stat-delta">&#9650; 45% vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Bounce rate</div>
    <div class="stat-value">34%</div>
    <div class="stat-delta">&#9660; 17 pts vs. H2</div>
  </div>
</div>

<div class="chart-card">
  <div class="chart-title">Monthly page views</div>
  <div class="chart-subtitle">Nimbus Docs &middot; Jan&ndash;Jun</div>
  <svg viewBox="0 0 640 280" role="img" aria-label="Line chart of monthly page views from January to June, rising from about 11,200 to 21,500 after a navigation restructure in March.">
    <line class="grid-line" x1="50" y1="20" x2="620" y2="20"></line>
    <line class="grid-line" x1="50" y1="76" x2="620" y2="76"></line>
    <line class="grid-line" x1="50" y1="132" x2="620" y2="132"></line>
    <line class="grid-line" x1="50" y1="188" x2="620" y2="188"></line>
    <line class="axis-line" x1="50" y1="244" x2="620" y2="244"></line>

    <text class="axis-label" x="44" y="24" text-anchor="end">24K</text>
    <text class="axis-label" x="44" y="80" text-anchor="end">18K</text>
    <text class="axis-label" x="44" y="136" text-anchor="end">12K</text>
    <text class="axis-label" x="44" y="192" text-anchor="end">6K</text>
    <text class="axis-label" x="44" y="248" text-anchor="end">0</text>

    <text class="axis-label" x="50" y="262" text-anchor="middle">Jan</text>
    <text class="axis-label" x="164" y="262" text-anchor="middle">Feb</text>
    <text class="axis-label" x="278" y="262" text-anchor="middle">Mar</text>
    <text class="axis-label" x="392" y="262" text-anchor="middle">Apr</text>
    <text class="axis-label" x="506" y="262" text-anchor="middle">May</text>
    <text class="axis-label" x="620" y="262" text-anchor="middle">Jun</text>

    <path class="trend-area" d="M50.0,244 L50.0,139.5 L164.0,152.5 L278.0,118.9 L392.0,86.3 L506.0,61.1 L620.0,43.3 L620.0,244 Z"></path>
    <path class="trend-line" d="M50.0,139.5 L164.0,152.5 L278.0,118.9 L392.0,86.3 L506.0,61.1 L620.0,43.3"></path>

    <circle class="annotation-dot" cx="278" cy="118.9" r="3"></circle>
    <line class="annotation-leader" x1="278" y1="118.9" x2="278" y2="10"></line>
    <text class="annotation-label" x="278" y="10" text-anchor="middle">Nav restructured</text>

    <circle class="trend-dot" cx="620" cy="43.3" r="5"></circle>
    <text class="value-label" x="614" y="34" text-anchor="end">21.5K</text>
  </svg>
  <details class="table-toggle">
    <summary>View as table</summary>
    <table class="viz-table">
      <tr><th>Month</th><th>Page views</th></tr>
      <tr><td>Jan</td><td>11,200</td></tr>
      <tr><td>Feb</td><td>9,800</td></tr>
      <tr><td>Mar (nav restructured)</td><td>13,400</td></tr>
      <tr><td>Apr</td><td>16,900</td></tr>
      <tr><td>May</td><td>19,600</td></tr>
      <tr><td>Jun</td><td>21,500</td></tr>
    </table>
  </details>
</div>

<div class="chart-card">
  <div class="chart-title">Page views by content category</div>
  <div class="chart-subtitle">Nimbus Docs &middot; H1, ranked</div>
  <svg viewBox="0 0 640 220" role="img" aria-label="Bar chart ranking content categories by page views: Getting Started 25,900, Installation Guides 22,700, API Reference 20,300, Troubleshooting 14,600, Release Notes 8,900.">
    <text class="cat-label" x="0" y="26" dominant-baseline="middle">Getting Started</text>
    <path class="bar" d="M180.0,12.0 L596.0,12.0 Q600.0,12.0 600.0,16.0 L600.0,28.0 Q600.0,32.0 596.0,32.0 L180.0,32.0 Z"></path>
    <text class="value-label" x="608.0" y="26.0" dominant-baseline="middle">25.9K</text>

    <text class="cat-label" x="0" y="70" dominant-baseline="middle">Installation Guides</text>
    <path class="bar" d="M180.0,56.0 L544.1,56.0 Q548.1,56.0 548.1,60.0 L548.1,72.0 Q548.1,76.0 544.1,76.0 L180.0,76.0 Z"></path>
    <text class="value-label" x="556.1" y="70.0" dominant-baseline="middle">22.7K</text>

    <text class="cat-label" x="0" y="114" dominant-baseline="middle">API Reference</text>
    <path class="bar" d="M180.0,100.0 L505.2,100.0 Q509.2,100.0 509.2,104.0 L509.2,116.0 Q509.2,120.0 505.2,120.0 L180.0,120.0 Z"></path>
    <text class="value-label" x="517.2" y="114.0" dominant-baseline="middle">20.3K</text>

    <text class="cat-label" x="0" y="158" dominant-baseline="middle">Troubleshooting</text>
    <path class="bar" d="M180.0,144.0 L412.8,144.0 Q416.8,144.0 416.8,148.0 L416.8,160.0 Q416.8,164.0 412.8,164.0 L180.0,164.0 Z"></path>
    <text class="value-label" x="424.8" y="158.0" dominant-baseline="middle">14.6K</text>

    <text class="cat-label" x="0" y="202" dominant-baseline="middle">Release Notes</text>
    <path class="bar" d="M180.0,188.0 L320.3,188.0 Q324.3,188.0 324.3,192.0 L324.3,204.0 Q324.3,208.0 320.3,208.0 L180.0,208.0 Z"></path>
    <text class="value-label" x="332.3" y="202.0" dominant-baseline="middle">8.9K</text>
  </svg>
  <details class="table-toggle">
    <summary>View as table</summary>
    <table class="viz-table">
      <tr><th>Category</th><th>Page views</th></tr>
      <tr><td>Getting Started</td><td>25,900</td></tr>
      <tr><td>Installation Guides</td><td>22,700</td></tr>
      <tr><td>API Reference</td><td>20,300</td></tr>
      <tr><td>Troubleshooting</td><td>14,600</td></tr>
      <tr><td>Release Notes</td><td>8,900</td></tr>
    </table>
  </details>
</div>
</div>

<div class="dash-2">
<div class="dash-label">Dashboard 2 &middot; Search behavior</div>

<div class="kpi-row">
  <div class="stat-tile">
    <div class="stat-label">Total searches (H1)</div>
    <div class="stat-value">34.8K</div>
    <div class="stat-delta">&#9650; 19% vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Zero-result rate</div>
    <div class="stat-value">12%</div>
    <div class="stat-delta">&#9660; 15 pts vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Avg. position clicked</div>
    <div class="stat-value">2.3</div>
    <div class="stat-delta">&#9660; 1.4 vs. H2</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">No-click searches</div>
    <div class="stat-value">18%</div>
    <div class="stat-delta">&#9660; 9 pts vs. H2</div>
  </div>
</div>

<div class="chart-card">
  <div class="chart-title">Zero-result search rate</div>
  <div class="chart-subtitle">Nimbus Docs &middot; Jan&ndash;Jun, share of searches returning no results</div>
  <svg viewBox="0 0 640 280" role="img" aria-label="Line chart of the zero-result search rate from January to June, falling from 27% to 11% after the information architecture was reorganized around task-based search terms in April.">
    <line class="grid-line" x1="50" y1="20" x2="620" y2="20"></line>
    <line class="grid-line" x1="50" y1="94.7" x2="620" y2="94.7"></line>
    <line class="grid-line" x1="50" y1="169.3" x2="620" y2="169.3"></line>
    <line class="axis-line" x1="50" y1="244" x2="620" y2="244"></line>

    <text class="axis-label" x="44" y="24" text-anchor="end">30%</text>
    <text class="axis-label" x="44" y="98.7" text-anchor="end">20%</text>
    <text class="axis-label" x="44" y="173.3" text-anchor="end">10%</text>
    <text class="axis-label" x="44" y="248" text-anchor="end">0%</text>

    <text class="axis-label" x="50" y="262" text-anchor="middle">Jan</text>
    <text class="axis-label" x="164" y="262" text-anchor="middle">Feb</text>
    <text class="axis-label" x="278" y="262" text-anchor="middle">Mar</text>
    <text class="axis-label" x="392" y="262" text-anchor="middle">Apr</text>
    <text class="axis-label" x="506" y="262" text-anchor="middle">May</text>
    <text class="axis-label" x="620" y="262" text-anchor="middle">Jun</text>

    <path class="trend-area" d="M50.0,244 L50.0,42.4 L164.0,49.9 L278.0,64.8 L392.0,94.7 L506.0,132.0 L620.0,161.9 L620.0,244 Z"></path>
    <path class="trend-line" d="M50.0,42.4 L164.0,49.9 L278.0,64.8 L392.0,94.7 L506.0,132.0 L620.0,161.9"></path>

    <circle class="annotation-dot" cx="392" cy="94.7" r="3"></circle>
    <line class="annotation-leader" x1="392" y1="94.7" x2="392" y2="10"></line>
    <text class="annotation-label" x="392" y="10" text-anchor="middle">IA reorganized around tasks</text>

    <circle class="trend-dot" cx="620" cy="161.9" r="5"></circle>
    <text class="value-label" x="614" y="180" text-anchor="end">11%</text>
  </svg>
  <details class="table-toggle">
    <summary>View as table</summary>
    <table class="viz-table">
      <tr><th>Month</th><th>Zero-result rate</th></tr>
      <tr><td>Jan</td><td>27%</td></tr>
      <tr><td>Feb</td><td>26%</td></tr>
      <tr><td>Mar</td><td>24%</td></tr>
      <tr><td>Apr (IA reorganized around tasks)</td><td>20%</td></tr>
      <tr><td>May</td><td>15%</td></tr>
      <tr><td>Jun</td><td>11%</td></tr>
    </table>
  </details>
</div>

<div class="chart-card">
  <div class="chart-title">Top search terms</div>
  <div class="chart-subtitle">Nimbus Docs &middot; H1, ranked by search volume</div>
  <svg viewBox="0 0 640 220" role="img" aria-label='Bar chart ranking top search terms by volume: "installation" 4,850, "api authentication" 3,920, "getting started" 3,410, "error 403" 2,760, "credentials setup" 1,980.'>
    <text class="cat-label" x="0" y="26" dominant-baseline="middle">&ldquo;installation&rdquo;</text>
    <path class="bar" d="M220.0,12.0 L596.0,12.0 Q600.0,12.0 600.0,16.0 L600.0,28.0 Q600.0,32.0 596.0,32.0 L220.0,32.0 Z"></path>
    <text class="value-label" x="608.0" y="26.0" dominant-baseline="middle">4.85K</text>

    <text class="cat-label" x="0" y="70" dominant-baseline="middle">&ldquo;api authentication&rdquo;</text>
    <path class="bar" d="M220.0,56.0 L523.1,56.0 Q527.1,56.0 527.1,60.0 L527.1,72.0 Q527.1,76.0 523.1,76.0 L220.0,76.0 Z"></path>
    <text class="value-label" x="535.1" y="70.0" dominant-baseline="middle">3.92K</text>

    <text class="cat-label" x="0" y="114" dominant-baseline="middle">&ldquo;getting started&rdquo;</text>
    <path class="bar" d="M220.0,100.0 L483.2,100.0 Q487.2,100.0 487.2,104.0 L487.2,116.0 Q487.2,120.0 483.2,120.0 L220.0,120.0 Z"></path>
    <text class="value-label" x="495.2" y="114.0" dominant-baseline="middle">3.41K</text>

    <text class="cat-label" x="0" y="158" dominant-baseline="middle">&ldquo;error 403&rdquo;</text>
    <path class="bar" d="M220.0,144.0 L432.2,144.0 Q436.2,144.0 436.2,148.0 L436.2,160.0 Q436.2,164.0 432.2,164.0 L220.0,164.0 Z"></path>
    <text class="value-label" x="444.2" y="158.0" dominant-baseline="middle">2.76K</text>

    <text class="cat-label" x="0" y="202" dominant-baseline="middle">&ldquo;credentials setup&rdquo;</text>
    <path class="bar" d="M220.0,188.0 L371.1,188.0 Q375.1,188.0 375.1,192.0 L375.1,204.0 Q375.1,208.0 371.1,208.0 L220.0,208.0 Z"></path>
    <text class="value-label" x="383.1" y="202.0" dominant-baseline="middle">1.98K</text>
  </svg>
  <details class="table-toggle">
    <summary>View as table</summary>
    <table class="viz-table">
      <tr><th>Search term</th><th>Volume</th></tr>
      <tr><td>&ldquo;installation&rdquo;</td><td>4,850</td></tr>
      <tr><td>&ldquo;api authentication&rdquo;</td><td>3,920</td></tr>
      <tr><td>&ldquo;getting started&rdquo;</td><td>3,410</td></tr>
      <tr><td>&ldquo;error 403&rdquo;</td><td>2,760</td></tr>
      <tr><td>&ldquo;credentials setup&rdquo;</td><td>1,980</td></tr>
    </table>
  </details>
</div>
</div>

</div>

## Findings &amp; changes driven

**Traffic**

| Finding | Action taken | Result |
|---|---|---|
| The installation guide had the highest bounce rate (61%) and was the top exit page | Split it into platform-specific guides (Mac/Linux/Windows) with prerequisites called out up front | Bounce rate dropped to 29%; time on page up 45% |
| 40% of "Getting Started" visitors left before reaching a working code sample | Moved the first runnable example above the fold | Scroll depth to code samples increased 35% |

**Search**

| Finding | Action taken | Result |
|---|---|---|
| "credentials setup" and "error 403" were top zero-result queries: no page used that phrasing | Added alias tags mapping common support-ticket language to the credentials and auth pages, and retitled a buried section to match | Zero-result rate for those queries fell from 68% to 9% |
| Search logs skewed task-based ("how do I install on LVDI") while the nav was organized by product area | Reorganized the top-level navigation around tasks/workflows instead of product areas | Overall zero-result rate fell from 27% to 11%; no-click rate fell from 27% to 18% |
| "api authentication" ranked in the top 5 search terms but only existed buried inside a larger reference doc | Split it into its own page with a title matching the query | Average clicked position for that query improved from #4 to #1 |

These changes fed directly into how I prioritized the documentation backlog each quarter: traffic and search-log data told us *where* to invest, and support-ticket tagging told us whether the fix actually worked.
