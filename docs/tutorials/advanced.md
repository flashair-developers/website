---
layout: default
title: 上級者向けチュートリアル
parent: チュートリアル
nav_order: 4
---

# 上級者向けチュートリアル

高度な機能やカスタマイズのためのチュートリアルを紹介しています。

<hr>
<h2 class="text-delta">Table of contents</h2>
<ul>
{% assign pages_list = site.html_pages | sort:"nav_order" %}
{% for node in pages_list %}
  {% unless node.nav_exclude %}
    {% if node.parent == "上級者向けチュートリアル" %}
     <li>
      <a href="{{ node.url | absolute_url }}">{{ node.title }}</a>
    </li>
    {% endif %}
  {% endunless %}
{% endfor %}
  <li>
    <a href="https://qiita.com/kyoso_bizdev/private/da5d386a01d56511cd73" target="_blank">FlashAirに書き込まれたcsvファイルをAmazon S3に転送し、さらにデータをDynamoDBに書き込む</a>
  </li>
</ul>