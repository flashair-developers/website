---
layout: tutorials-api
title: iSDIO
parent: APIガイド
nav_order: 8
---

# iSDIO

iSDIO (Intelligent SDIO) をつかえば、マイコンボードなどのSDメモリカードホスト機器から、FlashAirの無線LAN機能の高度で精密な制御が行えます。
FlashAirがHTTP通信コプロセッサになってしまうのです。

iSDIOは，ファームウェアバージョン 1.00.00 以上で利用できます。

ファームウェアバージョン 4.00.00では、SDモードのみの対応となります。

ファームウェアバージョン 4.00.01+においては、CMD17/24を利用することでSPIモードでのiSDIOコマンドの発行を行うことができます。使用方法に関しては[こちら]({{ site.baseurl }}/docs/tutorials/arduino/2)をご覧ください。

SPIモードでのご利用方法については、後日公開予定です。

* [iSDIOとは](#isdioとは)
* [iSDIOコマンド発行の方法](#isdioコマンド発行の方法)
* [コマンドリファレンス](#コマンドリファレンス)
* [レジスタマップ](#レジスタマップ)
* [Arduinoチュートリアル]({{ site.baseurl }}/docs/tutorials/isdio) (iSDIOを利用しています)

---
## iSDIOとは

iSDIO (Intelligent SDIO) とは、SD メモリカードの規格団体である SD アソシエーションによって定められた、 FlashAir のような拡張機能付き SDメモリカードをコントロールするための新しい規格です。

通常、Arduino のようなマイコン機器に無線 LAN 機能を付ける場合、無線 LAN アダプタ部品とドライバソフトウェアが必要になります。 しかし、iSDIO をつかえば、マイコン機器に代わってFlashAirに無線 LAN 通信を代行させることができます。 FlashAir が無線 LAN アダプタとドライバソフトウェアが一体化した部品になると考えてもよいかもしれません。

SD 規格は、会員企業以外にも簡易版仕様書 (Simplifed Specifications - SD Association) が公開されており、 iSDIO の仕様はこのなかの Part E7 Intelligent SDIO Simplified Specification に定義されています。

実際には、iSDIO 仕様とはコマンドやりとりの手順 ( プロトコル ) のみを定めた枠組みのようなものであり、 利用できる機能や引数などの詳細は拡張機能の種類（アプリケーション）ごとにAddendum（補遺）で定められます。FlashAir は無線 LAN 内蔵カード向けの「Wireless LAN Addendum」に準拠しています。

---
## iSDIOコマンド発行の方法

コマンドの発行と結果の取得には、 SD規格のFunction Extension Commands (class 11)に規定されている、 拡張レジスタの読み書きを行うコマンド CMD49(WRITE_EXTR_SINGLE)およびCMD48(READ_EXTR_SINGLE)を利用します。

CMD48/49は、次のような３種類のモードがあります。

##### **レジスタ**
アドレスと長さで指定したメモリ領域に対する読み書き。ステータスなど小さなデータに利用。
##### **データポート**
512バイト固定のメモリブロックに対する読み書き。データなど大きなデータに利用。
##### **マスク書き込み (CMD49のみ)**
あるアドレスの1バイトの一部のビットの変更。ステータスリセットなどに利用。

どのモードを使えばよいかは、iSDIO Wireless LAN Simplified Addendumによって、 あるアドレス領域はレジスタモード、あるアドレス領域はデータポートモード、などと定められており、それに従う必要があります。

### iSDIOコマンドの発行

iSDIOコマンドを発行するには、 コマンドデータをCMD49を使ってCommand Write Register Portに書き込みます。

一般的な手順は次のとおりです。

1. コマンドデータを作る。ホストシステムのメモリ上で行います。
	* データの内容はコマンドの種類によって異なります。[コマンドリファレンス](#コマンドリファレンス)を参照してください。
2. コマンドデータをCMD49を使って[Command Write Register Port]({{ site.baseurl }}/docs/api/register/request)に書き込む。
	* システムで提供されているSD読み書きAPIを利用するとよいでしょう。[Arduinoチュートリアル]({{ site.baseurl }}/docs/tutorials/isdio)も参照ください。

ファームウェアバージョン 4.00.01+でのSPIモードでのiSDIOは、CMD48, CMD49ではなく、CMD17, CMD24をお使いください。

### iSDIOコマンドの結果を読み取る

すべてのiSDIOコマンドは非同期的に実行されます。 そのため、コマンドのステータスを監視し、 終了したら結果を読み取るという手順が必要になります。

発行されたコマンドのステータス監視には、[Response Status Register]({{ site.baseurl }}/docs/api/register/status)を読み取ります。

コマンドが完了したら、[Response Data Register Port]({{ site.baseurl }}/docs/api/register/response)を読み取ることで、結果を取得できます。

---
## コマンドリファレンス

iSDIO Wireless LAN Addendumのコマンドです。 FlashAirで利用できないものは省略しています。

* [WLAN]({{ site.baseurl }}/docs/api/reference/wlan)
* [共通]({{ site.baseurl }}/docs/api/reference/common)
* [サーバーアップロード]({{ site.baseurl }}/docs/api/reference/upload)
* [FTP/FTPS（FlashAir独自拡張）]({{ site.baseurl }}/docs/api/reference/ftp)

---
## レジスタマップ

FlashAirのiSDIOのメモリマップは[レジスタマップ]({{ site.baseurl }}/docs/api/register/register)を参照してください。

* [00000h～00200h]({{ site.baseurl }}/docs/api/register/request) Command Write Register
* [00200h～00400h]({{ site.baseurl }}/docs/api/register/response) Response Data Register Port
* [00400h～00600h]({{ site.baseurl }}/docs/api/register/status) Status Register
