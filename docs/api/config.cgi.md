---
layout: tutorials-api
title: config.cgi
parent: APIガイド
nav_order: 2
---

# config.cgi

config.cgiは、FlashAirの設定を変更するために使います。変更にはMASTERCODEが必要です。複数の項目を同時に変更できます。

パラメータ名                                        | 説明                                        | パラメータ例                               | ファームウェアバージョン
-------------------------------------------------- | ---------------------------------------------- | ------------------------------------ | ------------
[APPAUTOTIME](#appautotime)                        | 接続タイムアウト時間の設定                       | `APPAUTOTIME=3000000`                | 2.00.00+    
[APPINFO](#appinfo)                                | アプリケーション独自情報の設定                   | `APPINFO=0123ABCD4567EFGH`           | 1.00.00+    
[APPMODE](#appmode)                                | 無線LANモードの設定                             | `APPMODE=4`                          | 1.00.00+    
[APPNETWORKKEY](#appnetworkkey)                    | ネットワークセキュリティキーの設定                | `APPNETWORKKEY=12345678`             | 1.00.00+    
[APPSSID](#appssid)                                | SSIDの設定                                     | `APPSSID=flashair`                   | 1.00.00+    
[BRGNETWORKKEY](#brgnetworkkey)                    | インターネット同時接続用ネットワークセキュリティキーの設定 | `BRGNETWORKKEY=12345678`             | 2.00.02+    
[BRGSSID](#brgssid)                                | インターネット同時接続用ネットワークSSIDの設定     | `BRGSSID=myhomelan`                  | 2.00.02+    
[CIPATH](#cipath)                                  | WiFi起動画面パスの設定                           | `CIPATH=/DCIM/100__TSB/FA000001.jpg` | 1.00.00+    
[CLEARCODE](#clearcode)                            | マスターコードの削除                             | `CLEARCODE=1`                        | 3.00.00+    
[MASTERCODE](#mastercode)                          | マスターコードの設定                             | `MASTERCODE=0123456789AB`            | 1.00.00+    
[TIMEZONE](#timezone)                              | タイムゾーンの設定                               | `TIMEZONE=36`                        | 3.00.00+    
[WEBDAV](#webdav)                                  | FlashAirドライブ(WebDAV)の設定                   | `WEBDAV=1`                           | 3.00.00+    

---
<h2 id="appautotime">接続タイムアウト時間の設定</h2>
{: .mb-0 }
APPAUTOTIME
{: .text-small }

無線LAN機能の自動タイムアウト時間を設定します。単位はミリ秒です。 設定可能な値は、`60000`から`4294967294`で、デフォルト値は`300000`です。<br>
`0`を指定すると自動停止しない設定になります。ただし、SDメモリカードホスト機器のスリープでカードへの電源供給が遮断された場合などに、停止することがあります。

設定された値は[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**APPAUTOTIME** パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&APPAUTOTIME=3000000&APPMODE=4`

---
<h2 id="appinfo">アプリケーション独自情報の設定</h2>
{: .mb-0 }
APPINFO
{: .text-small }

アプリケーションが独自で使用する情報を、16ケタの英数字で保存することができます。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**APPINFO**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&APPINFO=0123ABCD4567EFGH`

---
<h2 id="appmode">無線LANモードの設定</h2>
{: .mb-0 }
APPMODE
{: .text-small }

無線LANの動作モードを設定します。以下のモードがあります。

0   |  「無線起動画面」のライトプロテクト解除操作で無線LAN機能を起動します。無線LANモードはAPモードです。                             
2   |  「無線起動画面」のライトプロテクト解除操作で無線LAN機能を起動します。無線LANモードはSTAモードです。                            
3   |  「無線起動画面」のライトプロテクト解除操作で無線LAN機能を起動します。無線LANモードはインターネット同時接続モードです。 (ファームウェア 2.00.02以上)
4   | カード電源投入時に無線LAN機能を起動します。無線LANモードはAPモードです。                                           
5   | カード電源投入時に無線LAN機能を起動します。無線LANモードはSTAモードです。                                          
6   |  カード電源投入時に無線LAN機能を起動します。無線LANモードはインターネット同時接続モードです。 (ファームウェア 2.00.02以上)             
その他 | 未定義です。指定しないでください。                                                                  

APモード、STAモード、インターネット同時接続モードについては、[CONFIGファイル]({{ site.baseurl }}/docs/api/config#appmode)の説明をご覧ください。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**APPMODE**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&APPMODE=4`

---
<h2 id="appnetworkkey">ネットワークセキュリティキーの設定</h2>
{: .mb-0 }
APPNETWORKKEY
{: .text-small }

0-63文字の英数字でのネットワークセキュリティキーを設定します。 無線LANのセキュリティ機能を有効にするためには最低8文字が必要です。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**APPNETWORKKEY**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&APPNETWORKKEY=12345678`

---
<h2 id="appssid">SSIDの設定</h2>
{: .mb-0 }
APPSSID
{: .text-small }

無線LAN識別子(SSID)を、1-32文字の英数字で設定します。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**APPSSID**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&APPSSID=flashair`

---
<h2 id="brgnetworkkey">インターネット同時接続モード用ネットワークセキュリティキーの設定</h2>
{: .mb-0 }
BRGNETWORKKEY
{: .text-small }

インターネット同時接続モードで使用するインターネット側ネットワークの セキュリティキーを0-63文字の英数字で設定します。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**BRGNETWORKKEY**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&BRGNETWORKKEY=12345678`

---
<h2 id="brgssid"> インターネット同時接続モード用ネットワークSSIDの設定</h2>
{: .mb-0 }
BRGSSID
{: .text-small }

インターネット同時接続モードで使用するインターネット側ネットワークの 無線LAN識別子(SSID)を、1-32文字の英数字で設定します。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**BRGSSID**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&BRGSSID=myhomelan`

---
<h2 id="cipath">無線起動画面のパス設定</h2>
{: .mb-0 }
CIPATH
{: .text-small }

無線起動画面として使う画像ファイルのフルパスを設定します。 無線起動画面とは、無線LANモード(APPMODE)が0,2,3のいずれかである場合に、無線LAN機能のON/OFFを制御するための画像ファイルです。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**CIPATH**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&CIPATH=/DCIM/100__TSB/FA000001.jpg`

---
<h2 id="clearcode">マスターコードの削除</h2>
{: .mb-0 }
CLEARCODE
{: .text-small }

マスターコードをリセットします。[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**MASTERCODE**が削除され、同時にLOCK=1も削除されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&CLEARCODE=1`

---
<h2 id="mastercode">マスターコードの設定</h2>
{: .mb-0 }
MASTERCODE
{: .text-small }

マスターコードは、SSID(APPSSID)やネットワークキー(APPNETWORKKEY)の設定の際のパスワードとして使われる12ケタの16進数の数字です。値が設定済みのマスターコードと一致した場合は、同時に指定されたその他の設定をCONFIGファイルの対応するパラメータに保存します。マスターコードが設定されていない場合は、設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**MASTERCODE**パラメータに保存され、同時にLOCK=1も設定されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB`

---
<h2 id="timezone">タイムゾーンの設定</h2>
{: .mb-0 }
TIMEZONE
{: .text-small }

FlashAirドライブ(WebDAV)動作時に、FATファイル時間からUTC時間へ変換するためのタイムゾーンを設定します。 15分単位を1として`-48`から`54`の数字で設定します。<br>
日本は、UTC標準時を`0`とし、9時間進めたUTC+9であるため、`36`(9(h)×4(15m)=36)を設定します。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**TIMEZONE**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&TIMEZONE=36`

---
<h2 id="webdav">FlashAirドライブ(WebDAV)の設定</h2>
{: .mb-0 }
WEBDAV
{: .text-small }

FlashAirドライブ機能を有効にするかどうかを指定します。次の値のいずれかを指定します。

0 | FlashAirドライブ機能無効                                                           
1 | FlashAirドライブ機能有効（リードオンリーモード）                                               
2 | FlashAirドライブ機能有効。書き込みを有効にするには、CONFIGファイルに`UPLOAD=1`を設定する必要があります。

一番新しく設定された値が[CONFIGファイル]({{ site.baseurl }}/docs/api/config)の**WEBDAV**パラメータに保存されます。

設定に成功すると`SUCCESS` 、失敗すると`ERROR` が返ります。

### リクエスト例:

`http://flashair/config.cgi?MASTERCODE=0123456789AB&WEBDAV=1`
