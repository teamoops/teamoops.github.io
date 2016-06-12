---
layout: page
title: about
permalink: /about/
---

# the team

<ul>
{% for p in site.data.members %}
<li>
<a href="https://github.com/{{p.github}}">{{p.name}}</a>
</li>
{% endfor %}
</ul>

# the projects

<ul>
{% for p in site.data.projects %}
<li>
<a href="{{p.url}}">{{p.name}}</a>
</li>
{% endfor %}
</ul>
