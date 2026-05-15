---
---
window.MUSK_ARCHIVE_INDEX = [
  {% for item in site.data.posts_timeline %}
  {
    title: {{ item.title | jsonify }},
    section: "News",
    text: {{ item.stage | append: ' ' | append: item.setback | append: ' ' | append: item.encouragement | append: ' ' | append: item.note | jsonify }},
    url: "{{ '/news/' | relative_url }}"
  },
  {% endfor %}
  {% for item in site.data.projects %}
  {
    title: {{ item.title | jsonify }},
    section: "Project",
    text: {{ item.category | append: ' ' | append: item.summary | append: ' ' | append: item.detail | jsonify }},
    url: "{{ '/project/' | relative_url }}"
  },
  {% endfor %}
  {% for group in site.data.collaborations %}
    {% for item in group.items %}
  {
    title: {{ item.name | jsonify }},
    section: "Collaborations",
    text: {{ group.company | append: ' ' | append: item.type | append: ' ' | append: item.summary | jsonify }},
    url: "{{ '/collaborations/' | relative_url }}"
  },
    {% endfor %}
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
