---
layout: page
title: "Project"
description: "Project families grouped like a research lab portfolio."
permalink: /project/
---

<div class="project-grid">
  {% for project in site.data.projects %}
    <article class="project-card">
      {% assign project_image = project.image %}
      <img src="{% if project_image contains '://' %}{{ project_image }}{% else %}{{ project_image | relative_url }}{% endif %}" alt="{{ project.title }}">
      <div>
        <p class="eyebrow">{{ project.category }}</p>
        <h2>{{ project.title }}</h2>
        <p>{{ project.summary }}</p>
        <p class="muted">{{ project.detail }}</p>
        <a class="text-action" href="{{ project.url }}" target="_blank" rel="noopener noreferrer">Open official project source</a>
      </div>
    </article>
  {% endfor %}
</div>
