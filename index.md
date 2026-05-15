---
layout: default
title: "Neuralink Brain Interface Group"
description: "A concise academic-style archive about Elon Musk's teams, milestones, and operating rules."
permalink: /
---

<section class="home-hero">
  <h1>Neuralink Brain Interface Group</h1>

  <div class="photo-carousel hero-carousel" data-carousel>
    <div class="carousel-frame">
      {% for photo in site.data.home.group_photos %}
        <figure class="carousel-slide{% if forloop.first %} is-active{% endif %}" data-carousel-slide>
          {% assign photo_image = photo.image %}
          <img src="{% if photo_image contains '://' %}{{ photo_image }}{% else %}{{ photo_image | relative_url }}{% endif %}" alt="{{ photo.title }}">
          <figcaption>
            <strong>{{ photo.title }}</strong>
            <span>{{ photo.caption }}</span>
          </figcaption>
        </figure>
      {% endfor %}
    </div>
    <div class="carousel-controls">
      <button type="button" data-carousel-prev aria-label="Previous group photo">‹</button>
      <button type="button" data-carousel-next aria-label="Next group photo">›</button>
    </div>
  </div>

  <div class="home-intro intro-columns">
    <div class="intro-copy">
      <p>The Neuralink Brain Interface Group focuses on computational methods for turning neural and biosignal data into useful measurements. Its work spans high-resolution brain recordings, real-time spike sorting, robotic kinematics, sensory feedback models, and clinically guided engineering.</p>
    </div>
    <div class="intro-copy">
      <p>Led by Elon Musk, the group connects neurosurgery, computer science, electrical engineering, rehabilitation medicine, and AI. This archive highlights how interdisciplinary teams convert frontier ideas into testable systems and public milestones.</p>
    </div>
  </div>
</section>

<section class="news-section">
  <p class="section-kicker">Latest News</p>
  <h2>Recent public themes to watch</h2>
  <div class="news-grid">
    {% for item in site.data.home.latest_news %}
      <article class="news-card">
        {% assign news_image = item.image %}
        <img src="{% if news_image contains '://' %}{{ news_image }}{% else %}{{ news_image | relative_url }}{% endif %}" alt="{{ item.title }}">
        <div>
          <h3>{{ item.title }}</h3>
          <p>{{ item.summary }}</p>
        </div>
      </article>
    {% endfor %}
  </div>
</section>
