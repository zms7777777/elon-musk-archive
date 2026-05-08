---
layout: page
title: "Posts"
description: "Life photos, setbacks, and self-encouragement across education and work."
permalink: /posts/
---

<div class="timeline">
  {% for item in site.data.posts_timeline %}
    <article class="timeline-item">
      <div class="timeline-year">{{ item.year }}</div>
      <div class="timeline-card">
        <img src="{{ item.image }}" alt="{{ item.title }}">
        <div class="timeline-body">
          <p class="eyebrow">{{ item.stage }}</p>
          <h2>{{ item.title }}</h2>
          <p><strong>Setback: </strong>{{ item.setback }}</p>
          <blockquote>{{ item.encouragement }}</blockquote>
          <p class="muted">{{ item.note }}</p>
        </div>
      </div>
    </article>
  {% endfor %}
</div>
