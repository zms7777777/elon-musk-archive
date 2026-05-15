---
layout: page
title: "Collaborations"
description: "Selected public collaborators, partners, suppliers, and investor-side organizations."
permalink: /collaborations/
---

<div class="collaboration-list">
  {% for group in site.data.collaborations %}
    <section class="collaboration-group">
      <h2>{{ group.company }}</h2>
      <p class="muted">{{ group.intro }}</p>
      <div class="collaboration-grid">
        {% for item in group.items %}
          <article>
            <p class="eyebrow">{{ item.type }}</p>
            <h3>{{ item.name }}</h3>
            <p>{{ item.summary }}</p>
            <a class="text-action" href="{{ item.url }}" target="_blank" rel="noopener noreferrer">Visit source</a>
          </article>
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>
