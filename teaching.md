---
layout: page
title: "Teaching"
description: "Operating principles, company rules, and repeatable engineering methods."
permalink: /teaching/
---

<section class="principles">
  {% for item in site.data.teaching.principles %}
    <article>
      <span>Principle</span>
      <h2>{{ item.title }}</h2>
      <p>{{ item.body }}</p>
    </article>
  {% endfor %}
</section>

<section class="rules">
  <h2>Company Rules</h2>
  <ol>
    {% for rule in site.data.teaching.rules %}
      <li>{{ rule }}</li>
    {% endfor %}
  </ol>
</section>
