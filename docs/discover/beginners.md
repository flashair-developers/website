---
layout: default
title: 初心者向け技術ガイド
parent: 開発を始めよう
nav_order: 3
---

# 初心者向け技術ガイド
{: .no_toc }

## 初心者向け技術ガイド
{: .no_toc }

無線LAN機能とWebサーバーを内蔵するFlashAirは、そのしくみを理解することで、画像だけではなく動画や文書、音声データを取得したり、FlashAir APIを利用して様々な設定のカスタマイズを行ったり、FlashAir対応のアプリを開発したり、既存アプリの機能を拡張したりすることができます。


## 必要とされる基礎知識
{: .no_toc }

1. TOC
{:toc}

---
### HTTP

HTTPとは、World Wide Webで用いられるプロトコル（規定）であり、WebサーバーとWebブラウザとが通信する際の様々なコマンドに対する処理を定義しています。 
FlashAirはWebサーバーを内蔵していますので、無線LAN上でHTTP経由の通信を行うことができます。

HTTPによる制御については、こちらに紹介されています。

- [FlashAirアプリ開発の概要]({{ site.baseurl }}/docs/discover/app)

参考
{: .label }
[IT用語辞典](http://e-words.jp/w/HTTP.html){: target="_blank" }、[Wikipedia](https://ja.wikipedia.org/wiki/Hypertext_Transfer_Protocol){: target="_blank" }

---
### HTML

HTMLとは、World Wide Web上のドキュメントを作成するために用いられるマークアップ言語です。HTMLは、様々なタグと属性によってWebドキュメントの文書構造やレイアウトなどを定義します。 
HTMLを編集することで、WebブラウザでFlashAirコンテンツを見る場合のデザインを変えたり、独自のブラウザユーティリティを作成することができます。

詳しくは、こちらに紹介されています。

- [ブラウザユーティリティ]({{ site.baseurl }}/docs/api/utility)
- [ウェブブラウザ向けFlashAirアプリ開発の概要]({{ site.baseurl }}/docs/tutorials/web/1)

参考
{: .label }
- HTMLの基本：[HTMLクイックリファレンス](http://www.htmq.com/htmlkihon/003.shtml){: target="_blank" }
- WEBレッスンを受ける：[HTML入門](http://dotinstall.com/lessons/basic_html_v3){: target="_blank" }

---
### CSS

CSSとは、どのようなスタイルでWEBページが表示されるかをHTMLに加えて指定するための規格です。HTMLが文書構造を定義するのに対し、CSSは見栄えを定義します。 
CSSを編集することで、WebブラウザでFlashAirコンテンツを見る場合のデザインを変えたり、独自のブラウザユーティリティを作成することができます。

詳しくは、こちらに紹介されています。

- [ブラウザユーティリティ]({{ site.baseurl }}/docs/api/utility)
- [ウェブブラウザ向けFlashAirアプリ開発の概要]({{ site.baseurl }}/docs/tutorials/web/1)

参考
{: .label }
- CSSの書き方：[HTMLクイックリファレンス](http://www.htmq.com/csskihon/003.shtml){: target="_blank" }
- スタイルシートリファレンス（目的別）：[HTMLクイックリファレンス](http://www.htmq.com/style/index.shtml){: target="_blank" }
- WEBレッスンを受ける：[ドットインストール - CSS入門](http://dotinstall.com/lessons/basic_css_v3){: target="_blank" }

---
### JavaScript / jQuery

JavaScriptとは、Webサイトにインタラクティブなデザインを作成することができるスクリプト言語です。HTMLのソースコードに埋め込んで記述することができ、コンテンツに動的な効果をつけることができます。

参考
{: .label }
[IT用語辞典](http://e-words.jp/w/JavaScript.html"){: target="_blank" }、[Wikipedia](https://ja.wikipedia.org/wiki/JavaScript"){: target="_blank" }

また、jQueryは、JavaScriptの無料のオープンソースのライブラリーです。jQueryを利用することで、JavaScriptのコード量を減らし、手軽にインタラクティブなデザインを作成することができます。

使用例については、こちらに紹介されています。

- [コンテンツリストの取得1]({{ site.baseurl }}/docs/tutorials/web/2)

参考
{: .label }
- [jQuery公式ページ](http://jquery.com/"){: target="_blank" }（英語）
- WEBレッスンを受ける：[ドットインストール - jQuery入門](http://dotinstall.com/lessons/basic_jquery_v2){: target="_blank" }

---
### CGI

CGIプログラムはWebサーバーがユーザーと双方向で動的なやりとりをする方法として一般的です。CGIはWebサーバー上で処理を行います。 
FlashAirでは、FlashAirの情報を読み取る、設定を変更するなどの特別な操作が行えるCGI（FlashAir API）をご提供しています。

詳しくは、こちらに紹介されています。

- [command.cgi]({{ site.baseurl }}/docs/api/command.cgi)：無線LAN経由でFlashAirの情報を取得したり、設定を変更したりできます。
- [config.cgi]({{ site.baseurl }}/docs/api/config.cgi)：FlashAirの設定を変更するために使います。
- [thumbnail.cgi]({{ site.baseurl }}/docs/api/thumbnail.cgi)：画像のサムネイルを取得するために使います。
- [upload.cgi]({{ site.baseurl }}/docs/api/upload.cgi)：ネットワーク越しにSDメモリカードの中身を変更するために使います。

参考
{: .label }
[IT用語辞典](http://e-words.jp/w/CGI.html){: target="_blank" }、[Wikipedia](https://ja.wikipedia.org/wiki/Common_Gateway_Interface){: target="_blank" }

---
### 無線LAN

無線LANとは、無線方式によりデータの送受信を行うLAN（local-area network）の形式です。 
FlashAirは、無線LAN機能を内蔵しており、ネットワークに接続する方法には、アクセスポイントモード、ステーションモード、インターネット同時接続モードがあります。通常、FlashAirはアクセスポイント（AP）モードになっており、いわゆる無線LAN親機として動作しています。

詳しくは、こちらに紹介されています。

- [ステーションモードの利用]({{ site.baseurl }}/docs/tutorials/advanced/1)：FlashAirを無線LAN子機として使うモードです。
- [インターネット同時接続モードの利用]({{ site.baseurl }}/docs/tutorials/advanced/3)：PCやスマートフォンなどのデバイスからFlashAirを経由して、インターネットなどの別のネットワークと通信することができるモードです。

参考
{: .label }
[IT用語辞典](http://e-words.jp/w/%E7%84%A1%E7%B7%9ALAN.html){: target="_blank" }、[Wikipedia](https://ja.wikipedia.org/wiki/%E7%84%A1%E7%B7%9ALAN){: target="_blank" }

---
### Android

Androidとは、グーグル社がライセンスフリーで提供する、携帯情報端末向けのオペレーティングシステムです。 
FlashAirデベロッパーズでは、Androidアプリ開発向けのチュートリアルを紹介しています。

- [Android向けチュートリアル]({{ site.baseurl }}/docs/tutorials/android/)

参考
{: .label }
[Android公式ページ](https://www.android.com/intl/ja_jp/){: target="_blank" }、[Android Developers - Android 入門](https://developer.android.com/guide/index.html){: target="_blank" }

---
### iOS

iOSとは、アップル社が提供する、iPhoneやiPad、iPod touch、Apple TVなどの携帯情報端末向けのオペレーティングシステムです。 
FlashAirデベロッパーズでは、iOSアプリ開発向けのチュートリアルを紹介しています。

- [iOS向けチュートリアル]({{ site.baseurl }}/docs/tutorials/ios/)

参考
{: .label }
[iOS公式ページ](http://www.apple.com/jp/ios/ios-10/){: target="_blank" }、[iOS Developers](https://developer.apple.com/ios/){: target="_blank" }（英語）

---
### Lua

Luaは、パワフルで、高速で、軽量で、埋め込み可能な、スクリプト言語です。 
Lua言語で書かれたスクリプトファイルをFlashAirに保存することで、以下のような簡易なバッチ処理が行えます。

- FlashAirに保存されたファイルを、任意のサーバー等にアップロード。（ダイレクトアップロード）
- FlashAirにファイルを生成する。
- 動的にHTMLファイルを生成する。

詳しくは、こちらに紹介されています。

- [Lua機能]({{ site.baseurl }}/docs/api/lua/)

参考
{: .label }
[Lua公式ページ - Getting started](http://www.lua.org/start.html){: target="_blank" }（英語）、[Wikipedia](https://ja.wikipedia.org/wiki/Lua){: target="_blank" }

---
### Arduino

Arduinoは、製品プロトタイピングなどの用途でとても人気のあるマイコンボードです。オープンハードウェアプラットフォームを謳って、設計や回路図が公開されており、ユーザーがクローンを製造したり、改造して独自のArduino互換ボードを作ることが容易です。 
FlashAirをSDメモリカードホスト機器から制御して、 無線LANのON/OFFやAPモード・STAモードの切り替え、あるいはHTTP通信をArduinoから行うことができます。

詳しくは、こちらに紹介されています。

- [ArduinoでFlashAir制御の概要]({{ site.baseurl }}/docs/tutorials/arduino/1)

参考
{: .label }
[Arduino 公式ページ](https://www.arduino.cc/){: target="_blank" }（英語）、 [Wikipedia](https://ja.wikipedia.org/wiki/Arduino){: target="_blank" }