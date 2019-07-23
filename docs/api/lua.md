---
layout: tutorials-api
title: Lua機能
parent: APIガイド
nav_order: 7
---

# Lua機能

{% include warning.html content="量販店等で購入されたFlashAirに本サイトの記載内容を適用してソフトウェアの書き込みや設定変更を行った場合は、保証規定に基づく無償交換の対象外になります。<br />ご了承の上、お客様の責任において開発を行ってください。" %}

Lua言語で書かれたスクリプトファイルをFlashAirに保存することで、 下記のような簡易なバッチ処理が行えます。

* FlashAirに保存されたファイルを、任意のサーバー等にアップロード。（ダイレクトアップロード）
* FlashAirにファイルを生成する。
* 動的にHTMLファイルを生成する。

本機能は、FlashAir W-03以上で利用できます。

* [Lua言語について](#lua言語について)
* [利用できる機能](#利用できる機能)
* [制約事項](#制約事項)
* [Lua関数リファレンス](#lua関数リファレンス)

---
## Lua言語について

> Luaは、パワフルで、高速で、軽量で、埋め込み可能な、スクリプト言語です。
>
> Luaは、シンプルな手続き型構文をと強力なデータ記述構造を、連想配列と拡張可能なセマンティクスを用いて組み合わせています。
> Luaは動的型付けであり、レジスタベースの仮想マシン向けのバイトコードを解釈することによって実行されます。
> また、インクリメンタルガベッジコレクションによる自動メモリ管理を備えており、 設定、スクリプティング、ラピッドプロトタイピングに最適です。
>
> <footer class="blockquote-footer">原文:
> <cite title="Lua">
> <a href="http://www.lua.org/about.html" target="_blank">Lua: about - http://www.lua.org/</a>
> </cite>
> </footer>

Lua言語の詳細は、関連情報をご覧ください。

* [Wikipedia](http://ja.wikipedia.org/wiki/Lua){: target="_blank" }
* [Programming in Lua プログラミング言語Lua公式解説書](http://www.amazon.co.jp/gp/product/4048677977/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=4048677977&linkCode=as2&tag=flashjapan0a-22){: target="_blank" }(Amazon.co.jp)


---
## 利用できる機能

FlashAirのLua機能では、下記のライブラリ関数が利用できます。

* Lua基本ライブラリ
  * Version: 5.2.1（[http://www.lua.org/](http://www.lua.org/){: target="_blank" }）
  * LuaFileSystem
    * Version: 1.61（[http://keplerproject.github.io/luafilesystem/](http://keplerproject.github.io/luafilesystem/){: target="_blank" }）
  * CJSON
    * Version: 1.0.3（[http://www.kyne.com.au/~mark/software/lua-cjson.php](http://www.kyne.com.au/~mark/software/lua-cjson.php){: target="_blank" }）
  * FlashAir独自機能
    * [Lua関数リファレンス](#lua関数リファレンス)
    * [パーティション操作](#パーティション操作)

---
## 制約事項

メモリ制約のため、標準ライブラリの以下の機能は使用できません。

{% include success.html content="数学関数は、FlashAir W-04から使用可能になりました。" %}

* コルーチン操作
* OS機能
* デバッグライブラリ

---
## Lua関数リファレンス

{% include warning.html content="内容は予告なく変更される可能性があります。" %}

関数名                                    | 機能                                                              | ファームウェアバージョン                   
---------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------
[Bridge](#bridge)                        |                       インターネット同時接続モードで無線LANの有効化   |                       3.00.00+
[Connect](#connect)                      |                       STAモードで無線LANの有効化                    |                       3.00.00+
[ConnectedSTA](#connectedsta)            |                       AP接続時の接続ステーション数                  |                       4.00.00+
[control("fioget")](#controlfioget)      |                       無線LAN On/Off状態の取得                     |                       4.00.00+
[control("fioset")](#controlfioset)      |                       無線LAN On/Off                              |                       4.00.00+
[control("hid_change_pass")](#controlhid_change_pass) |          秘匿領域に設定したパスワードの変更             |                       4.00.04+
[control("hid_clear")](#controlhid_clear) |                       パスワード、APIで保存したスクリプトファイルを全て削除 |                 4.00.04+
[control("hid_get")](#controlhid_get)    |                       秘匿領域に保存したスクリプトを取得                   |                 4.00.04+
[control("hid_hash")](#controlhid_hash)  |                       設定したパスワードと指定する文字列からハッシュ文字列を作成 |             4.00.04+
[control("hid_set_pass")](#controlhid_set_pass) |                秘匿領域への保存のためのパスワードを設定        |                       4.00.04+
[control("hid_store")](#controlhid_store) |                       スクリプトを秘匿領域へ保存                     |                      4.00.04+
[control("time")](#controltime)          |                       日時メモ保存                                 |                       4.00.00+
[Disconnect](#disconnect)                |                       無線LANの停止                                |                       3.00.00+
[Establish](#establish)                  |                       APモードで無線LANの有効化                     |                       3.00.00+
[ftp](#ftp)                              |                       FTPを使用したファイルのアップロード、ダウンロード |                       3.00.00+
[GetScanInfo](#getscaninfo)              |                       SSIDスキャン結果の取得                        |                       3.00.00+
[hash](#hash)                            |                       ハッシュの計算                                |                       3.00.00+
[HTTPGetFile](#httpgetfile)              |                       HTTPを使用したファイルのダウンロード           |                       3.00.00+
[i2c](#i2c)                              |                       I<sup>2</sup>C操作                           |                       4.00.00+
[ip](#ip)                                |                       IPアドレスを取得または設定                     |                       3.00.00+
[MailSend](#mailsend)                    |                       メールの送信                                  |                       3.00.01+
<span class="badge label-gray mr-1">deleted</span>[md5](#md5) |       MD5ハッシュの計算                        |                       3.00.00
[ping](#ping)                            |                       指定IPへPINGを発行                            |                       3.00.00+
[pio](#pio)                              |                       SDインターフェースのGPIO制御                   |                       3.00.00+
[pwm("duty")](#pwmduty)                  |                       pwm操作時の周波数とデューティ比を設定           |                       4.00.03+
[pwm("init")](#pwminit)                  |                       pwmの有効化、チャンネル数の設定                 |                       4.00.03+
[pwm("start")](#pwmstart)                |                       pwm操作時の指定チャンネルを動作                 |                       4.00.03+
[pwm("stop")](#pwmstop)                  |                       pwm操作時の指定チャンネルを停止                 |                       4.00.03+
[ReadStatusReg](#readstatusreg)          |                       FlashAir自身のステータスレジスタを取得          |                       3.00.00+
[remove](#remove)                        |                       ファイルの削除                                |                       3.00.00+
[rename](#rename)                        |                       ファイル名の変更                              |                       3.00.00+
[request](#request)                      |                       HTTPリクエストの発行                          |                       3.00.00+
[Scan](#scan)                            |                       SSIDスキャンの実行                            |                       3.00.00+
[search](#search)                        |                       ファイルサーチ機能                            |                       4.00.00+
[serial("init")](#serialinit)            |                       シリアルの有効化、ボーレートの設定             |                       4.00.03+
[serial("read")](#serialread)            |                       シリアル操作時のデータの受信                   |                       4.00.03+
[serial("write")](#serialwrite)          |                       シリアル操作時のデータの送信                   |                       4.00.03+
[SetCert](#setcert)                      |                       ルート証明登録                                |                       3.00.00+
[SetChannel](#setchannel)                |                       無線チャネルを設定する                         |                       3.00.01+
[sharedmemory](#sharedmemory)            |                       共有メモリのデータを読み込み或いは書き込み       |                       3.00.00+
[sleep](#sleep)                          |                       指定時間だけスクリプトの実行を停止              |                       3.00.00+
[spi](#spi)                              |                       SPI操作を行う                                 |                       3.00.01+
[spi("bit")](#spibit)                    |                       転送ビット数の指定                             |                       4.00.03+
[spi("cs")](#spics)                      |                       チップセレクト信号の制御                       |                       4.00.03+
[spi("init")](#spiinit)                  |                       インターフェースを初期化し、クロック周期の変更を行う |                    4.00.03+
[spi("mode")](#spimode)                  |                       SPIモードの指定                               |                       4.00.03+
[spi("read")](#spiread)                  |                       ライトおよびリード                            |                       4.00.03+
[spi("write")](#spiwrite)                |                       ライトおよびリード                            |                       4.00.03+
[strconvert](#strconvert)                |                       文字列変換                                   |                       3.00.00+
[udp](#udp)                              |                       UDP送信                                      |                      4.00.04+
[udp {mode="recv"}](#udprecv)            |                       UDP受信                                      |                      4.00.04+
[udp {mode="send"}](#udpsend)            |                       UDP送信                                      |                      4.00.04+
[udp {mode="send_interval"}](#udpsendinterval) |                 UDP指定間隔送信                               |                      4.00.04+
[udp {mode="stop"}](#udpstop)            |                       UDP送受信停止                                |                      4.00.04+
[udp("state")](#udpstate)                |                       UDP送受信状態取得                            |                      4.00.04+
[watchdog("event")](#watchdogevent)      |                       WatchDogのタイマーリセット                    |                       4.00.03+
[watchdog("start")](#watchdogstart)      |                       WatchDogのタイマースタート                    |                       4.00.03+
[watchdog("status")](#watchdogstatus)    |                       WatchDogの状態取得                           |                       4.00.03+
[watchdog("stop")](#watchdogstop)        |                       WatchDogのタイマー停止                       |                       4.00.03+
[websocket](#websocket)                  |                       WebSocket機能                               |                       4.00.00+
[WlanLink](#wlanlink)                    |                       接続確認                                    |                       3.00.00+

---
## Bridge

インターネット同時接続モードで無線LANを有効化します。

### 書式

```lua
fa.Bridge(ssid, networkkey, encmode, brgssid, brgnetworkkey)
```

### 引数

##### **ssid**
_string_。 FlashAirのSSID。
##### **networkkey**
_string_。 FlashAirのセキュリティキー。
##### **encmode**
_string_。 FlashAirのセキュリティモード。 指定可能な値については[Establish](#establish)を参照して下さい。
##### **brgssid**
_string_。 接続先無線LAN APのSSID。
##### **brgnetworkkey**
_string_。 接続先無線LAN APのセキュリティキー。

### 戻り値

なし

---
## Connect

STAモードで無線LANを有効化します。

### 書式

```lua
fa.Connect(ssid, networkkey)
```

### 引数

##### **ssid**
_string_。 接続先無線LAN APのSSID名。
##### **networkkey**
_string_。 接続先無線LAN APのセキュリティキー。

### 戻り値

なし

---
## ConnectedSTA

AP接続時の接続されているステーション数、ip、macを返します。

### 書式

```lua
cnt,tbl = fa.ConnectedSTA()
```

### 戻り値

##### **cnt**
接続しているステーションの個数を返却する。
##### **Tbl**
取得したクライアントのテーブルを返却する。cntが0に場合nilを返却する。

### 例

##### AP起動時に何台接続しているか確認する。

```lua
local cnt, tbl = fa.ConnectedSTA()
print(cnt,tbl)
for i,t in ipairs(tbl) do 
  for k,v in pairs(t) do
  print(k,v)
   end
end
```

##### 結果

```
1       table: 856B1C
mac     40:48:0f:7b:37:92
ip      192.168.0.11
```

---
## control("fioget")

無線LANのOn/Off状態を取得します。

### 書式

```lua
result = fa.control("fioget")
```

### 引数

第1引数は"fioget"固定。

### 戻り値

##### **result**

_number_。現在の無線LANの状態。

* 1：無線LANはOn。
* 0：無線LANはOff。
{: .ml-4 }

---
## control("fioset")

無線LANのOn/Offを行います。

### 書式

```lua
result = fa.control("fioset", enable)
```

### 引数

第1引数は"fioset"固定。</dd>

##### **enable**
_number_。1 または 0を指定。

* 1：無線LANをOnにする。モードやSSIDなどの設定はCONFIGファイルの内容が適用される。
* 0：無線LANをOffにする。
{: .ml-4 }

### 戻り値

##### **result**
_number_。現在の無線LANの状態。

* 1：無線LANはOn。
* 0：無線LANはOff。
{: .ml-4 }

---
## control("hid_change_pass")

秘匿領域に設定したパスワードを変更します。

### 書式

```lua
ret = fa.control("hid_change_pass", old_password, new_password)
```

### 引数

第1引数は"hid_change_pass"固定。

##### **old_password**
_string_。設定済みパスワード。

##### **new_password**
_string_。新規パスワード。

### 戻り値

##### **ret**
_number_。

<dl class="ml-4">
  <dt>
      0
  </dt>
  <dd>
      成功。
  </dd>
  <dt>
      1
  </dt>
  <dd>
      設定エラー。
  </dd>
  <dt>
      -1
  </dt>
  <dd>
      パスワード長エラー。
  </dd>
</dl>

---
## control("hid_clear")

パスワード、APIで保存したスクリプトファイルを全て削除します。

### 書式

```lua
fa.control("hid_clear")
```

### 引数

第1引数は"hid_clear"固定。

### 戻り値

なし

---
## control("hid_get")

秘匿領域に保存したスクリプトを取得します。

### 書式

```lua
fa.control("hid_get", filename , dstfilename, password)
```

### 引数

第1引数は"hid_get"固定。

##### **filename**
_string_。保存しているスクリプト。

##### **dstfilename**
_string_。コピー先ファイル名。
##### **password**
_string_。パスワード。

### 戻り値

なし

### 例

```lua
fa.control("hid_get", "h:sys.lua", "tmp/option.lua", "mysecret")
```

### 注意事項

ホストからアクセス可能な領域で実行されたLuaスクリプトから、秘匿領域へ保存されたファイルへアクセスは出来ません。

---
## control("hid_hash")

秘匿領域に設定したパスワードと指定する文字列からハッシュ文字列を作成します。

### 書式

```lua
ret = fa.control("hid_hash", string)
```

### 引数

第1引数は"hid_change_pass"固定。
##### **string**
_string_。設定文字列。

### 戻り値

##### **ret**
_string_。ハッシュ値。

---
## control("hid_set_pass")

秘匿領域への保存のためのパスワードを設定します。

### 書式

```lua
fa.control("hid_set_pass", password)
```

### 引数

第1引数は"hid_set_pass"固定。
##### **password**
_string_。パスワード。

### 戻り値

なし

---
## control("hid_store")

スクリプトを秘匿領域へ保存します。

### 書式

```lua
a.control("hid_store",　filename,　password)
```

### 引数

第1引数は"hid_store"固定。
##### **filename**
_string_。保存するスクリプト。
##### **password**
_string_。パスワード。

### 戻り値

なし

### 例

```lua
fa.control("hid_store", "test.lua", "12345678")
```

保存したファイルをCONFIGで指定する

```
LUA_RUN_SCRIPT=H:filename
LUA_SD_EVNET=H:filename
```

---
## control("time")

日時メモの保存または取得を行います。

### 書式

```lua
result = fa.control("time"[, savetime])
```

### 引数

第1引数は"time"固定。
##### **savetime**
_number_。保存する日時。FAT形式で指定する。

* savetime引数ありの場合、指定された日時を保存する。
* savetime引数なしの場合、保存された日時を取得する。
* FAT形式の日時について
	* 32ビットの整数値で、上位16ビットが日付、下位16ビットが時刻。
  * 日付と時刻は、[command.cgiのop=100](command.cgi/#ファイルリストの取得)を実行した際に取得できる値と同じフォーマット。

### 戻り値

##### **result**
_number_。取得した日時。

* savetime引数ありの場合、指定された日時そのものを返す。
* savetime引数なしの場合、保存された日時を返す。
	* 日時が保存されていない場合は、-1を返す。
* エラーの場合は nil を返す。

### 例

##### "2017/06/01 12:34:56" を保存する。
```lua
result = fa.control("time", 0x4ac1645c)
```
##### 保存された日時を取得する。
```lua
result = fa.control("time")
if result ~= nil then
  print(string.format("time: 0x%08x", result))
end
```

---
## Disconnect

無線LANを停止します。

### 書式

```lua
fa.Disconnect()
```

### 引数

なし

### 戻り値

なし

---
## Establish

APモードで無線LANを有効化します。

### 書式

```lua
fa.Establish(ssid, networkkey, encmode)
```

### 引数

##### **ssid**
_string_。 FlashAirのSSID。
##### **networkkey**
_string_。 FlashAirのセキュリティキー。
##### **encmode**
_number_。 FlashAirのセキュリティモード。

### 戻り値

なし

### 備考

FlashAirセキュリティモードには、下記のうち一つを指定します。

値   | 意味                                                       
--- | ----------------------------
`0` | オープンシステム、暗号化なし
`1` | オープンシステム、WEP
`3` | WPA-PSK、TKIP
`4` | WPA-PSK、AES
`5` | WPA2-PSK、TKIP
`6` | WPA2-PSK、AES

---
## ftp

FTP (File Transfer Protocol) によるファイルのダウンロードまたはアップロードを実行します。

### 書式

```lua
result = fa.ftp(cmd, uri, filename)
```

### 引数

##### **cmd**
_string_。 FTPコマンド。
<dl class="ml-4">
  <dt>
  	"get"
  </dt>
  <dd>
		ファイルのダウンロード。
	</dd>
  <dt>
		"put"
  </dt>
  <dd>
		ファイルのアップロード。
	</dd>
</dl>

##### **url**
_string_。 FTPサーバーのURI。
##### **filename**
_string_。 FlashAirカード内のファイルパス。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
	<dt>
			1
	</dt>
	<dd>
		正常動作。
	</dd>
	<dt>
		nil
	</dt>
	<dd>
	  エラー。
	</dd>
</dl>

### 備考

* FlashAirの対応しているデータ転送モードはパッシブ（PASV）モードのみとなります。
* FTPS接続を使用する場合はURLを`ftps://`とすると実行可能です。implicit, explicitモード両方とも利用可能です。
* ポート指定はホスト名の後ろにポート番号を付けてください。

### 動作例

```lua
 result = fa.ftp("get", "ftp://user:pass@ftp.test.com:21/test.txt", "test.txt");
 result = fa.ftp("put", "ftps://user:pass@ftp.test.com:990/test.txt;implicit", "test.txt");
 result = fa.ftp("put", "ftps://user:pass@ftp.test.com:990/test.txt;explicit", "test.txt");
```

---
## GetScanInfo

Scan関数で得られた情報を取得します。

### 書式

```lua
ssid, other = fa.GetScanInfo(num)
```

### 引数

##### **num**
_number_。 Scanリストの番号を指定。

### 戻り値

##### **ssid**
_string_。 SSID。

##### **other**
_table_。 Scan結果情報。

### 備考

Connect, Establish, または Bridge コマンドにより無線LANが有効になっていると利用できません。

### 例

```lua
count = fa.Scan()
for i=0,count-1 do
  ssid,other = fa.GetScanInfo(i)
  for key, val in pairs(other) do
    print(key, val)
  end
end
```

---
## hash

ハッシュ値を計算します。

### 書式

```lua
hash = fa.hash(name, data, key)
```

### 引数

##### **name**
_string_。 hashの種類選択(md5,sha1,sha256,hmac-sha256)。
##### **data**
_string_。 データ。
##### **key**
_string_。 秘密鍵（nameがhmac-sha256時利用）。

### 戻り値

##### **hash**
_string_。 16進数で表したハッシュ値。

---
## HTTPGetFile

HTTPを使用してファイルをダウンロードします。

### 書式

```lua
result = fa.HTTPGetFile(uri, filepath [, user, pass])
```

### 引数

##### **uri**
_string_。 取得元のURI。
##### **filepath**
_string_。 保存先ファイル名。
##### **user**
_string_。 Basic認証におけるUser文字列。
##### **pass**
_string_。 Basic認証におけるPass文字列。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>
    1
  </dt>
  <dd>
		正常動作。
	</dd>
  <dt>
    nil
  </dt>
  <dd>
		エラー。
	</dd>
</dl>

### 注意事項

* この関数でHTTPS通信を実行する場合、実行前に[fa.SetCert](#setcert)関数でルート証明書を設定することが推奨されています。ルート証明書を設定せずにHTTPS通信を実行した場合、ルート証明書を用いたサーバ証明書の検証が行われないまま、通信が行われます。
* ルート証明書を用いてサーバ証明書を検証した結果、検証が失敗した場合、この関数の実行は失敗となります。

---
## i2c

FlashAirよりI<sup>2</sup>C操作を行います。i2cはMasterとして動作します。

### 書式

```lua
res, data1, data2, data3, ... = fa.i2c(table)
res, string = fa.i2c(table)
res, data, ctrl = fa.i2c{mode = "getpio"}
```

### 引数

##### **table**
以下のフィールドがあります。

<dl class="ml-4">
  <dt>mode</dt>
  <dd>_string_。I<sup>2</sup>C操作の属性。</dd>
  <dt>freq</dt>
  <dd>_number_。I<sup>2</sup>Cクロック周波数（単位：kHz）。設定可能な値は、`45`、`100`、`189`、`400`の4つ。省略時は`100`が設定されます。</dd>
  <dt>timeout</dt>
  <dd>_number_。スレーブ応答のタイムアウト時間（単位：msec）。省略時は`10`が設定されます。</dd>
  <dt>address</dt>
  <dd>_number_。接続デバイスのスレーブアドレスを指定します。</dd>
  <dt>direction</dt>
  <dd>_string_。データの方向を指定します。設定可能な値は`"read"`と`"write"`です。`"read"`を指定した場合、接続デバイスからデータを読み出します。`"write"`を指定した場合、接続デバイスへデータを送ります。</dd>
  <dt>data</dt>
  <dd>_string_ or _number_。送信データを設定します。string形式で指定した場合は、設定したデータを全て送ります。number形式で指定した場合は`0`～`255`までの値を設定できます。`"setpio"` の場合、0または1でPIOの出力を指定します。<br>
  <span class="badge label-green">4.00.03</span> Null文字のサポートしました。</dd>
  <dt>bytes</dt>
  <dd>_number_。受信データサイズを指定します。typeが`"binary"`のとき、`1`～`16`までの値を指定できます。typeが`"string"`のとき、最小値は`1`、最大値はメモリ依存となります。省時には`1`が設定されます。</dd>
  <dt>type</dt>
  <dd>_string_。受信データ形式を指定します。設定可能な値は`"binary"`、`"string"`です。省略時には、`"binary"`が設定されます。</dd>
  <dt>ctrl<span class="badge label-green ml-1">4.00.03</span></dt>
  <dd>_number_。PIOの方向を指定します。0のとき入力、1のとき出力となります。</dd>
</dl>

&nbsp; | デバイス初期化 | スタートコンディションの送信 | リスタートコンディションの送信 | 接続デバイスからデータ読み出し | 接続デバイスへデータ書き込み | ストップコンディションを送信し、コネクションを閉じる | <span class="badge label-green">4.00.03</span><br>PIO設定 | <span class="badge label-green">4.00.03</span><br>PIO取得 
-- | -- | -- | -- | -- | -- | -- | -- | -- 
mode      | `"init"` | `"start"`      | `"restart"`     | `"read"`        | `"write"`      | `"stop"`                   | `"setpio"`    | `"getpio"`                
freq      | 省略可      | 不要             | 不要              | 不要              | 不要             | 不要                         | 不要          | 不要            
timeout   | 省略可      | 不要             | 不要              | 不要              | 不要             | 不要                         | 不要           | 不要           
address   | 不要       | 必須             | 必須              | 不要              | 不要             | 不要                         | 不要             | 不要         
direction | 不要       | 必須             | 必須              | 不要              | 不要             | 不要                         | 不要             | 不要 
data      | 不要       | 不要             | 不要              | 不要              | 必須             | 不要                         | 必須              | 不要
bytes     | 不要       | 不要             | 不要              | 省略可             | 省略可            | 不要                         | 不要             | 不要
type      | 不要       | 不要             | 不要              | 省略可             | 不要             | 不要                         | 不要             | 不要
ctrl      | 不要       | 不要             | 不要              | 不要              | 不要             | 不要                         | 必須              | 不要

### 備考

##### **ビット割当**
* CMD: SCL
* D0: SDA

SCL/SDAはプルアップしてください。<br>
CLKはプルダウンしてください。<br>
<span class="badge label-green mr-1">4.00.03</span>`"setpio"` /`"getpio"` ではD1が使用できます。

##### **複数バイト送信**
バイナリデータを複数バイト送信したい場合は、データ書き込みを続けて実行することで、複数バイト送信することができます。

### 戻り値

##### **res**
_string_。成功時は`"OK"`を返します。失敗時はそれ以外の文字列を返します。
##### **data1, data2, data3, ...**
_number_。`0`～`255`までの値が格納されます。接続デバイスからデータ読み出し、`type = "binary"`指定時のみ使用します。
##### **string**
_string_。受信データが格納されます。接続デバイスからデータ読み出し、`type = "string"`指定時のみ使用します。
##### **data**
<span class="badge label-green">4.00.03</span>
_number_。PIOの取得値が格納されます。`type = "getpio"`指定時のみ使用します。
##### **control**
<span class="badge label-green">4.00.03</span>
_number_。PIOの方向設定値が格納されます。`0` のとき入力、`1` のとき出力となります。`type = "getpio"`指定時のみ使用します。

### 例

```lua
res = fa.i2c{mode = "init", freq = 100}
res = fa.i2c{mode = "start", address = 50, direction = "write"}
res = fa.i2c{mode = "restart", address = 50, direction = "read"}
res, data1, data2, data3, ... = fa.i2c{mode = "read", type = "binary"}
res, string = fa.i2c{mode = "read", type = "string"}
res = fa.i2c{mode = "write", data = 0}
res = fa.i2c{mode = "stop"}
```

##### アドレス50のスレーブから5バイト読み出す

```lua
res = fa.i2c{mode = "init", freq = 100}
res = fa.i2c{mode = "start", address = 50, direction = "read"}
res, r1, r2, r3, r4, r5 = fa.i2c{mode = "read", bytes = 5, type = "binary"}
res = fa.i2c{mode = "stop"}
```

##### アドレス50のスレーブに0を書き込んでから1バイト読み出す

```lua
res = fa.i2c{mode = "init", freq = 100}
res = fa.i2c{mode = "start", address = 50, direction = "write"}
res = fa.i2c{mode = "write", data = 0}
res = fa.i2c{mode = "restart", address = 50, direction = "read"}
res, data = fa.i2c{mode = "read", bytes = 1, type = "binary"}
fa.i2c{mode = "stop"}
```

##### PIOの操作
<span class="badge label-green">4.00.03</span>

```lua
res = fa.i2c {mode ="init", freq=100}
res = fa.i2c {mode ="setpio", data=1, ctrl=1} -- 出力High
res = fa.i2c {mode ="setpio", data=0, ctrl=1} -- 出力Low

res = fa.i2c {mode ="setpio", data=0, ctrl=0} -- 入力
res, data, ctrl = fa.i2c {mode="getpio"}
```


---
## ip

FlashAir自身のIPアドレスを取得または設定します。

### 書式

```lua
ip, mask, gw = fa.ip(ipaddress, subnetmask, gateway)
```

### 引数

##### **ipaddress**
_string_。 FlashAirに設定するIPアドレス。
##### **subnetmask**
_string_。 サブネットマスク値。
##### **gateway**
_string_。 ゲートウェイのIPアドレス。

### 戻り値

##### **ip**
_string_。 IPアドレス。
##### **mask**
_string_。 サブネットマスク。
##### **gw**
_string_。 ゲートウェイ。

### 例

```lua
-- 値取得時
ip, mask, gw = fa.ip()
-- 値設定時
fa.ip("192.168.11.2", "255.255.255.0", "192.168.11.1")
```

---
## MailSend

FlashAirよりメール送信を行う（ファイルの添付も可能）。

### 書式

```lua
fa.MailSend(table)
```

### 引数

##### **table**
以下のフィールドがあります。

<dl class="ml-4">
  <dt>from</dt>
  <dd>_string_。 送信元メールアドレス。</dd>
  <dt>headers</dt>
  <dd>_string_。 メールヘッダ。</dd>
  <dt>body</dt>
  <dd>_string_。 メール本文。</dd>
  <dt>server</dt>
  <dd>_string_。 メールサーバ(smtp)。</dd>
  <dt>user</dt>
  <dd>_string_。 ユーザーID。</dd>
  <dt>password</dt>
  <dd>_string_。 パスワード。</dd>
  <dt>attachment</dt>
  <dd>_string_。 添付ファイル指定（任意）。</dd>
  <dt>ContentType</dt>
  <dd>_string_。 コンテンツタイプ指定（attachment指定時に有効で必須）。</dd>
  <dt>port <span class="badge label-green mr-1">4.00.03</span></dt>
  <dd>_number_。ポート番号を指定します。デフォルトは465。</dd>
</dl>

### レスポンス

成功： MailSend is success.<br>
失敗： Error: It failed to send.

### 動作例

```lua
from = "fromaddr@yahoo.co.jp"
rcpt = "toaddr@gmail.com"
a = fa.MailSend {
  from = from,
  headers = "To: "..rcpt.."\r\nFrom: "..from.."\r\nSubject: test",
  body = "HELLO HELLO",
  server = "smtp.mail.yahoo.co.jp",
  user = "flashair",
  password ="1234567890",
  attachment = "FBYF.jpg",
  ContentType = "image/jpg"
}
```

---
## md5

[hash](#hash)（ハッシュの計算）へ統合されました。

---
## ping

指定IPへPINGを発行します。

### 書式

```lua
result = fa.ping(ip)
```

### 引数

##### **ip**
_string_。 ipアドレス。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>正常動作。</dd>
  <dt>nil</dt>
  <dd>エラー。</dd>
</dl>

### 動作例

```lua
result = fa.ping("192.168.130.1")
```

---
## pio

SDインターフェースのPIO (Programmed Input/Output) 制御を行います。

### 書式

```lua
s, indata = fa.pio(ctrl, data)
```

### 引数

##### **ctrl**
_number_。 ピンの入出力指定。 読み込みたい端子に対応するビットに`0` を、 書き込みたい端子に対応するビットに`1` を指定します。
##### **data**
_number_。 出力ピン状態の指定。 書き込みたい端子に対応する各ビットに、`0` を設定するとLow、`1` を設定するとHighを出力します。

### 戻り値

##### **s**
_number_。 インターフェース制御の状態。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>0</dt>
  <dd>失敗。</dd>
</dl>

##### **indata**
_number_。 入力ピン情報。

### 備考

##### **ビット割当**

* CMD : 0x01
* D0 : 0x02
* D1 : 0x04
* D2 : 0x08
* D3 : 0x10

---
## pwm("duty")

FlashAirでpwm操作を行う際、周波数とデューティ比を設定します。

### 書式

```lua
res = fa.pwm("duty", ch, freq, duty)
```

### 引数

##### **ch**
_number_。動作指定するPin情報です。`0`～`4`のチャンネルを指定できます。 
##### **freq**
_number_。周波数(Hz単位)。浮動小数点で指定可能。
##### **duty**
_number_。デューティ比(0～100%)。浮動小数点で指定可能。

### 戻り値

##### **res**
_number_。 

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

---
## pwm("init")

FlashAirでpwm操作を行う際、pwmの有効化、チャンネル数の設定を行います。

### 書式

```lua
ret = fa.pwm("init", ch, enable)
```

### 引数

##### **ch**
_number_。pwmモードを設定するチャンネルを1つ指定します。`0`～`4`のチャンネルを指定できます。 
##### **enable**
_number_。1 または 0を指定。
<dl class="ml-4">
  <dt>1</dt>
  <dd>pwmモードを有効にする。</dd>
  <dt>0</dt>
  <dd>pwmモードを無効にする。</dd>
</dl>

### 戻り値

##### **res**
_number_。 

<dl class="ml-4">
    <dt>1</dt>
    <dd>成功。</dd>
    <dt>nil</dt>
    <dd>失敗。</dd>
</dl>

### 注意事項

* CONFIGに`IFMODE=1`を設定する必要があります。
* ビット割当
  * CMD: 0ch
  * D0: 1ch
  * D1: 2ch
  * D2: 3ch
  * D3: 4ch

---
## pwm("start")

FlashAirでpwm操作を行う際、指定したチャンネルを動作させます。0～4のチャンネルを指定できます。

### 書式

```lua
res = fa.pwm("start", ch)
```

### 引数

##### **ch**
_number_。動作指定するPin情報です。`0`～`4`のチャンネルを指定できます。 

### 戻り値

##### **res**
_number_。 

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

---
## pwm("stop")

FlashAirでpwm操作を行う際、指定したチャンネルを停止させます。0～4のチャンネルを指定できます。

### 書式

```lua
res = fa.pwm("stop", ch)
```

### 引数

##### **ch**
_number_。停止指定するPin情報です。`0`～`4`のチャンネルを指定できます。 

### 戻り値

##### **res**
_number_。 

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

---
## ReadStatusReg

FlashAir自身のステータスレジスタを取得する。

### 書式

```lua
reg = fa.ReadStatusReg()
```

### 引数

なし

### 戻り値

無線LAN機能ステータスレジスタの内容を、文字列として返します。内容は[無線LAN機能ステータスレジスタ（ApplicationStatus for Wireless LAN）](isdio/register/status/#WLANStatusRegister)を参照してください。

### 動作例

IPアドレスを取得する場合

```lua
local ipaddress = string.sub(fa.ReadStatusReg(),160,168)
```

---
## remove

指定されたファイルを削除します。

### 書式

```lua
fa.remove(filepath)
```
### 引数

##### **filepath**
_string_。 削除対象のファイル名。

### 戻り値

なし

### 動作例

```lua
fa.remove("/DCIM/100__TSB/DSC_100.JPG")>
```

---
## rename

指定されたファイルのパスを変更します。

### 書式

```lua
fa.rename(oldfile, newfile)
```

### 引数

##### **oldfile**
_string_。 元ファイル名。
##### **newfile**
_string_。 新ファイル名。

### 戻り値

なし

### 動作例

```lua
fa.rename("/DCIM/100__TSB/DSC_100.JPG","/DCIM/100__TSB/DSC_101.JPG")
```

---
## request

HTTP (Hyper Text Transfer Protocol) リクエストを発行します。

### 書式

```lua
b, c, h = fa.request(url [, method [, headers [, file [, body [, bufsize [, redirect [, rcvbuff [, rcvfile]]]]]]]])
```

### 引数

##### **url**
_string_。 URLの文字列。（ポート指定可能:8080）
##### **method**
_string_。 HTTPリクエストメソッド。省略すると`"GET"` とみなします。
##### **headers**
_table_。 HTTPリクエストのヘッダーフィールド情報を追加できます。
##### **file**
_string_。 HTTPリクエストのボディに指定されたファイルを追加して送信します。
##### **body**
_string_。 HTTPリクエストのボディに指定された文字列を追加して送信します。 fileオプションと併用するとbody内部の文字列`<!--WLANSDFILE-->` をファイルに置換して送信します。bodyが指定されていない場合は、単にfileが送信されます。
##### **bufsize**
_number_。 HTTPリクエストの送信バッファ・サイズ。flickrサーバーへ送信する場合はこの値を1460*10とします。
##### **redirect**
_boolean_。 HTTPのリダイレクト動作の有効無効を制御する。省略すると`true` を指定したものとみなします。
##### **rcvbuff**
<span class="badge label-green">4.00.03</span>
_string_。Luaのスタック上にメモリを確保し、受信データを確保したメモリに保存します。
##### **rcvfile**
<span class="badge label-green">4.00.03</span>
_string_。受信したHTTPレスポンスのデータを指定したファイルへの保存を行います。

### 戻り値

##### **b**
_string_。 HTTP response bodyの文字列。
##### **c**
_number_。 HTTPステータスコード。
##### **h**
_string_。 HTTP response headerの文字列。

### 例

```lua
boundary = "--61141483716826"
contenttype = "multipart/form-data; boundary=" .. boundary
filepath = "sample.txt"
mes = "--".. boundary .. "¥r¥n"
 .."Content-Disposition: form-data; name=¥"file¥"; filename=¥""..file .."¥"¥r¥n"
 .."Content-Type: text/plain¥r¥n"
 .."¥r¥n"
 .."<!--WLANSDFILE-->¥r¥n"
 .."--" .. boundary .. "--¥r¥n"

blen = lfs.attributes(file,"size") + string.len(mes) - 17
b,c,h = fa.request{url = "http://192.168.0.1/upload.cgi:8080",
 method = "POST",
 headers = {["Content-Length"] = tostring(blen),
 ["Content-Type"] = contenttype},
 file = filepath,
 body = mes
}
```

### 備考

* HTTP Responseの転送サイズは、3KBまで対応。
* Flickrへの送信においてTCPリセットが行われることがあります。bufsizeオプションで送信バッファサイズを1460*10程度に小さくすると回避できる場合があります。

### 注意事項

* この関数でHTTPS通信を実行する場合、実行前に[fa.SetCert関数](#setcert)でルート証明書を設定することが推奨されています。ルート証明書を設定せずにHTTPS通信を実行した場合、ルート証明書を用いたサーバ証明書の検証が行われないまま、通信が行われます。
* ルート証明書を用いてサーバ証明書を検証した結果、検証が失敗した場合、この関数の実行は失敗となります。

---
## Scan

Scan開始コマンド。結果はGetScanInfo()で取得します。

### 書式

```lua
count = fa.Scan([ssid])
```

### 引数

##### **ssid**
_string_。 指定したSSIDについてスキャンを行います。 省略した場合は近傍のSSIDをスキャンします。

### 戻り値

##### **count**
_number_。 スキャンで見つかったAP数。

### 備考

Connect, Establish, または Bridge コマンドにより無線LANが有効になっていると利用できません。


---
## search

指定したディレクトリ内で、更新日時によるファイル検索を行います。更新日時が最新であるファイルの検索、または引数で指定した更新日時によるファイルの検索が可能です。

### 書式

```lua
result, filelist, time = fa.search(type, path, searchtime)
```

### 引数

##### **type**
_string_。検索タイプ。file固定。
* file：ファイルの検索
##### **path**
_string_。検索対象のディレクトリ。
##### **searchtime**
_number_。検索対象更新日時。-1またはFAT形式の日時を指定する。
* -1を指定した場合、更新日時が最新のファイルを検索する。
* -1以外を指定した場合、以下の両方を検索する。
	* 指定された更新日時と一致するファイル
  * 指定された更新日時より新しいファイルのうち最も古いファイル（指定された日時の次に新しいファイル）
* FAT形式の日時について
  * 32ビットの整数値で、上位16ビットが日付、下位16ビットが時刻。
  * 日付と時刻は、[command.cgiのop=100](command.cgi/#ファイルリストの取得)を実行した際に取得できる値と同じフォーマット。

### 戻り値

##### **result**
_number_。ステータス。

<table class="ml-4">
  <tbody>
    <tr>
      <td>1</td>
      <td>正常終了</td>
    </tr>
    <tr>
      <td>-1</td>
      <td>ファイルリストの作成時にオーバーフロー
        <ul class="ml-4">
          <li>
            searchtimeに-1を指定した場合、「更新日時が最新のファイル」のリスト作成で文字列バッファのオーバーフロー
          </li>
          <li>
            searchtimeに-1以外を指定した場合、「指定された更新日時より新しいファイルのうち最も古いファイル」のリスト作成で文字列バッファのオーバーフロー
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>-2</td>
      <td>ファイルリストの作成時にオーバーフロー(searchtimeに-1以外を指定した場合のみ返す可能性がある)
        <ul class="ml-4">
          <li>
            「指定された更新日時と一致するファイル」のリスト作成で文字列バッファのオーバーフロー
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>-3</td>
      <td>ディレクトリオープンエラー</td>
    </tr>
    <tr>
      <td>-4</td>
      <td>ディレクトリリードエラー</td>
    </tr>
  </tbody>
</table>

##### **filelist**
_string_。カンマ区切りのファイルリスト。
* 条件に一致するファイルのリストをカンマ区切りの文字列で返す。
* searchtimeに-1以外を指定した場合、「指定された更新日時と一致するファイル」のリストと「指定された更新日時より新しいファイルのうち最も古いファイル」のリストを連結した文字列を返す。
* 該当ファイルがない場合は、""(空文字列)を返す。
* オーバーフロー以外のエラーの場合はnilを返す。
{: .ml-4 }
##### **time**
_number_。検索結果日時。
* searchtimeに-1を指定した場合、「更新日時が最新のファイル」の更新日時を返す。
* searchtimeに-1以外を指定した場合、 「指定された更新日時より新しいファイルのうち最も古いファイル」の更新日時を返す。
* 条件に一致するファイルがない場合は0を返す。
* オーバーフロー以外のエラーの場合はnilを返す。
{: .ml-4 }

#### 備考
* ファイルリストの作成時に512文字を超えた場合はバッファオーバーフローとなり、リストは途中で打ち切られる。
* 検索するディレクトリの深さは3階層まで。

### 例

##### "/DCIM" から最新のファイルを検索する。

```lua
local result, filelist, time = fa.search("file", "/DCIM", -1)
if result ~= 1 then
  print("error: ", result)
end
if filelist ~= nil then
  for f in string.gmatch(filelist, '(.-),') do
      print(f)
  end
end
if time ~= nil then
  print(string.format("time: 0x%08x", time))
end
```

##### “DCIM”から更新日時が 2017/06/01 12:34:56 であるファイルと、その日時より新しいファイルのうち最も古いファイルを検索する。

```lua
local result, filelist, time = fa.search("file", "/DCIM", 0x4ac1645c)
if result ~= 1 then
  print("error: ", result)
end
if filelist ~= nil then
  for f in string.gmatch(filelist, '(.-),') do
      print(f)
  end
end
if time ~= nil then
  print(string.format("time: 0x%08x", time))
end
```

### 参考

#### FAT形式の日時変換例
文字列の日時をFAT形式に変換する

```lua
local function StringToFatDateTime(datetime_str)
  local pattern = '(%d+)/(%d+)/(%d+)%s+(%d+):(%d+):(%d+)'
  local year,month,day,hour,min,sec = string.match(datetime_str, pattern)
  year = year - 1980
  sec = bit32.rshift(sec, 1)
  local date_fat = bit32.bor(bit32.lshift(year, 9),
                             bit32.lshift(month, 5),
                             day)
  local time_fat = bit32.bor(bit32.lshift(hour, 11),
                             bit32.lshift(min, 5),
                             sec)
  local datetime_fat = bit32.bor(bit32.lshift(date_fat, 16),
                                 time_fat)
  return datetime_fat
end
```

##### FAT形式の日時を文字列に変換する

```lua
local function FatDateTimeToString(datetime_fat)
  local function getbits(x, from, to)
      local mask = bit32.lshift(1, to - from + 1) - 1
      local shifted = bit32.rshift(x, from)
      return bit32.band(shifted, mask)
  end
  local fatdate = bit32.rshift(datetime_fat, 16)
  local day = getbits(fatdate, 0, 4)
  local month = getbits(fatdate, 5, 8)
  local year = getbits(fatdate, 9, 15) + 1980

  local fattime = getbits(datetime_fat, 0, 15)
  local sec = getbits(fattime, 0, 4) * 2
  local min = getbits(fattime, 5, 10)
  local hour = getbits(fattime, 11, 15)

  return string.format('%02d/%02d/%02d %02d:%02d:%02d', year, month, day, hour, min, sec)
end
```
---
## serial("init")

FlashAirでシリアル操作を行う際、シリアルの有効化、ボーレートの設定を行います。

### 書式

```lua
fa.serial("init", [boudrate])
```

### 引数

##### **boudrate**
_number_。ボーレート（未設定時は115200ボー）。

### 戻り値

なし

### 注意事項

* CONFIGに`IFMODE=1`を設定する必要があります。
* ビット割当
  * CMD: RX
  * D0: TX
  * GND: GND
* フロー制御機能はありません。

---
## serial("read")

FlashAirでシリアル操作を行う際、データの受信を行います。

### 書式

```lua
data = fa.serial("read")
```

### 引数

なし

### 戻り値

##### **data**
_number_。取得したデータ。データは1byte, number形式で取得します。受信バッファが空のときは、`nil`が返ります。                        

---
## serial("write")

FlashAirでシリアル操作を行う際、データの送信を行います。

### 書式

```lua
fa.serial("write", data)
```

### 引数

##### **data**
_string_ or _number_(0～255) or _table_。送信するデータ。                       


### 戻り値

なし

---
## SetCert

証明書のクリアor登録（X.509 binary encode with DER)を行います。

### 書式

```lua
fa.SetCert(filename)
```

### 引数

##### **filename**
_string_。 DERファイルのパス、ファイル名を指定する。空文字列指定時は証明書をクリアする。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>正常動作。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 動作例

```lua
-- 証明書の登録
res = fa.SetCert("DerSha256.cer")
if res == nil then
    print("certificate registration error")
end

-- 証明書のクリア
res = fa.SetCert("")
if res == nil then
    print("certificate clear error")
end
```

---
## SetChannel

無線チャネルを設定する。

### 書式

```lua
fa.SetChannel(channelNo)
```

### 引数

##### **channelNo**
_number_。 チャネル（0～11 or 0x0～0xb　0指定はAUTO）。

### 戻り値

なし

### 動作例

```lua
fa.Disconnect()
fa.SetChannel("0xB")
fa.Establish("flashair3", "12345678", "6")
```

---
## sharedmemory

共有メモリからデータを読み込み或いは書き込みを行います。<br>
<span class="badge label-green mr-1">4.00.03</span>Null文字のwrite, readをサポートしました。

### 書式

```lua
fa.sharedmemory(command, addr, len, wdata)
```

### 引数

##### **command**
_string_。 動作コマンド(write, read)。
##### **addr**
_number_。 アドレス（0～511）（0～2047）。
##### **len**
_number_。 データ長（0～512）（1～2048）。
##### **wdata**
_string_。 書込み文字列（コマンドでwrite指定時有効）。

### レスポンス

<dl>
<dt>write時</dt>
<dd>成功：1<br>失敗：nil</dd>
<dt>read時</dt>
<dd>成功：読み出し文字列<br>失敗：nil</dd>
</dl>

### 動作例

```lua
res1 = fa.sharedmemory("write", 0, 8, "12345678")
res2 = fa.sharedmemory("read", 1, 4, 0)
print("res=",res2)
        　　
　結果：res=2345
```

---
## sleep

指定時間だけスクリプトの実行を停止します。

### 書式

```lua
sleep(msec)
```

### 引数

##### **msec**
_number_。 停止時間を0～(2<sup>32</sup> - 1)の範囲のミリ秒単位で指定します。

### 戻り値

なし

---
## spi

FlashAirよりSPI操作を行う。

### 書式

```lua
result = fa.spi(command, data)
```

### 引数
##### **command**
<dl class="ml-4">
    <dt>init</dt>
    <dd>クロック周期の変更を行う（デフォルト値：1000）。<br>
    ビット割当
    * D0 : CLK
    * D1 : CS
    * D2 : MISO
    * CMD : MOSI
		{: .ml-4 }
		</dd>
    <dt>mode</dt>
    <dd>SPIモードの指定（引数：０～３。デフォルト値：３）。</dd>
    <dt>bit</dt>
    <dd>転送ビット数（デフォルト値：８）。</dd>
    <dt>write</dt>
    <dd>ライト。</dd>
    <dt>read</dt>
    <dd>リード。</dd>
    <dt>cs</dt>
    <dd>チップセレクト信号の制御（引数１でCS＝ON、０でCS=OFF）。</dd>
</dl>

##### **data**
_string_。 データ。

### レスポンス

<dl>
	<dt>write</dt>
	<dd>ライトコマンド発行時の受信データ。</dd>
	<dt>read</dt>
	<dd>リードコマンド発行時の受信データ。</dd>
	<dt>otherwise</dt>
	<dd>ステータス</dd>
</dl>

### 動作例

```lua
fa.spi("init", 1001)
```

---
## spi("bit")

転送ビット数を指定します。（デフォルト値：8）


### 書式

```lua
res = fa.spi("bit", bit)
```

### 引数

##### **bit**
_number_。範囲`1` ～`32` 。転送ビット数。

### 戻り値

##### **res**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>0</dt>
  <dd>失敗。</dd>
</dl>

### 注意事項

spi("write") で文字列を指定する場合、bit指定との併用は不可となります。

---
## spi("cs")

チップセレクト信号を制御します。

### 書式

```lua
fa.spi("cs", cs_level)
```

### 引数

##### **cs_level**
_number_。

<dl class="ml-4">
	<dt>1</dt>
	<dd>High</dd>
	<dt>0</dt>
	<dd>Low</dd>
</dl>

### 例

```lua
local CS_ASSERT=0
local CS_NEGATE=1
fa.spi("mode", 2)
fa.spi("init", 1000)
fa.spi("cs", CS_ASSERT)
fa.spi("write", "hello", 5)
fa.spi("cs", CS_NEGATE)
```

---
## spi("init")

インターフェースを初期化し、クロック周期の変更を行う（デフォルト値：1000）。CSはHighとなる。

### 書式

```lua
res = fa.spi("init"[, period])
```

### 引数

###### **period**
_number_。 省略可。クロック周期。

### 戻り値

##### **res**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>0</dt>
  <dd>失敗。</dd>
</dl>

---
## spi("mode")

SPIモードを指定します。（デフォルト値：3）

### 書式

```lua
res = fa.spi("mode", mode)
```

### 引数

##### **mode**
_number_。範囲`0` ～`3` 。SPIモード。

### 戻り値

##### **res**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>0</dt>
  <dd>失敗。</dd>
</dl>

### 注意事項

spi("init") の実行前にspi("mode")を実行してください。

---
## spi("read")

ライトおよびリード。複数回転送でき、全てのリード結果を取得できます。送信データは固定値を繰り返し送信します。

### 書式

```lua
res_num = fa.spi("read")
res_tbl = fa.spi("read", xfer_num, data_num)
```

### 引数

##### **xfer_num**
_number_。転送回数。
##### **data_num**
_number_。送信データ。

### 戻り値

##### **res_num**
_number_。リードした値。
##### **res_tbl**
_table_。リードした値の配列。

### 送信データについて

fa.spi("read") の書式では、全ビット0が送信されます。

fa.spi("read", xfer_num, data_num) の書式では、data_numが繰り返し送信されます。

### 例

```lua
res_num = fa.spi("read")
print(res_num)
res_tbl = fa.spi("read", 10, 0xff)
for i, v in ipairs(res_tbl) do
  print(i, v)
end
```

---
## spi("write")

ライトおよびリード。複数回転送できますが、リード結果は最後の1回のみ取得できます。

### 書式

```lua
res = fa.spi("write", data_num)
res = fa.spi("write", data_str, xfer_num)
```

### 引数

##### **data_num**
_number_。送信データ。
##### **data_str**
_string_。送信データを文字列で指定。1バイトずつ複数回に分けて転送される。
##### **xfer_num**
_number_。送信バイト数。data_strの文字列長を超えた場合には送信データは0x00となる。

### 戻り値

##### **res**
_number_。リードした値。（1度の関数呼び出しで複数回転送した場合は、最後にリードした値）

### 例

```lua
res = fa.spi("write", 0x12)
result = fa.spi("write", "hello", 8)
```

### 注意事項

data_strを使用する場合、bit指定との併用は不可となります。

---
## strconvert

SJIS文字をUTF-8文字へ変換とutf8文字をSJIS文字へ変換する。

### 書式

```lua
fa.strconvert(format, orgstr)
```

### 引数

##### **format**
_string_。 「sjis2utf8」を指定するとsjis文字をutf8文字へ変換する、「utf82sjis」を指定するとutf8文字をsjis文字へ変換する。
##### **orgstr**
_string_。 変換元文字列。

### レスポンス

成功：変換文字列<br>
失敗：nil

### 動作例

```lua
str = "あかさたなはまやらわ"
print("testStr=", str)
a = fa.strconvert("sjis2utf8", str )
print("toUTF8=", a)
b = fa.strconvert("utf82sjis", a)
print("toSJIS=", b)
```

---
## udp

UDPの送信を行います。

### 書式

```lua
res = fa.udp(address, port, type, data)
```

### 引数

##### **address**
_string_。 送信先アドレス。
##### **port**
_number_。 送信先ポート。

##### **type**
_string_。データタイプ。

* "message"：文字列を送信する。
* "file": ファイルを送信する。
{: .ml-4 }

##### **data**
_string_。 type="message"のときは送信データ、type="file"のときは送信するファイル名。

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 例

文字列を送信
```lua
res = fa.udp("192.168.0.11", 50000, "message", "hello")
```

ファイルを送信
```lua
res = fa.udp("192.168.0.11", 50000, "file", "hello.txt")
```

### 注意事項

* 非同期の関数呼び出しとなります。
* 既にUDP送受信が動作中の場合は実行が失敗します。

---
## udp

UDPの送信を行います。

### 書式

```lua
res = fa.udp(address, port, type, data)
```

### 引数

##### **address**
_string_。 送信先アドレス。
##### **port**
_number_。 送信先ポート。

##### **type**
_string_。データタイプ。

* "message"：文字列を送信する。
* "file": ファイルを送信する。
{: .ml-4 }

##### **data**
_string_。 type="message"のときは送信データ、type="file"のときは送信するファイル名。

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 例

文字列を送信
```lua
res = fa.udp("192.168.0.11", 50000, "message", "hello")
```

ファイルを送信
```lua
res = fa.udp("192.168.0.11", 50000, "file", "hello.txt")
```

### 注意事項

* 非同期の関数呼び出しとなります。
* 既にUDP送受信が動作中の場合は実行が失敗します。

---
<h2 id="udprecv">udp {mode="recv"}</h2>

UDPの受信を行います。

### 書式

```lua
res = fa.udp(table)
```

### 引数

##### **table**
以下のフィールドがあります。
<dl class="ml-4">
  <dt>mode</dt>
  <dd><em>string</em>。UDP操作の属性。"recv"を指定する。</dd>
  <dt>address</dt>
  <dd><em>string</em>。指定したアドレスからのみ受信する。省略可。省略した場合は全てのアドレスから受信する。</dd>
  <dt>port</dt>
  <dd><em>number</em>。受信待ちポート。</dd>
  <dt>file</dt>
  <dd><em>string</em>。受信したデータを保存するファイル名。"sharedmemory"を指定すると共有メモリに保存する。</dd>
  <dt>offset</dt>
  <dd><em>number</em>。sharedmemory内オフセット。fileに"sharedmemory"を指定した場合のみ指定可。省略可。省略時の値は0。</dd>
  <dt>size</dt>
  <dd><em>number</em>。受信サイズ。指定サイズ受信後に受信動作が停止する。省略可。ファイルに受信する場合でsize省略時は受信するサイズが無制限となる。共有メモリに受信する場合でsize省略時は、2048 - offsetがsize値となる。</dd>
  <dt>timeout</dt>
  <dd><em>number</em>。タイムアウト時間(秒)。指定時間後に受信動作が停止する。省略時はタイムアウト無しとなる。</dd>
</dl>

各フィールドの必須/省略一覧

|         | 受信                                           |
| ------- | ---------------------------------------------- |
| mode    | `recv`                                         |
| address | 省略可                                         |
| port    | 必須                                           |
| file    | 必須                                           |
| offset  | fileに"sharedmemory"を指定時のみ指定可（省略可） |
| size    | 省略可                                         |
| timeout | 省略可                                         |

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 例

共有メモリに受信（アドレス100から10バイト）
```lua
res = fa.udp {mode = "recv",
  port = 50000,
  file = "sharedmemory",
  offset = 100,
  size = 10
}
```

ファイルに受信(100バイト受信で終了、タイムアウト30秒)
```lua
res = fa.udp {mode = "recv",
  port = 50000,
  file = "recv.txt",
  size = 100,
  timeout = 30
}
```

### 注意事項

* 非同期の関数呼び出しとなります。
* 既にUDP送受信が動作中の場合は実行が失敗します。
* fileにファイル名を指定した場合は、受信したデータはファイルに追記されます。
* fileにファイル名を指定した場合は、受信が終了するまでファイルに反映されません。
* fileにファイル名を指定した場合は、1パケットで受信できるサイズの最大値は1460バイトとなります。
* 受信動作は、以下の条件により停止します。
	* 受信バイト数がsizeで指定したサイズに達する(sizeを指定した場合)
  * timeoutで指定した時間が経過する(timeoutを指定した場合)
  * fa.udp {mode="stop"}を実行する

---
<h2 id="udpsend">udp {mode="send"}</h2>

UDPの送信を行います。

### 書式

```lua
res = fa.udp(table)
```

### 引数

##### **table**
以下のフィールドがあります。
<dl class="ml-4">
  <dt>mode</dt>
  <dd><em>string</em>。UDP操作の属性。"send"を指定する。</dd>
  <dt>address</dt>
  <dd><em>string</em>。送信先アドレス。</dd>
  <dt>port</dt>
  <dd><em>number</em>。送信先ポート。</dd>
  <dt>file</dt>
  <dd><em>string</em>。送信データが格納されたファイル名。"sharedmemory"を指定すると共有メモリから送信する。message指定時は指定不可。</dd>
  <dt>message</dt>
  <dd><em>string</em>。送信する文字列。file指定時は指定不可。</dd>
  <dt>offset</dt>
  <dd><em>number</em>。sharedmemory内オフセット。fileに"sharedmemory"を指定した場合のみ指定可。省略可。省略時の値は0。</dd>
  <dt>size</dt>
  <dd><em>number</em>。送信サイズ。省略可。省略時は、fileまたはmessageで指定した内容全てを送信する。fileに"sharedmemory"を指定してsizeを省略した場合は、offsetの位置以降の内容を全て送信する。</dd>
</dl>

各フィールドの必須/省略一覧

|         | 送信                                           |
| ------- | ---------------------------------------------- |
| mode    | `send`                                         |
| address | 必須                                           |
| port    | 必須                                           |
| file    | fileとmessageのどちらか一方のみ指定              |
| message | fileとmessageのどちらか一方のみ指定              |
| offset  | fileに"sharedmemory"を指定時のみ指定可（省略可） |
| size    | 省略可                                         |

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 例

文字列を送信
```lua
res = fa.udp {mode = "send",
  address = "192.168.0.11",
  port = 50000,
  message = "hello"
}
```

ファイルの内容を送信
```lua
res = fa.udp {mode = "send",
  address = "192.168.0.11",
  port = 50000,
  file = "hello.txt"
}
```

共有メモリの内容を送信
```lua
fa.sharedmemory("write", 2, 17, "from sharedmemory")
res = fa.udp {mode = "send",
  address = "192.168.0.11",
  port = 50000,
  file = "sharedmemory",
  offset = 2,
  size = 17
}
```

### 注意事項

* 非同期の関数呼び出しとなります。
* 既にUDP送受信が動作中の場合は実行が失敗します。
* fileとmessageはどちらか一方を指定してください。

---
<h2 id="udpsendinterval">udp {mode="send_interval"}</h2>

UDPの送信を指定間隔で行います。

### 書式

```lua
res = fa.udp(table)
```

### 引数

##### **table**
以下のフィールドがあります。
<dl class="ml-4">
  <dt>mode</dt>
  <dd><em>string</em>。UDP操作の属性。"send_interval"を指定する。</dd>
  <dt>address</dt>
  <dd><em>string</em>。送信先アドレス。</dd>
  <dt>port</dt>
  <dd><em>number</em>。送信先ポート。</dd>
  <dt>file</dt>
  <dd><em>string</em>。送信データが格納されたファイル名。"sharedmemory"を指定すると共有メモリから送信する。message指定時は指定不可。</dd>
  <dt>message</dt>
  <dd><em>string</em>。送信する文字列。file指定時は指定不可。</dd>
  <dt>offset</dt>
  <dd><em>number</em>。sharedmemory内オフセット。fileに"sharedmemory"を指定した場合のみ指定可。省略可。省略時の値は0。</dd>
  <dt>size</dt>
  <dd><em>number</em>。送信サイズ。省略可。省略時は、fileまたはmessageで指定した内容全てを送信する。fileに"sharedmemory"を指定してsizeを省略した場合は、offsetの位置以降の内容を全て送信する。</dd>
  <dt>interval</dt>
  <dd><em>number</em>。送信間隔(秒)。省略可。省略時の値は5。</dd>
  <dt>timeout</dt>
  <dd><em>number</em>。タイムアウト時間(秒)。省略時はタイムアウト無しとなる。</dd>
</dl>

各フィールドの必須/省略一覧

|          | 指定間隔送信                                    |
| -------- | ---------------------------------------------- |
| mode     | `send_interval`                                |
| address  | 必須                                           |
| port     | 必須                                           |
| file     | fileとmessageのどちらか一方のみ指定              |
| message  | fileとmessageのどちらか一方のみ指定              |
| offset   | fileに"sharedmemory"を指定時のみ指定可（省略可） |
| size     | 省略可                                         |
| interval | 省略可                                         |
| timeout  | 省略可                                         |

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

### 例

1秒間隔で10秒間送信

```lua
res = fa.udp {mode = "send_interval",
  address = "192.168.0.11",
  port = 50000,
  file = "hello.txt",
  interval = 1,
  timeout = 10
}
```

### 注意事項

* 非同期の関数呼び出しとなります。
* 既にUDP送受信が動作中の場合は実行が失敗します。
* fileとmessageはどちらか一方を指定してください。
* 指定間隔送信動作は、以下の条件により停止します。
  * timeoutで指定した時間が経過する(timeoutを指定した場合)
  * fa.udp {mode="stop"}を実行する

---
<h2 id="udpstop">udp {mode="stop"}</h2>

UDPの受信動作または指定間隔送信動作を停止します。

### 書式

```lua
res = fa.udp(table)
```

### 引数

##### **table**
以下のフィールドがあります。
<dl class="ml-4">
  <dt>mode</dt>
  <dd><em>string</em>。UDP操作の属性。"stop"を指定する。</dd>
</dl>

### 戻り値

##### **res**
_number_または_nil_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>成功。</dd>
  <dt>nil</dt>
  <dd>失敗。</dd>
</dl>

---
## udp("state")

UDPの送受信状態を取得します。

### 書式

```lua
state, count = fa.udp("state")
```

### 引数

第1引数は"state"固定。

### 戻り値

##### **state**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>UDP送受信が非同期で動作中。</dd>
  <dt>nil</dt>
  <dd>UDP送受信は動作していない。</dd>
</dl>

##### **count**
_number_または_string_。

<dl class="ml-4">
  <dt>number</dt>
  <dd>送受信開始時からの送受信バイト数。</dd>
  <dt>string: "destination unreachable\n"</dt>
  <dd>送信サイズが0で接続機器が見つからない場合の戻り値。</dd>
</dl>

### 例

UDPの送受信が終わるまで待機する

```lua
for i=1, 1000 do
  local state, count = fa.udp("state")
  if state == 0 then
    break
  end
  sleep(20)
end
```

---
## watchdog("event")

WatchDogのタイマーをリセットします。

### 書式

```lua
result = fa.watchdog("event")
```

### 引数

第1引数は"event"固定。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>タイマー再始動。</dd>
  <dt>0</dt>
  <dd>watchdogをスタートしていない（タイマー待ち時間未設定）。</dd>
</dl>

---
## watchdog("start")

WatchDogのタイマーをスタートさせます。タイムアウトするとFlashAirが再起動します。

### 書式

```lua
result = fa.watchdog("start", cycle)
```

### 引数

第1引数は"start"固定。
##### **cycle**
_number_。 watchdogを発行を秒単位で指定します。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>タイマー開始。</dd>
  <dt>0</dt>
  <dd>タイマー待ち時間未設定。</dd>
</dl>

### 備考

**WatchDog**とは、システムが機能し続けていることを確認するためのタイマーのことです。WatchDogのタイマーをスタートした後システムに異常事態が起こり、WatchDogのタイマーをリセットできなかった場合FlashAirを再起動させます。


### 使用例

<div class="code-example" markdown="1">

1.  CONFIGに`LUA_RUN_SCRIPT=/HelloWorld.lua`を追加します。[こちら](../tutorials/lua/2/)のチュートリアルで使用した`HelloWorld.lua`をFlashAirルート上に保存します。すでにHello.txtがルート上にある場合はリネームまたは削除してください。

2.  FlashAirルート上に以下のコードを保存します。

	_/WatchDog.lua_
	```lua
	fa.watchdog("start", 10)
	print("watchdog start")
	for i = 1, 30 do
		result = fa.watchdog("status")
		print("watchdog status:"..result)
	end
	result, filelist, time = fa.search("file", "/DCIM", -1)
	if filelist ~= nill then
		result = fa.watchdog("event")
		print("watchdog restart")
	else
		fa.watchdog("stop")    
		print("watchdog stop")                    
	end
	while 0 ~= fa.watchdog("status") do
		result = fa.watchdog("status")
		print("watchdog status:"..result)
	end
	```
このスクリプトはWatchdogタイマーを10秒間隔でスタートさせ、Watchdogステータスを数回確認、`/DCIM`上にファイルが存在したらWatchdogタイマーを再起動させ、Watchdogステータスが0になるまでprintし続けます。

3.  FlashAirを抜き差します。
4.  `HelloWorld.lua`により作成されたHello.txtを確認します。（Hello There!が1行表示されている状態です）
5.  ブラウザから`WatchDog.lua`を実行します。
6.  ブラウザ上にprint文で出力した内容が表示されたら**抜き差しせず**にHello.txtを確認します。（Hello There!が2行表示されている状態です）<br>FlashAirが再起動され、`LUA_RUN_SCRIPT`が実行されていることが確認できます。
</div>

---
## watchdog("status")

WatchDogの状態を取得します。

### 書式

```lua
result = fa.watchdog("status")
```

### 引数

第1引数は"status"固定。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>0以上</dt>
  <dd>watchdogタイマー発動までの残り時間。</dd>
  <dt>0</dt>
  <dd>発動までの残り時間が１秒未満。</dd>
  <dt>-1</dt>
  <dd>watchdogタイマー待機中。</dd>
</dl>

---
## watchdog("stop")

WatchDogのタイマーを停止します。

### 書式

```lua
result = fa.watchdog("stop")
```

### 引数

第1引数は"stop"固定。

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>0</dt>
  <dd>タイマー停止。</dd>
</dl>

---
## websocket

WebSocket通信をします。

### 書式

```lua
res, type, payload = fa.websocket(table)
```

### 引数

##### **table**
以下のフィールドがあります。

<dl class="ml-4">
  <dt>mode</dt>
  <dd><em>string</em>。WebSocket接続の属性。</dd>
  <dt>address</dt>
  <dd><em>string</em>。接続先のサーバアドレス。</dd>
  <dt>payload</dt>
  <dd><em>string</em> or <em>table</em>。メッセージ内容（文字列、配列）。</dd>
  <dt>type</dt>
  <dd><em>number</em>。メッセージタイプ（テキスト＝<code>1</code>、バイナリ＝<code>2</code>、PING＝<code>9</code>、 省略時＝自動判別）。</dd>
  <dt>length</dt>
  <dd><em>number</em>。メッセージの長さ（省略時＝payloadのオブジェクト長）。</dd>
  <dt> tout</dt>
  <dd><em>number</em>。タイムアウト時間（単位：msec）。</dd>
</dl>

&nbsp;  | オープン   | メッセージ送信  | メッセージ受信  | クローズ     
mode    | `"open"`   | `"send"`      | `"recv"`       | `"close"`
address | 必須       | 不要           | 不要           | 不要       
payload | 不要       | 必須           | 不要           | 不要       
type    | 不要       | 省略可         | 不要           | 不要       
length  | 不要       | 省略可         | 不要           | 不要       
tout    | 不要       | 不要           | 省略可         | 不要       

### 戻り値

##### **res**
_number_。受信成功時は`0`もしくは正数を返します。受信失敗時は負数を返します。
##### **type**
_number_。メッセージタイプ（テキスト＝`1`、バイナリ＝`2`）。メッセージ受信のときのみ使用します。
##### **payload**
_string_ or _table_。受信メッセージ。受信失敗時は`nil`を返します。メッセージ受信のときのみ使用します。

### 例

```lua
res = fa.websocket{mode = "open", address = "ws://localhost/socket"}
res = fa.websocket{mode = "send", payload = "hello!", type = 1}
res, type, payload = fa.websocket{mode = "recv", tout = 5000}
fa.websocket{mode = "close"}
```

---
## WlanLink

ネットワークに無線接続されているかを確認します。

### 書式

```lua
result = fa.WlanLink()
```

### 引数

なし

### 戻り値

##### **result**
_number_。

<dl class="ml-4">
  <dt>1</dt>
  <dd>接続状態。</dd>
  <dt>0</dt>
  <dd>未接続。</dd>
</dl>

---
## パーティション操作

第２パーティションへアクセスを行うことが出来ます。第２パーティションはLuaの内部ログなどを保存し、ホスト機器からのファイルアクセスによる影響がない領域のことです。ドライブレターにより、パーティションを指定することが可能です。

### 書式

```
"p" --1stパーティション（省略化）
"s" --2ndパーティション
"h" --秘匿領域
```

### その他

パーティションの作成は、Linux、Win10などのホスト機器を使用して分割することが可能です。

### 例

```lua
local file = io.open("s:\flashair.log", "a")
```
