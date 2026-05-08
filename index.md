---
layout: default
title: "Neuralink Brain Interface Group"
description: "A concise academic-style archive about Elon Musk's teams, milestones, and operating rules."
permalink: /
---

<section class="home-hero">
  <h1>Neuralink Brain Interface Group</h1>
  <div class="home-intro">
    <div class="intro-copy">
      <p>The Neuralink Brain Interface Group at Neuralink Corporation (Neuralink) focuses on the design of computational algorithms to extract quantitative measures from neural data and other biosignal sources. While our emphasis is on high-resolution brain recordings (e.g., obtained via implanted microelectrode arrays, and guided by magnetic resonance imaging or computed tomography), our past and current work includes data ranging from real-time spike sorting, to robotic kinematics, and sensory feedback models. The group is led by Elon Musk.</p>
      <p>Our work is highly interdisciplinary and includes collaborators from a wide range of disciplines such as neurosurgery, computer science, electrical engineering, and rehabilitation medicine. Consequently, we publish in venues ranging from neural engineering journals to clinical neuroscience conferences. Our success is the joint success with our collaborators.</p>
    </div>

    <div class="photo-carousel" data-carousel>
      <div class="carousel-frame">
        {% for photo in site.data.home.group_photos %}
          <figure class="carousel-slide{% if forloop.first %} is-active{% endif %}" data-carousel-slide>
            <img src="{{ photo.image }}" alt="{{ photo.title }}">
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
  </div>
</section>

<section class="topic-section">
  <p class="section-kicker">Popular Topics</p>
  <h2>Explore our content by topic</h2>
  <div class="topic-grid">
    {% for topic in site.data.home.topics %}
      <a class="topic-pill" href="{{ topic.url }}" target="_blank" rel="noopener noreferrer">
        <strong>{{ topic.name }}</strong>
        <span>{{ topic.detail }}</span>
      </a>
    {% endfor %}
  </div>
</section>

<section class="news-section">
  <p class="section-kicker">Latest News</p>
  <h2>Recent public themes to watch</h2>
  <div class="news-grid">
    {% for item in site.data.home.latest_news %}
      <article class="news-card">
        <img src="{{ item.image }}" alt="{{ item.title }}">
        <div>
          <h3>{{ item.title }}</h3>
          <p>{{ item.summary }}</p>
        </div>
      </article>
    {% endfor %}
  </div>
</section>
