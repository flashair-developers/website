---
layout: default
title: FAQ
parent: サポート
nav_order: 1
---

# FAQ
{: .no_toc }

FlashAirアプリ開発に関してよくある質問と答えを公開しています。

- TOC
{:toc}

---
## 一般的な使い方

### FlashAir って？
FlashAirは、無線LAN機能を搭載したSDHC/SDXCメモリカードです。無線LANを搭載しているパソコン、スマートフォンなどであれば、別の機器に挿入されているFlashAirのデータにアクセスすることができます。<br>
詳細はこちらをご確認ください。[https://jp.toshiba-memory.com/product/flashair/sduwa/index_j.htm](https://jp.toshiba-memory.com/product/flashair/sduwa/index_j.htm){: target="_blank" }

### FlashAirが応答しなくなることがあります。
FlashAirは接続機器により、応答しにくくなる場合があります。[メーカーの動作確認済み機器リスト](https://jp.toshiba-memory.com/compati/flashair/sduwa_list.htm){: target="_blank" }をご参考ください。<br>
また、同時に複数の要求を受けた場合にも、応答しにくくなる場合があります。 一度に投げるリクエストは、1つ（多くとも2つ）にすることをお勧めします。

### FlashAirに無線LANで接続できません。

FlashAirの一般的な使い方に関するご質問（例：対応機器、アプリの使い方、接続方法）や、FlashAirの故障、接続トラブルについては、下記のサポートセンターへ直接お問い合わせください。<br>[https://jp.toshiba-memory.com/contact/index_j.htm](https://jp.toshiba-memory.com/contact/index_j.htm){: target="_blank" }

### FlashAirをカメラで使っていますが、スマートフォンに写真をダウンロードできません。

FlashAirの一般的な使い方に関するご質問（例：対応機器、アプリの使い方、接続方法）や、FlashAirの故障、接続トラブルについては、下記のサポートセンターへ直接お問い合わせください。<br>[https://jp.toshiba-memory.com/contact/index_j.htm](https://jp.toshiba-memory.com/contact/index_j.htm){: target="_blank" }

### 無線LAN経由でFlashAir内のファイルを確認できますか？

FlashAirに無線LAN接続したPC上のウェブブラウザから、ファイル一覧やファイルのダウンロードができます。また、APIを使って行うこともできます。<br>詳細については、[FlashAirアプリ開発の概要](../discover/app/) の「FlashAirとのHTTP通信の種類」をご覧ください。

### FlashAirの電波の届く距離を延ばすにはどうすればよいですか？

FlashAir自体の電波の届く距離を延ばす方法はありませんが、中継機となる無線LANアクセスポイント（ルータなど）があれば、FlashAirをステーションモードに設定して無線LANを中継することで、遠くのFlashAirに接続するという方法があります。<br>ステーションモードの設定方法については、[上級者向けチュートリアル - ステーションモードの利用](../tutorials/advanced/1/) をご覧ください。

### 使用しているカメラがFlashAirに対応しているか教えてください。

FlashAirの動作確認機器については[メーカーの動作確認済み機器リスト](https://jp.toshiba-memory.com/compati/flashair/sduwa_list.htm){: target="_blank" }をご確認ください。

---
## 設定

### SSIDは文字数の制限がありますか？

SSIDは、1～32文字の間で設定してください。スペースを含めることはできませんのでご注意ください。

### 初期ネットワークキー（パスワード）がわかりません。

FlashAirの出荷時のパスワードは、「12345678」です。

### ネットワークキー（パスワード）は文字数の制限がありますか？

ネットワークキー（パスワード）は、8～64文字で設定してください。また、0文字（未設定）とすることも可能です。<br>スペースを含めることはできませんのでご注意ください。

### FlashAirのネットワークキー（パスワード）を忘れてしまいました。

FlashAirの一般的な使い方に関するご質問（例：対応機器、アプリの使い方、接続方法）や、FlashAirの故障、接続トラブルについては、下記のサポートセンターへ直接お問い合わせください。<br>[https://jp.toshiba-memory.com/contact/index_j.htm](https://jp.toshiba-memory.com/contact/index_j.htm){: target="_blank" }

### SSID、パスワードを設定者以外知りえない状態にできますか？

SSIDはCONFIGファイルにてどなたでも確認できます。パスワードはFlashAirの再起動でパスワードに設定した文字が「*」に置き換えられますので、設定者以外知りえない状態とすることは可能です。

### マスターコードとは何ですか？

マスターコードは、SSIDやネットワークキー（パスワード）を設定する際のパスワードとして使われる12ケタの16進数の数字です。<br>未設定の場合は、[config.cgi](../api/config.cgi/) で各種設定を変更する前に必ず、マスターコードを設定する必要があります。

### マスターコードの調べ方を教えてください。

マスターコードはFlashAirに格納されているCONFIGファイルに記されています。<br>CONFIGファイルはFlashAirの "/SD_WLAN/" に配置されており、テキストエディタなどで開くことができます。<br>"/SD_WLAN/"は隠しフォルダとなっておりますので、隠しフォルダ表示の設定を有効にしてご確認ください。

### FlashAirをステーションモードに設定しましたが、同じ無線LAN内の端末のブラウザからアクセスできません。

ブラウザを使用している端末及び無線LAN親機がFlashAir対応プロトコル（NetBIOS over TCP/IP または Bonjour）に対応しているかご確認ください。<br>詳細については、[上級者向けチュートリアル - ステーションモードの利用](../tutorials/advanced/1/)の「対応プロトコルによる問題」をご覧ください。

### FlashAirへデータをアップロードできますか？

標準ではFlashAirへデータをアップロードする機能は無効化されています。アップロード機能の有効化やアップロードする方法については以下のページをご参考ください。
* [APIガイド - upload.cgi](../api/upload.cgi/)
* [上級者向けチュートリアル - FlashAirへのアップロード](../tutorials/advanced/2/)

### FlashAirのIPアドレスは指定できますか？

はい、できます。FlashAirのIPアドレスを指定する方法はCONFIGファイルを編集する方法とLuaスクリプトを実行する方法の２つがあります。

##### 方法1: CONFIGファイルを編集して指定する方法
{: .no_toc }
CONFIGファイルに以下を追加編集します。上から順に、DHCPの無効化、FlashAirに指定したいIPアドレス、無線LANのサブネットマスク、無線LANのデフォルトゲートウェイの設定になります。（※設定値は接続先の無線LANの環境に合わせて変更してください）

```
DHCP_Enabled=NO
IP_Address=192.168.43.10
Subnet_Mask=255.255.255.0
Default_Gateway=192.168.43.1
```

#### 方法2: Luaスクリプトを実行して指定する方法
{: .no_toc }
以下のLua関数を実行するスクリプトに組み込みます。左から順に、FlashAirに指定したいIPアドレス、無線LANのサブネットマスク、無線LANのデフォルトゲートウェイの設定になります。（※設定値は接続先の無線LANの環境に合わせて変更してください）

```
fa.ip("192.168.11.2", "255.255.255.0", "192.168.11.1")
```
それぞれの詳細については、[APIガイド - CONFIG]({{ site.baseurl }}/docs/api/config) 及び[Lua関数リファレンス - ip]({{ site.baseurl }}/docs/api/lua.html#ip) をご覧ください。

### FlashAirはEAP-TLS（PEAP-TLS）の認証方式で接続できますか？

FW4.00.03以上で接続可能です。詳細は[APIガイド - CONFIG　EAPTYPE]({{ site.baseurl }}/docs/api/config.html#eaptype)をご覧ください。

---
## CGI、CONFIG

### command.cgi?op=100&DIR=/DCIM/ を要求しても値が返ってきません。

フォルダ名の最後に付けている "/" スラッシュは不要です。削除してください。

### command.cgi?op=100 と command.cgi?op=101 で返される数に違いがあります。

[command.cgi?op=101]({{ site.baseurl }}/docs/api/command.cgi.html#101)は隠しファイル（フォルダ）を除いたコンテンツ数を返します。<br>対して、[command.cgi?op=100]({{ site.baseurl }}/docs/api/command.cgi.html#100)は、全てのファイル（フォルダ）を返すため、数に違いがでます。

### command.cgi?op=105 を要求しても値が返ってきません。

[command.cgi?op=105]({{ site.baseurl }}/docs/api/command.cgi.html#105)は、FlashAirがアクセスポイントモードに設定されている場合にのみ使用することができます。<br>アクセスポイントモードについての説明は、[無線LANモードの設定]({{ site.baseurl }}/docs/api/config.html#appmode) をご覧ください。

### command.cgi?op=111 を要求しても値が返ってきません。

[command.cgi?op=111]({{ site.baseurl }}/docs/api/command.cgi.html#111)は、FlashAirがカード電源投入時に無線LAN機能を起動するモード（APPMODE=4）に設定されている場合にのみ使用することができます。<br>APPMODEについての説明は、[無線LANモードの設定]({{ site.baseurl }}/docs/api/config.html#appmode) をご覧ください。

### config.cgiで変更したSSIDやパスワードはCONFIGファイルに保存されますか？

はい、保存されます。

### upload.cgi?DEL= でファイル（フォルダ）の削除を要求してもFileNotFoundExceptionのエラーが出ます。

CONFIGファイルに「UPLOAD=1」が書き込まれているかご確認ください。こちらの設定がない場合、upload.cgiは使用できません。<br>詳細については[upload.cgi]({{ site.baseurl }}/docs/api/upload.cgi) をご覧ください。

### upload.cgi?DEL= を要求してSUCCESSの応答があってもファイル（フォルダ）の削除が反映されず、SDメモリカードホスト機器からFlashAirを外して再挿入すると反映されるのは何故ですか？

upload.cgiで行った変更をSDメモリカードホスト機器が認識する方法が無い為、実際にはFlashAirからファイルが削除されているにも関わらず、SDメモリカードホスト機器のOSなどのファイル一覧が更新されていない可能性がございます。<br>詳細については、[upload.cgi]({{ site.baseurl }}/docs/api/upload.cgi) の「ご注意」をご覧ください。

### CGIをHTTP GETリクエストで繰り返し発行する際に、ブラウザのキャッシュ機能を回避する方法はありますか？

以下のようにCGIを繰り返し発行する度に異なるURLとなるよう追加パラメータを設定することで回避できます。

```
http://flashair/command.cgi?op=...**&TIME=100**	// 一回目のGETリクエスト
http://flashair/command.cgi?op=...**&TIME=101**	// 二回目のGETリクエスト
http://flashair/command.cgi?op=...**&TIME=102**	// 三回目のGETリクエスト
// 以下繰り返し
```

### CONFIGファイルの確認、編集方法を教えてください。

CONFIGファイルについての説明は、[APIガイド - CONFIG]({{ site.baseurl }}/docs/api/config) をご覧ください。

### upload.cgiで追加（または削除）したはずのファイルがPC上で確認できません。

SDメモリカードホスト側でOSが持つディスクキャッシュをクリアする処理を実行するか、ホスト機器を再起動してください。<br>FlashAirを刺したまま、再マウントし、OSに再読み込みさせる[チュートリアル]({{ site.baseurl }}/docs/tutorials/advanced/6)も参考にしてください。

---
## Lua

### アクセスポイントモードに設定しているFlashAirを、Luaスクリプトでインターネット同時接続モードへ切り替えることはできますか？

無線LAN起動中の場合、[Bridge]({{ site.baseurl }}/docs/api/lua.html#bridge) では操作できません。<br>また、Luaでインターネット同時接続モードへ切り替えたい場合は、CONFIGファイルに「APPMODE=0」と設定し、起動時に無線LANを起動しない状態で操作することを推奨します。

### アクセスポイントモードで接続中に、LuaスクリプトでScanの操作を行うことができますか？

いいえ、できません。無線LAN起動の場合は一旦[Disconnect]({{ site.baseurl }}/docs/api/lua.html#disconnect) で切断することで、[Scan]({{ site.baseurl }}/docs/api/lua.html#scan) による操作が可能になります。

### LuaスクリプトのScan使用時のSSID検索について、ワイルドカードでの指定検索は可能ですか？

いいえ、[Scan]({{ site.baseurl }}/docs/api/lua.html#scan) 使用時にSSIDの指定はできません。

### FlashAirがGPIOを使用できないデバイスに接続されているか判断する方法を教えてください。

[SDインターフェース端子のI/O利用]({{ site.baseurl }}/docs/api/command.cgi.html#190)で確認可能です。Luaスクリプトで確認する場合は以下のようにしてください。

```
local response = fa.request("http://flashair/command.cgi?op=190&CTRL=0x00&DATA=0x00")
locl gpio = cjson.decode(response)
locl status = gpio["STATUS"]
if tatus == "OK" then
  - GPIO機能が有効
elsif status == "SDERR" then
  - GPIO機能が無効
end
```
上記のコードの1行目で実行したCGIのレスポンスは、例えば
```
{"STATUS":“OK", "CTRL":"0x00", "DATA":"0x00"}
```
となり、STATUSの値により、GPIO機能の状態が判断できます。
* GPIO機能が有効な場合: "OK"
* GPIO機能が無効な場合: "SDERR"

### ホスト側の処理とLuaスクリプトの処理が同時に行われた場合、どちらが優先されますか？

基本的にホスト側の処理が優先されます。 また、ホスト側でファイル書き込み中にLuaスクリプトで同一ファイルを読み書きすると、Luaスクリプトの処理が不安定になる場合があります。

---
## ハードウェア

### FlashAirの消費電力はどのくらいですか

FlashAirの消費電流は、SDHCの規格範囲内（最大0.72W@3.6V）です。

ただし、起動時や通信中の電流変動は、一般のSDHC/SDXCメモリカードとは異なる場合があります。

### FlashAirの消費電力を少なくすることはできますか？

申し訳ありませんが、電力パラメータを変更する方法はございません。ご了承下さい。

### FlashAirを初期化した際の構造を教えてください。

非公開となっております。

### FlashAirのWebサーバはどのような仕組みで動作するのですか？

Webサーバは、FlashAirのフラッシュメモリ（SDメモリカードとしてアクセスできる部分）のルートディレクトリをドキュメントルートとして動作します。<br>FlashAirに電源が入っていれば常に起動しております。

### Linuxのファイルシステム（ext3など）でフォーマットしてもよいでしょうか？

SDメモリカードとしてはご利用できますが、Webサーバは正常に動作しません。FlashAirのWebサーバが正常動作するためにはファイルシステムがFATである必要があります。

### FlashAirがサポートしている文字エンコーディングを教えてください。

第1世代はShift-JISです。第2世代（W-02）以降はUTF-8ですが、ASCII、日本語、中国語の範囲のみの対応となります。

### FlashAir SD-WD/WC（W-02）をW-03のファームウェアにアップデートできますか？

W-02シリーズのFlashAirをW-03のファームウェアにアップデートすることはできません。

---
## その他

### アクセス制限不備の脆弱性について教えてください。

インターネット同時接続機能に関して、下記の脆弱性が存在します。

1.  インターネット接続側ネットワークにあるデバイス（PC等）から認証なしで接続できてしまう
2.  FlashAirに記録されているファイルやデータの改ざんや、任意のLuaスクリプトの実行ができてしまう

1.の脆弱性は、下記の条件をすべて満たした場合に発生いたします。
  * FlashAirのインターネット同時接続機能が有効である（参照：[APPMODE]({{ site.baseurl }}/docs/api/config.html#APPMODE)）
  * FlashAirとインターネット接続側ネットワークにあるデバイスが、同一アクセスポイントに接続されている
  * FlashAirのIPアドレスがわかっている

2.の脆弱性は、上記３つに加えて、下記の条件が満たされた場合に発生いたします。
  * 無線LAN経由での書き込み機能を有効にしている（参照：[UPLOAD]({{ site.baseurl }}/docs/api/config.html#UPLOAD)
  
本脆弱性は、HTTPサーバの認証を設定することで回避できます。
* [HTTPDMODE]({{ site.baseurl }}/docs/api/config.html#httpmode) — 認証方法
* [HTTPDUSER]({{ site.baseurl }}/docs/api/config.html#httpduser) — Basic認証のユーザ名
* [HTTPDPASS]({{ site.baseurl }}/docs/api/config.html#httpdpass) — Basic認証のパスワード、Digest認証のハッシュ値

なお、標準では、インターネット同時接続機能および無線LAN経由での書き込み機能はいずれも無効になっており、本脆弱性の影響はありません。<br>ご利用者がCONFIGファイルの直接変更またはアプリを利用して明示的に変更しない限り、これらの機能が有効になることはありません。

これらの機能に関する詳しい設定方法は、[上級者向けチュートリアル - インターネット同時接続モード]({{ site.baseurl }}/docs/tutorials/advanced/3) および[上級者向けチュートリアル - FlashAirへのアップロード]({{ site.baseurl }}/docs/tutorials/advanced/2) をご覧ください。

### FlashAirのファイルを自動的にFTPサーバやクラウドサービスへアップロードする方法はありますか？

ご自身でアップロード環境を構築する場合は、以下のチュートリアルページがご参考になります。

* [Lua機能 - FTPサーバを使ったファイルのアップロード]({{ site.baseurl }}/docs/tutorials/lua/4)
* [Lua機能 - Facebookへのアップロード]({{ site.baseurl }}/docs/tutorials/lua/5)
* [Lua機能 - OAUTH2を使ったDropboxへのアップロード]({{ site.baseurl }}/docs/tutorials/lua/6)

### Arduino Due用iSDIOに関するライブラリやチュートリアルはありませんか？

現時点ではArduino Dueに関するライブラリやチュートリアルはございません。 Arduino Unoで動作確認済みのチュートリアルがありますので、そちらをご参考ください。<br>[チュートリアル - Arduino](../tutorials/isdio/)

### FlashAirをPCに接続している場合、FlashAirを介してPC側のデータにアクセスできますか？

いいえ、アクセスすることはできません。

### Eyefi Connectedについて教えてください。

Eyefi Connectedは、カメラからSDメモリカードを制御することができるカメラ連携機能です。<br>電源コントロールに対応したEyefi連動機能搭載カメラで使用すると、データ転送中のカメラの電源停止を防ぐことができます。 詳細は下記のページをご確認ください。[https://business.toshiba-memory.com/ja-jp/company/news/news-topics/2017/02/memory-20170223-1.html](https://business.toshiba-memory.com/ja-jp/company/news/news-topics/2017/02/memory-20170223-1.html){: target="_blank" }

### 「Keenai™」アプリケーションでのFlashAirの使用方法を教えてください。

「Keenai™」アプリケーションでの使用方法については下記のページをご確認ください。[https://help.keenai.com/hc/ja/sections/206542628](https://help.keenai.com/hc/ja/sections/206542628){: target="_blank" }

### FlashAirを物理的に抜き差しせずに内容を更新（再認識）する方法はありますか？

SDメモリカードホスト側でOSが持つディスクキャッシュをクリアする処理を実行するか、ホスト機器を再起動してください。

FlashAirを刺したまま、再マウントし、OSに再読み込みさせる[チュートリアル](../tutorials/advanced/6)も参考にしてください。
