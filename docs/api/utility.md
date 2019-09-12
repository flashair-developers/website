---
layout: tutorials-api
title: ブラウザユーティリティ
parent: APIガイド
nav_order: 6
---

# ブラウザユーティリティ

ブラウザユーティリティは、 FlashAirのコンテンツをウェブブラウザで見る場合に表示される画面のことです。

List.htmというHTMLファイルがその実体で、 これを変更することで、コンテンツの表示方法をカスタマイズすることができます。<br>
例えば、JavaScriptを使ったユーザーインターフェースを作ったり、 背景写真を組み合わせてフォトフレームのような見た目にすることもできます。

List.htmの編集方法については、[ウェブブラウザ向けテンプレート]({{ site.baseurl }}/docs/tutorials/web/)をご覧ください。

---
## List.htm

ディレクトリパスに対するGETリクエストが発行された場合、 FlashAirはこのファイルを読み込んでレスポンスとして返します。
その際、ファイル内に`<!--WLANSDJLST-->` というタグがあった場合、 下記のような対象ディレクトリのコンテンツリストに置き換えを行います。

<pre class="prettyprint nocode">
/DCIM,100__TSB,0,16,9944,129
/DCIM,0126_1.jpg,70408,32,17071,28040
</pre>

<span class="badge label-blue"></span> W-02カードでは, List.htm は存在せず、 ファームウェアに内蔵されたブラウザユーティリティが使われますが、
List.htmを作成すれば上記の説明通りにカスタマイズができます。 ただし、
`<!--WLANSDJLST-->` の置き換えルールが異なります。

<pre class="prettyprint">
wlansd.push({"r_uri":"/DCIM", "fname":"100__TSB", "fsize":0,"attr":16,"fdate":9944,"ftime":129});
wlansd.push({"r_uri":"/DCIM", "fname":"0126_1.jpg", "fsize":70408,"attr":32,"fdate":17071,"ftime":28040});
</pre>