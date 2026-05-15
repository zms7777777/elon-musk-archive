---
layout: page
title: "Collaborations"
description: "Shareholder and investor snapshots for Tesla, SpaceX, and X.com."
permalink: /collaborations/
---

<div class="shareholder-list">
  {% for group in site.data.collaborations %}
    <section class="shareholder-group">
      <header>
        <h2>{{ group.company }}</h2>
        <p>{{ group.intro }}</p>
      </header>
      <div class="shareholder-grid">
        {% for item in group.items %}
          <article class="shareholder-card">
            <a class="shareholder-avatar" href="{{ item.url }}" target="_blank" rel="noopener noreferrer" aria-label="Open source for {{ item.name }}">
              <span>{{ item.initials }}</span>
            </a>
            <div class="shareholder-body">
              <p class="eyebrow">{{ item.type }}</p>
              <h3>{{ item.name }}</h3>
              <p class="stake-line">{{ item.stake }}</p>
              <p>{{ item.summary }}</p>
              <p class="muted">{{ item.detail }}</p>
              <a class="text-action" href="{{ item.url }}" target="_blank" rel="noopener noreferrer">Open public source</a>
            </div>
          </article>
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>
