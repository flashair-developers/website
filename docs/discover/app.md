---
layout: default
title: FlashAirアプリ開発の概要
parent: 開発を始めよう
nav_order: 6
---

# FlashAirアプリ開発の概要

## FlashAirと対応アプリの開発

FlashAirはWebサーバーを内蔵しています。無線LAN親機（アクセスポイント, AP）として動作しているFlashAirに、無線LAN子機（ステーション, STA）として動作しているPCやスマートフォンといった無線LAN機器から接続し、HTTP (HyperText Transfer Protocol) 経由で通信することができます。

![FlashAirと対応アプリの開発]({{ site.baseurl }}/assets/images/flashair_device_connection_example.png){: .d-block }

HTTPによる制御では、以下のことができます。

<dl>
	<dt>Webサーバー</dt>
	<dd>
		FlashAir内のファイルにHTTP GETリクエストを発行することで、ファイルをダウンロードすることができます。また、FlashAirの情報を読み取る、設定を変更するなどの操作が行えるCGI (Common
		Gateway Interface)
		が用意されています。
	</dd>
	<dt>スクリプト</dt>
	<dd>Luaスクリプトの実行ができます。</dd>
	<dt>GPIO</dt>
	<dd>SD端子のGPIO制御ができます。</dd>
	<dt>その他</dt>
	<dd>SRAMの読み書きができます。</dd>
</dl>

![FlashAirと対応アプリの開発]({{ site.baseurl }}/assets/images/flashair-development-app.png){: .d-block }

---
## FlashAirとのHTTP通信の種類

無線LANを使ったHTTP通信を用いてFlashAirのデータにアクセスする方法が、Application Programming Interface (API) として定義されています。

### ファイルに対するGETコマンド
HTTPクライアントがFlashAir内のファイルに対してHTTP GETコマンドを発行すると、FlashAirはそのファイルのデータを返します。

### フォルダに対するGETコマンド
HTTPクライアントがフォルダに対してHTTP GETコマンドを発行すると、ブラウザユーティリティというWebページを返します。ブラウザユーティリティは、通常そのフォルダのファイル一覧を表示するページですが、変更することができます。詳しくは、APIガイドの[ブラウザユーティリティ]({{ site.baseurl }}/docs/api/utility)を参照してください。

### CGI (Common Gateway Interface)
特定のURLに対してHTTP GETコマンドまたはHTTP POSTコマンドを発行すると、FlashAirの情報を読み取る、設定を変更するなどの特別な操作が行えます。以下の4種類があります。
- [command.cgi]({{ site.baseurl }}/docs/api/command.cgi)<br>FlashAirの情報を取得するためのAPIです。
- [config.cgi]({{ site.baseurl }}/docs/api/config.cgi)<br>FlashAirの設定を変更するためのAPIです。
- [thumbnail.cgi]({{ site.baseurl }}/docs/api/thumbnail.cgi)<br>画像のサムネイルを取得するためのAPIです。
- [upload.cgi]({{ site.baseurl }}/docs/api/upload.cgi)<br>ネットワーク越しにSDメモリカードの中身を変更するためのAPIです。

---
## FlashAirの設定ファイル
SDメモリカードホスト機器から参照できる `/SD_WLAN/CONFIG`というテキストファイルを変更することで、FlashAirの動作を制御することができます。詳細はAPIガイドの[CONFIG]({{ site.baseurl }}/docs/api/config)を参照してください。