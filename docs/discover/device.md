---
layout: default
title: 組み込み機器開発の概要
parent: 開発を始めよう
nav_order: 6
---

# 組み込み機器開発の概要

{% include warning.html content="量販店等で購入されたFlashAirに本サイトの記載内容を適用してソフトウェアの書き込みや設定変更を行った場合は、保証規定に基づく無償交換の対象外になります。ご了承の上、お客様の責任において開発を行ってください。" %}

## FlashAir組み込み機器の開発

FlashAir はiSDIO 規格（SD Specifications Part E7）および無線LAN 追加仕様（同Wireless LAN Addendum）に準拠しています。

カメラやPCなど、SDメモリカードスロットを持つ機器（SDメモリカードホスト機器）は、FlashAirをSDHC/SDXCメモリカードとして認識し、データの読み書きを行うことができます。また、iSDIOコマンドをサポートしているSDメモリカードホスト機器ならば、無線LAN機能のコントロールを行うこともできます。

さらに、Luaスクリプト実行機能により、外部サーバへのファイルアップロード、データのダウンロード、HTMLの動的生成など高度な機能が実現できます。

---
## iSDIOによる制御

![iSDIOによる制御]({{ site.baseurl }}/assets/images/flashair-development-device.png){: .d-block }

iSDIOによる制御では、以下のことができます。

<dl>
	<dt>無線</dt>
	<dd>APモードで起動、STAモードで起動、AP+STA同時起動、無線切断、SSIDのスキャンといった無線LANの制御ができます。</dd>
	<dt>HTTP</dt>
	<dd>無線LAN上で、HTTP通信ができます。</dd>
  <dt>GPIO</dt>
	<dd>SD端子のGPIO制御ができます。</dd>
  <dt>SD</dt>
	<dd>内蔵フラッシュメモリのファイル読み書きができます。</dd>
	<dt>その他</dt>
	<dd>SRAMの読み書きができます。</dd>
</dl>

詳しくは、 [iSDIO APIガイド]({{ site.baseurl }}/docs/api/isdio)をご覧ください。

---
## Luaスクリプトによる制御

![Luaスクリプトによる制御]({{ site.baseurl }}/assets/images/flashair-development-lua.png){: .d-block }

Luaスクリプトによる制御では、以下のことができます。

<dl>
  <dt>無線</dt>
  <dd>APモードで起動、STAモードで起動、AP+STA同時起動、無線切断、SSIDのスキャンといった無線LANの制御ができます。</dd>
  <dt>HTTP</dt>
  <dd>無線LAN上で、HTTP通信ができます。</dd>
  <dt>スクリプト</dt>
	<dd>Luaスクリプトの実行ができます。</dd>
  <dt>GPIO</dt>
  <dd>SD端子のGPIO制御ができます。</dd>
  <dt>SD</dt>
  <dd>内蔵フラッシュメモリのファイル読み書きができます。</dd>
</dl>

詳しくは、 [Lua機能]({{ site.baseurl }}/docs/api/lua)をご覧ください。