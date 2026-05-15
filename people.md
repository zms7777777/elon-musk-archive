---
layout: default
title: "People"
description: "Core operators, portraits, hover previews, and detailed public profiles."
permalink: /people/
---

<section class="team-page">
  <header class="team-heading compact-heading">
    <h1>Meet the Team</h1>
    <h2>Principal Investigator</h2>
  </header>

  <article class="principal-card principal-wide">
    <button class="principal-avatar" type="button" data-person-open="person-elon">
      <img src="https://upload.wikimedia.org/wikipedia/commons/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg" alt="Elon Musk portrait">
    </button>
    <div class="principal-summary">
      <h3>Elon Musk</h3>
      <p>Principal figure for this archive: entrepreneur, engineer, product architect, and founder/operator across SpaceX, Tesla, Neuralink, xAI, and infrastructure ventures.</p>
      <div class="social-links detail-socials">
        <a href="https://x.com/elonmusk" target="_blank" rel="noopener noreferrer" aria-label="X / Twitter">X</a>
        <a href="https://www.youtube.com/@SpaceX" target="_blank" rel="noopener noreferrer" aria-label="YouTube">YT</a>
        <a href="https://www.tesla.com/elon-musk" target="_blank" rel="noopener noreferrer" aria-label="Tesla profile">T</a>
      </div>
    </div>
  </article>

  <h2 class="team-subtitle">Core Operators</h2>
  <div class="avatar-grid portrait-grid">
    {% for person in site.data.people %}
      <button class="avatar-card" type="button" data-person-open="person-{{ forloop.index }}" aria-label="Open {{ person.name }} profile">
        <img src="{{ person.image }}" alt="{{ person.name }} portrait">
        <span class="hover-profile">
          <strong>{{ person.name }}</strong>
          <span>{{ person.degree }}</span>
          <span>{{ person.previous_short }}</span>
          <span>{{ person.role }}</span>
        </span>
      </button>
    {% endfor %}
  </div>

  <dialog class="person-dialog" id="person-elon">
    <button class="dialog-close" type="button" data-person-close aria-label="Close profile">×</button>
    <div class="dialog-profile">
      <img src="https://upload.wikimedia.org/wikipedia/commons/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg" alt="Elon Musk portrait">
      <div>
        <p class="section-kicker">Principal Investigator</p>
        <h3>Elon Musk</h3>
        <p>Entrepreneur and product architect associated with SpaceX, Tesla, Neuralink, xAI, The Boring Company, and long-horizon engineering programs.</p>
        <p><strong>Contact:</strong> Use public company channels for official inquiries.</p>
        <div class="social-links detail-socials">
          <a href="https://x.com/elonmusk" target="_blank" rel="noopener noreferrer" aria-label="X / Twitter">X</a>
          <a href="https://www.youtube.com/@SpaceX" target="_blank" rel="noopener noreferrer" aria-label="YouTube">YT</a>
          <a href="https://www.tesla.com/elon-musk" target="_blank" rel="noopener noreferrer" aria-label="Tesla profile">T</a>
        </div>
      </div>
    </div>
  </dialog>

  {% for person in site.data.people %}
    <dialog class="person-dialog" id="person-{{ forloop.index }}">
      <button class="dialog-close" type="button" data-person-close aria-label="Close profile">×</button>
      <div class="dialog-profile">
        <img src="{{ person.image }}" alt="{{ person.name }} portrait">
        <div>
          <p class="section-kicker">{{ person.company }}</p>
          <h3>{{ person.name }}</h3>
          <p><strong>Current role:</strong> {{ person.role }}</p>
          <p><strong>Education:</strong> {{ person.university }}</p>
          <p><strong>Previous work:</strong> {{ person.previous }}</p>
          <p>{{ person.detail }}</p>
          <p><strong>Contact:</strong> {{ person.contact }}</p>
          <div class="social-links detail-socials">
            {% for social in person.socials %}
              <a href="{{ social.url }}" target="_blank" rel="noopener noreferrer" aria-label="{{ social.label }}">{{ social.icon }}</a>
            {% endfor %}
          </div>
        </div>
      </div>
    </dialog>
  {% endfor %}
</section>
