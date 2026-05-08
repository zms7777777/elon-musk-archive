---
---
window.MUSK_ARCHIVE_INDEX = [
  {% for item in site.data.posts_timeline %}
  {
    title: {{ item.title | jsonify }},
    section: "Posts",
    text: {{ item.stage | append: ' ' | append: item.setback | append: ' ' | append: item.encouragement | append: ' ' | append: item.note | jsonify }},
    url: "{{ '/posts/' | relative_url }}"
  },
  {% endfor %}
  {% for item in site.data.publications %}
  {
    title: {{ item.title | jsonify }},
    section: "Publications",
    text: {{ item.type | append: ' ' | append: item.summary | jsonify }},
    url: "{{ '/publications/' | relative_url }}"
  },
  {% endfor %}
  {% for item in site.data.people %}
  {
    title: {{ item.name | jsonify }},
    section: "People",
    text: {{ item.role | append: ' ' | append: item.company | append: ' ' | append: item.achievements | append: ' ' | append: item.contact | jsonify }},
    url: "{{ '/people/' | relative_url }}"
  },
  {% endfor %}
  {% for item in site.data.teaching.principles %}
  {
    title: {{ item.title | jsonify }},
    section: "Teaching",
    text: {{ item.body | jsonify }},
    url: "{{ '/teaching/' | relative_url }}"
  }{% unless forloop.last %},{% endunless %}
  {% endfor %}
];
