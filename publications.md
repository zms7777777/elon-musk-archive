---
layout: page
title: "Publications"
description: "Reverse chronological works, companies, and public milestones."
permalink: /publications/
---

<div class="archive-list">
  {% for item in site.data.publications %}
    <article class="archive-row">
      <time>{{ item.year }}</time>
      <div>
        <p class="tag">{{ item.type }}</p>
        <h2>{{ item.title }}</h2>
        <p>{{ item.summary }}</p>
      </div>
    </article>
  {% endfor %}
</div>
