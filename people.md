---
layout: default
title: "People"
description: "Core operators, roles, portraits, public channels, and brief profiles."
permalink: /people/
---

<section class="team-page">
  <header class="team-heading">
    <h1>Meet the Team</h1>
    <h2>Principal Investigator</h2>
  </header>

  <article class="principal-card">
    <img src="https://upload.wikimedia.org/wikipedia/commons/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg" alt="Elon Musk portrait">
    <h3>Elon Musk</h3>
    <p>Founder and product architect focused on spaceflight, electric vehicles, brain interfaces, AI, and infrastructure.</p>
  </article>

  <h2 class="team-subtitle">Core Operators</h2>
  <div class="people-grid portrait-grid">
    {% for person in site.data.people %}
      <article class="person-card portrait-card">
        <img src="{{ person.image }}" alt="{{ person.name }} portrait">
        <h3>{{ person.name }}</h3>
        <p class="role-line">{{ person.role }}</p>
        <p class="mini-bio">{{ person.company }}</p>
        <p class="mini-bio muted">{{ person.previous }}</p>
        <div class="social-links">
          {% for social in person.socials %}
            <a href="{{ social.url }}" target="_blank" rel="noopener noreferrer" aria-label="{{ social.label }}">
              {{ social.icon }}
            </a>
          {% endfor %}
        </div>
      </article>
    {% endfor %}
  </div>
</section>
