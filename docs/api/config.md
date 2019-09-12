---
layout: tutorials-api
title: CONFIG
parent: APIガイド
nav_order: 5
---

# CONFIG

`/SD_WLAN/CONFIG`を変更することで、FlashAirの動作を制御することができます。変更した設定を反映するには、FlashAirを一旦取り外して再挿入するなどして再起動する必要があります。このフォルダは隠しフォルダとなっていますので、隠しフォルダを扱う事が出来るツールを使いましょう。なお、config.cgiによる設定変更を行った場合は、本ファイルにすぐに反映されないことがあります。FlashAirを再起動してから、本ファイルを変更してください。CONFIGの記載方法については
CONFIG記載例 を参照してください。<br>
なお、";" 以降はコメントアウトの扱いになります。

* [WLANSD](#wlansd)
* [Vendor](#vendor)

---
## WLANSD

本セクションの設定により、iSDIO機器共通のWireless LANに関する動作を制御することができます。iSDIOの仕様については[ SD Association](https://www.sdcard.org/downloads/pls/index.html){: target="_blank" }を参照してください。

パラメータ名               | 説明             | 例                                                                             | ファームウェアバージョン
-------------------- | -------------- | ----------------------------------------------------------------------------- | ------------
[ID](#id)                   | ID             | `ID=SMITH’S_CARD`                                                             | 1.00.00+    
[DHCP_Enabled](#dhcp_enabled)         | DHCPクライアントの有効化 | `DHCP_Enabled=YES`                                                            | 1.00.00+    
[IP_Address](#ip_address)           | IPアドレス         | `IP_Address=192.168.0.10`                                                     | 1.00.00+    
[Subnet_Mask](#subnet_mask)          | サブネットマスク       | `Subnet_Mask=255.255.255.0`                                                   | 1.00.00+    
[Default_Gateway](#default_gateway)      | デフォルトゲートウェイ    | `Default_Gateway=192.168.0.1`                                                 | 1.00.00+    
[Preferred_DNS_Server](#preferred_dns_server) | 優先DNSサーバ       | `Preferred_DNS_Server=192.168.0.1`                                            | 1.00.00+    
[Alternate_DNS_Server](#alternate_dns_server) | 代替DNSサーバ       | `Alternate_DNS_Server=192.168.0.1`                                            | 1.00.00+    
[Proxy_Server_Enabled](#proxy_server_enabled) | プロキシサーバの有効化    | `Proxy_Server_Enabled=YES`                                               | 1.00.00+    
[Proxy_Server_Name](#proxy_server_name)    | プロキシサーバ        | `Proxy_Server_Name=yourproxy.com`<br>`Proxy_Server_Name=123.123.0.1` | 1.00.00+
[Port_Number](#port_number)          | プロキシサーバのポート番号  | `Port_Number=8080`                                                            | 1.00.00+    

---
## Vendor

本セクションの設定により、FlashAir固有の動作を制御することができます。

パラメータ名                                            | 説明                                        | 例                                  | ファームウェアバージョン
------------------------------------------------------ | ------------------------------------------- | -------------------------------------- | ------------
[APPAUTOTIME](#appautotime)                            | 接続タイムアウト時間                          | `APPAUTOTIME=3000000`                  | 1.00.00+   
[APPCH](#appch)                                        | APモードで使用する無線チャネルの設定           | `APPCH=1`                              | 4.00.04+   
[APPINFO](#appinfo)                                    | アプリケーション独自情報                      | `APPINFO=0123ABCD4567EFGH`             | 1.00.00+    
[APPMODE](#appmode)                                    | 無線LANモード                                | `APPMODE=4`                            | 1.00.00+    
[APPNAME](#appname)                                    | NETBIOS, Bonjour名称                        | `APPNAME=myflashair`                   | 1.00.00+    
[APPNETWORKKEY](#appnetworkkey)                        | ネットワークセキュリティーキー              | `APPNETWORKKEY=12345678`                 | 1.00.00+    
[APPSSID](#appssid)                                    | SSID                                        | `APPSSID=flashair`                     | 1.00.00+    
[BRGNETWORKKEY](#brgnetworkkey)                        | インターネット同時接続用ネットワークセキュリティキー   | `BRGNETWORKKEY=12345678`         | 2.00.02+    
[BRGSSID](#brgssid)                                    | インターネット同時接続用ネットワークSSID        | `BRGSSID=myhomelan`                    | 2.00.02+    
[CID](#cid)                                            | カードID                                     | `CID=02544d53573038470750002a0200c201` | 1.00.00+    
[CIPATH](#cipath)                                      | 無線起動画面のパス                            | `CIPATH=/DCIM/100__TSB/FA000001.jpg`   | 1.00.00+    
[COMMANDCGI](#commandcgi)                              | command.cgiの有効opcodeを指定                | `COMMANDCGI=100-103`                   | 3.00.00+    
[DELCGI](#delcgi)                                      | CGI の無効化                                 | `DELCGI=/,/thumbnail.cgi`              | 2.00.02+    
[DHCPC_RETRANS_MAX](#dhcpc_retrans_max)                | DHCPクライアントの再送回数                    | `DHCPC_RETRANS_MAX=5`                  | 4.00.03+    
[DNSMODE](#dnsmode)                                    | DNS動作モード                                | `DNSMODE=1`                            | 2.00.02+    
[EAPCERT](#eapcert)                                    | TLS証明書のファイルパス                       | `EAPCERT=/cert.pfx`                    | 4.00.03+    
[EAPPASSWORD](#eappassword)                            | PEAPパスワードまたはTLS秘密キーパスワード      | `EAPPASSWORD=12345678`                 | 4.00.03+    
[EAPTYPE](#eaptype)                                    | 暗号化の規格                                 | `EAPTYPE=TLS`                          | 4.00.03+    
[EAPUSER](#eapuser)                                    | EAPTYPEが指定された場合に利用するユーザーID     | `EAPUSER=SMITH`                        | 4.00.03+    
[HTTPDBUFF](#httpdbuff)                                | メモリサイズ                                  | `HTTPDBUFF=2920`                       | 2.00.03+    
[HTTPDMODE](#httpdmode)                                | 認証方法                                     | `HTTPDMODE=1`                          | 1.00.04+    
[HTTPDPASS](#httpdpass)                                | Basic認証のパスワード、Digest認証のハッシュ値   | `HTTPDPASS=12345678`                   | 1.00.04+    
[HTTPDUSER](#httpduser)                                | Basic認証のユーザ名                           | `HTTPDUSER=flashair`                   | 1.00.04+    
[IFMODE](#ifmode)                                      | SDインターフェース端子のI/O利用機能の有効化     | `IFMODE=1`                             | 2.00.03+    
[LOCK](#lock)                                          | 初期設定済みフラグ                            | `LOCK=1`                               | 1.00.00+    
[LUA_RUN_SCRIPT](#lua_run_script)                      | 起動時に実行するLuaスクリプトのパス            | `LUA_RUN_SCRIPT=/bootscript.lua`       | 3.00.00+    
[LUA_SD_EVENT](#lua_sd_event)                          | ファイル書き込み時に実行するLuaスクリプトのパス | `LUA_SD_EVENT=/writescript.lua`        | 3.00.00+    
[MASTERCODE](#mastercode)                              | マスターコード                               | `MASTERCODE=0123456789AB`              | 1.00.00+    
[NOISE_CANCEL](#noise_cancel)                          | ノイズキャンセル                             | `NOISE_CANCEL=2`                       | 2.00.03+    
[PRODUCT](#product)                                    | 製品コード                                   | `PRODUCT=FlashAir`                     | 1.00.00+    
[REDIRECT](#redirect)                                  | HTTPリダイレクトモード                        | `REDIRECT=1`                           | 2.00.03+    
[STAMAC](#stamac)                                      | STAモードでのアドレスフィルタリング機能        | `STAMAC=40b395A0851a`                  | 2.00.02+    
[STANUM](#stanum)                                      | STAモードでの接続台数制限機能                 | `STANUM=2`                             | 2.00.02+    
[STA_RETRY_CT](#sta_retry_ct)                          | STAモードでの接続リトライ回数                 | `STA_RETRY_CT=0`                       | 3.00.00+    
[TIMEZONE](#timezone)                                  | タイムゾーン                                 | `TIMEZONE=36`                          | 3.00.00+    
[UPDIR](#updir)                                        | アップロード先ディレクトリの指定               | `UPDIR=/DCIM`                          | 2.00.03+    
[UPLOAD](#upload)                                      | アップロード機能の有効化                      | `UPLOAD=1`                             | 1.00.00+    
[VENDOR](#vendor)                                      | ベンダーコード                               | `VENDOR=TOSHIBA`                       | 1.00.00+    
[VERSION](#version)                                    | ファームウェアバージョン                      | `VERSION=F24A6W3AW1.00.03`             | 1.00.00+    
[WEBDAV](#webdav)                                      | FlashAirドライブ(WebDAV)機能の有効化          | `WEBDAV=0`                             | 3.00.00+    
[WLANAPMODE](#wlanapmode)                              | 無線LAN規格                                  | `WLANAPMODE=0x03`                      | 3.00.00+    

---
## CONFIG記載例

```
[WLANSD]

ID=SMITH’S_CARD
DHCP_Enabled=YES
IP_Address=
Subnet_Mask=
Default_Gateway=
Preferred_DNS_Server=
Alternate_DNS_Server=
Proxy_Server_Enabled=YES
Proxy_Server_Name=yourproxy.com
Port_Number=8080

[Vendor]

CIPATH=/DCIM/100__TSB/FA000001.JPG
APPMODE=4
APPNETWORKKEY=********
VERSION=FA9CAW3AW3.00.00
CID=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
PRODUCT=FlashAir
VENDOR=TOSHIBA
```

---
## ID

IDを指定します。ASCII文字で16文字まで指定できます。デフォルトは空です。

### 例:

`ID=SMITH’S_CARD`

---
<h2 id="dhcp_enabled" class="mb-0">DHCPクライアントの有効化</h2>
(DHCP_Enabled)
{: .text-small }

DHCPクライアントを有効にするかどうかを指定します。次の値のいずれかを指定します。

YES(デフォルト) | DHCPクライアント有効
-------------- | ------------
NO             | DHCPクライアント無効

### 例:

`DHCP_Enabled=YES`

---
<h2 id="ip_address" class="mb-0">IPアドレス</h2>
(IP_Address)
{: .text-small }

DHCPクライアントが無効になっている場合、IPアドレスを指定します。デフォルト値は"0.0.0.0"です。"DHCP_Enabled=YES"の場合、指定した値は無視されます。

### 例:

`IP_Address=192.168.0.10`

---
<h2 id="subnet_mask" class="mb-0">サブネットマスク</h2>
(Subnet_Mask)
{: .text-small }

DHCPクライアントが無効になっている場合、サブネットマスクを指定します。デフォルト値は"0.0.0.0"です。"DHCP_Enabled=YES"の場合、指定した値は無視されます。

### 例:

`Subnet_Mask=255.255.255.0`

---
<h2 id="default_gateway" class="mb-0">デフォルトゲートウェイ</h2>
(Default_Gateway)
{: .text-small }

DHCPクライアントが無効になっている場合、デフォルトゲートウェイを指定します。デフォルト値は"0.0.0.0"です。"DHCP_Enabled=YES"の場合、指定した値は無視されます。

### 例:

`Default_Gateway=192.168.0.1`

---
<h2 id="preferred_dns_server" class="mb-0">優先DNSサーバ</h2>
(Preferred_DNS_Server)
{: .text-small }

DHCPクライアントが無効になっている場合、優先DNSサーバを指定します。デフォルト値は"0.0.0.0"です。"DHCP_Enabled=YES"の場合、指定した値は無視されます。

### 例:

`Preferred_DNS_Server=192.168.0.1`

---
<h2 id="alternate_dns_server" class="mb-0">代替DNSサーバ</h2>
(Alternate_DNS_Server)
{: .text-small }

DHCPクライアントが無効になっている場合、代替DNSサーバを指定します。デフォルト値は"0.0.0.0"です。"DHCP_Enabled=YES"の場合、指定した値は無視されます。

### 例:

`Alternate_DNS_Server=192.168.0.1`

---
<h2 id="proxy_server_enabled" class="mb-0">プロキシサーバの有効化</h2>
(Proxy_Server_Enabled)
{: .text-small }

プロキシサーバを有効にするかどうかを指定します。次の値のいずれかを指定します。

YES           | プロキシサーバ有効
------------- | ---------
NO(デフォルト) | プロキシサーバ無効

### 例:

`Proxy_Server_Enabled=YES`

---
<h2 id="proxy_server_name" class="mb-0">プロキシサーバ</h2>
(Proxy_Server_Name)
{: .text-small }

プロキシサーバのドメイン名、又はIPアドレスを指定します。デフォルト値は空です。"Proxy_Server_Enabled=NO"の場合、指定した値は無視されます。

### 例:

`Proxy_Server_Name=yourproxy.com`<br>
`Proxy_Server_Name=123.123.0.1`

---
<h2 id="port_number" class="mb-0">プロキシサーバのポート番号</h2>
(Port_Number)
{: .text-small }

プロキシサーバのポート番号を指定します。デフォルト値は"8080"です。"Proxy_Server_Enabled=NO"の場合、指定した値は無視されます。

### 例:

`Port_Number=8080`

---
<h2 id="appautotime" class="mb-0">接続タイムアウト時間</h2>
(APPAUTOTIME)
{: .text-small }

無線LAN機能の自動タイムアウト時間を設定します。無線LANの動作モードが`4`の場合に、他の端末から本パラメータで指定された時間接続がなければ無線LAN機能を停止します。設定可能な値は、`60000`から`4294967294`で、デフォルト値は`300000`です。単位はミリ秒です。

`0`を指定すると自動停止しない設定になります。ただし、SDメモリカードホスト機器のスリープでカードへの電源供給が遮断された場合などに、停止することがあります。

APPAUTOTIMEが有効となるのは、APPMODEがAPの場合のみとなります。STA、BRG時にAPPAUTOTIMEで設定した時間でタイムアウトになることはありません。

### 例:

`APPAUTOTIME=3000000`

---
<h2 id="appch" class="mb-0">APモードで使用する無線チャネルの設定</h2>
(APPCH)
{: .text-small }

FlashAirが無線LAN親機となるモードの際に使用する無線チャネルを設定します。

設定可能な値は、0 から 11 です。 1～11を指定した場合は、指定した値に無線チャネルが固定されます。0を指定した場合は、無線チャネルは固定されず、FlashAirが自動で決定します。デフォルト値は0となります。

※インターネット同時接続モードにおけるAPモードで使用する無線チャネルには反映されません。

### 例:

`APPCH=1`

---
<h2 id="appinfo" class="mb-0">アプリケーション独自情報</h2>
(APPINFO)
{: .text-small }

アプリケーションが独自で使用する情報を、1-16ケタの英数字で保存することができます。

### 例:

`APPINFO=0123ABCD4567EFGH`

---
<h2 id="appmode" class="mb-0">無線LANモード</h2>
(APPMODE)
{: .text-small }

無線LANの動作モードを設定します。以下のモードがあります。

0     |  手動起動モードで無線LAN機能を起動します。無線LANモードはAPモードです。                             
2     |  手動起動モードで無線LAN機能を起動します。無線LANモードはSTAモードです。                            
3     |  手動起動モードで無線LAN機能を起動します。無線LANモードはインターネット同時接続モードです。 (ファームウェア 2.00.02以上)
4     | 自動起動モードで無線LAN機能を起動します。無線LANモードはAPモードです。                              
5     | 自動起動モードで無線LAN機能を起動します。無線LANモードはSTAモードです。                             
6     | 自動起動モードで無線LAN機能を起動します。無線LANモードはインターネット同時接続モードです。 (ファームウェア 2.00.02以上) 
その他 | 未定義です。指定しないでください。                                                    

##### **手動起動モード**
無線LAN機能のON/OFFを手動で切り替えるモードです。<br>
出荷時にFlashAirにあらかじめ保存されている無線LAN起動画像（/DCIM/100__TSB/FA000001.JPG）のプロテクト（削除できないようにする）をOFFにすると無線LAN機能を起動し、ONにすると無線LAN機能を停止することができます。<br>
プロテクトのON/OFFは主にデジカメ側で行います。

##### **自動起動モード**
カードを挿入した機器の電源を入れると、自動的に無線LAN機能が起動するモードです。

##### **AP モード**
APモード（アクセスポイントモード）とは、FlashAirが無線LAN親機となるモードです。<br>
`APPSSID`、`APPNETWORKKEY`にセットされているパラメータを、FlashAirを親機とするLANのSSID、ネットワークセキュリティキーとして使用します。セキュリティモードはWPA2-AESです。

##### **STA モード**
STAモード（ステーションモード）とは、FlashAirが無線LAN子機となるモードです。<br>
他の無線LAN親機が存在しなければなりません。<br>
`APPSSID`、`APPNETWORKKEY`にセットされているパラメータを、親機のSSID、ネットワークセキュリティキーとして使用します。<br>
利用方法は[上級者向けチュートリアル - ステーションモードの利用]({{ site.baseurl }}/docs/tutorials/advanced/1)を参照してください。

##### **インターネット同時接続モード**
APモードとSTAモードを同時に有効にするモードです。<br>
STAモード機能で接続する他の無線LAN親機が存在しない場合は、APモード機能のみが有効になります。<br>
`APPSSID`、`APPNETWORKKEY`にセットされているパラメータを、FlashAirを親機とするLANのSSID、ネットワークセキュリティキーとして使用します。セキュリティモードはWPA2-AESです。`BRGSSID`、`BRGNETWORKKEY`にセットされているパラメータを、親機のSSID、ネットワークセキュリティキーとして使用します。<br>
利用方法は[上級者向けチュートリアル - インターネット同時接続モードの利用]({{ site.baseurl }}/docs/tutorials/advanced/3)を参照してください。<br>
なお、バージョン2.00.03以降のファームウェアにおいてこのモードを利用する場合、11nではなく11b/gによる動作となります。

### 例:

`APPMODE=4`

---
<h2 id="appname" class="mb-0">NETBIOS, Bonjour名称</h2>
(APPNAME)
{: .text-small }

NETBIOS, Bonjourで返される名前を、15文字以内の英数字小文字で設定します。 CONFIGファイルに設定がない場合、あるいはCONFIGファイルが存在しない場合は、`flashair`が使われます。

### 例:

`APPNAME=myflashair`

---
<h2 id="appnetworkkey" class="mb-0">ネットワークセキュリティキー</h2>
(APPNETWORKKEY)
{: .text-small }

0-63文字の英数字でのネットワークセキュリティキーを設定します。 無線LANのセキュリティ機能を有効にするためには最低8文字が必要です。

### 例:

`APPNETWORKKEY=12345678`

---
<h2 id="appssid" class="mb-0">SSID</h2>
(APPSSID)
{: .text-small }

無線LAN識別子(SSID)を、1-32文字の英数字で設定します。 CONFIGファイルに設定がない場合、あるいはCONFIGファイルが存在しない場合は、`flashair_<MACADDRESS>`が使われます。

### 例:

`APPSSID=flashair`

---
<h2 id="brgnetworkkey" class="mb-0">インターネット同時接続モード用ネットワークセキュリティキー</h2>
(BRGNETWORKKEY)
{: .text-small }

インターネット同時接続モードで使用するインターネット側ネットワークの ネットワークセキュリティキーを0-63文字の英数字で設定します。

### 例:

`BRGNETWORKKEY=12345678`

---
<h2 id="brgssid" class="mb-0">インターネット同時接続モード用ネットワークSSID</h2>
(BRGSSID)
{: .text-small }

インターネット同時接続モードで使用するインターネット側ネットワークの無線LAN識別子(SSID)を、 1-32文字の英数字で設定します。

### 例:

`BRGSSID=myhomelan`

---
<h2 id="cid" class="mb-0">カードID</h2>
(CID)
{: .text-small }

SD規格で定められているCard Identifier (CID)です。 32ケタの16進数です。

### 例:

`CID=02544d53573038470750002a0200c201`

---
<h2 id="cipath" class="mb-0">無線起動画面のパス設定</h2>
(CIPATH)
{: .text-small }

無線起動画面として使う画像ファイルのフルパスを設定します。 無線起動画面とは、無線LANモード(APPMODE)が`0`,`2`,`3`のいずれかである場合に、無線LAN機能のON/OFFを制御するための画像ファイルです。

### 例:

`CIPATH=/DCIM/100__TSB/FA000001.jpg`

---
<h2 id="commandcgi" class="mb-0">command.cgiの有効opcodeを指定</h2>
(COMMANDCGI)
{: .text-small }

command.cgiの有効opcodeを指定します。

### 例:

`COMMANDCGI=100-103`

---
<h2 id="delcgi" class="mb-0">CGI の無効化</h2>
(DELCGI)
{: .text-small }

指定した CGI を 無効化します。

### パラメータ:
下記のパラメータをカンマ区切りで指定します。

/              | ファイルダウンロード機能を無効化します。 
-------------- | ---------------------
/command.cgi   | command.cgiを無効化します。  
/config.cgi    | config.cgiを無効化します。   
/thumbnail.cgi | thumbnail.cgiを無効化します。
/upload.cgi    | upload.cgiを無効化します。   

### 例:

`DELCGI=/,/thumbnail.cgi`

---
<h2 id="dhcpc_retrans_max" class="mb-0">DHCPクライアントの再送回数</h2>
(DHCPC_RETRANS_MAX)
{: .text-small }

DHCPクライアントの再送回数を指定します。0を指定した場合には、無限に再送します。設定値は、`0`～`255`となります。

### 例:

`DHCPC_RETRANS_MAX=5`

---
<h2 id="dnsmode" class="mb-0">DNS動作モードの設定</h2>
(DNSMODE)
{: .text-small }

FlashAirのDNS解決方法を変更します。以下のモードがあります。

0         |  APPNAME、あるいは既定値の`flashair`での問い合わせのみ、IPアドレスを返します。                                                                                1 (デフォルト) | 任意のDNSの問い合わせ全てに対して、自IPアドレスを返信します。

例えば、`APPNAME=myflashair` と設定されている場合、"http://flashair" でアクセスしてもカードのIPアドレスを返します。

### 例:

`DNSMODE=1`

---
<h2 id="eapcert" class="mb-0">TLS証明書のファイルパス</h2>
(EAPCERT)
{: .text-small }

TLS証明書のファイルパスを指定します。指定可能な証明書は.pfxまたは.p12形式となります。

### 例:

`EAPCERT=/cert.pfx`

---
<h2 id="eappassword" class="mb-0">PEAPパスワードまたはTLS秘密キーパスワード</h2>
(EAPPASSWORD)
{: .text-small }

PEAPパスワードまたはTLS秘密キーパスワードを設定します。

### 例:

`EAPPASSWORD=12345678`

---
<h2 id="eaptype" class="mb-0">暗号化の規格</h2>
(EAPTYPE)
{: .text-small }

STAモード設定時にEAPTYPEが設定されている場合、8021Xモード(WPA2 Enterprise)で動作します。設定値は`PEAP` 、`TLS` となります。`PEAP` を設定した場合においては、EAPUSERとEAPPASSWORDのパラメータを用いて、接続を試みます。`TLS` を指定した場合はクライアント証明書を用いた接続を行います。この時、接続するアクセスポイントのSSIDは、APPSSIDにて指定します。

### 例:

`EAPTYPE=TLS`

### 設定例:

無線セキュリティーの設定

* 認証方式：WPA-EAP
* WPAタイプ：WPA2-EAP
* 暗号化方式：AES
  * ※IEEE802.1X/EAPでの接続は不可

EAP-PEAPのCOFIG設定

<pre>
EAPTYPE=PEAP
EAPUSER=flashair 
EAPPASSWORD=******** # ユーザ管理で設定したパスワード
</pre>

EAP-TLSのCOFIG設定

<pre>
EAPTYPE=TLS
EAPCERT=/radius2.p12 # RADIUSサーバに設定した証明書と同じでも可
EAPPASSWORD=******** # 証明書作成時に設定したパスワード
EAPUSER=flashair
</pre>

---
<h2 id="eapuser" class="mb-0">EAPTYPEが指定された場合に利用するユーザーID</h2>
(EAPUSER)
{: .text-small }

EAPTYPEが指定された場合に利用するユーザーIDを指定します。

### 例:

`EAPUSER=SMITH`

---
<h2 id="httpdbuff" class="mb-0">メモリサイズ</h2>
(HTTPDBUFF)
{: .text-small }

HTTPサーバで使用するメモリ量を削減することで、Luaスクリプトが使用可能なメモリ量を増加することができます。 なおHTTPサーバのメモリを削減した場合には、ダウンロードのスループットが低下します。 設定可能範囲は`2920`から`23360`です。デフォルト値は`23360`です。

### 例:

`HTTPDBUFF=2920`

---
<h2 id="httpdmode" class="mb-0">認証方法</h2>
(HTTPDMODE)
{: .text-small }

HTTPサーバが使用する認証方法を設定します。以下のモードがあります。

0 (デフォルト) | 認証なし    
1         | Basic認証 
2         | Digest認証

### 例:

`HTTPDMODE=1`

---
<h2 id="httpdpass" class="mb-0">Basic認証のパスワード、Digest認証のハッシュ値</h2>
(HTTPDPASS)
{: .text-small }

Basic認証で使われるパスワード、またはDigest認証で使われるハッシュ値を設定します。<br>Digest認証のRealmは"Secret Zone"となります。Digest認証の場合、下記の値を32ケタの16進数で記載してください。<br>MD5(ユーザー名 ":" "Secret Zone" ":" パスワード)

#### ・例（Basic認証）:

`HTTPDPASS=12345678`

#### ・例（Digest認証）:

ユーザー名：`username`<br>
パスワード：`password`<br
の場合、MD5("username:Secret Zone:password")を計算する。<br>
`HTTPDPASS=66643ffbf66badfe10b904134e6bd1dc`

---
<h2 id="httpduser" class="mb-0">Basic認証のユーザ名</h2>
(HTTPDUSER)
{: .text-small }

Basic認証で使われるユーザ名を設定します。Digest認証時では使用されません。

### 例:

`HTTPDUSER=flashair`

---
<h2 id="ifmode" class="mb-0">SDインターフェース端子のI/O利用機能の有効化</h2>
(IFMODE)
{: .text-small }

SDインターフェイス端子を、汎用のI/O信号端子として利用し、 信号の読み書きを行う機能を有効にします。<br>
利用方法は[command.cgi: SDインターフェース端子のI/O利用]({{ site.baseurl }}/docs/api/command.cgi.html#190)を参照してください。

1                   | SDインターフェース端子のI/O利用機能有効
それ以外 (デフォルト) | SDインターフェース端子のI/O利用機能無効

### 例:

`IFMODE=1`

---
<h2 id="lock" class="mb-0">初期設定済みフラグ</h2>
(LOCK)
{: .text-small }

初期設定が完了しているかを示すフラグです。初期設定が完了している場合は`1`が設定されます。 本パラメータがない場合は、ブラウザから接続すると初期設定としてSSIDとネットワークセキュリティキーの設定画面が表示されます。`1`以外の値は設定しないでください。

### 例:

`LOCK=1`

---
<h2 id="lua_run_script" class="mb-0">起動時に実行するLuaスクリプトのパス</h2>
(LUA_RUN_SCRIPT)
{: .text-small }

FlashAir起動時に実行するLuaスクリプトのファイルパスを絶対パスで指定します。起動５秒後に指定ファイルが実行されます。

### 例:

`LUA_RUN_SCRIPT=/bootscript.lua`

---
<h2 id="lua_sd_event" class="mb-0">ファイル書き込み時に実行するLuaスクリプトのパス</h2>
(LUA_SD_EVENT)
{: .text-small }

FlashAirへのファイル書き込み時に実行するLuaスクリプトのファイルパスを絶対パスで指定します。SDメモリカードの書き込みが発生した場合に指定ファイルが実行されます。最後のデータの書き込みから0.5秒後に実行されます。

### 例:

`LUA_SD_EVENT=/writescript.lua`

---
<h2 id="mastercode" class="mb-0">マスターコード</h2>
(MASTERCODE)
{: .text-small }

マスターコードは、SSID(APPSSID)やネットワークキー(APPNETWORKKEY)の設定の際のパスワードとして使われる12ケタの16進数の数字です。<br>
未設定の場合は、config.cgiで各種設定を変更する前に必ず、マスターコードを設定する必要があります。<br>
MASTERCODEを削除することで、マスタコードを初期状態に戻すことができます。

### 例:

`MASTERCODE=0123456789AB`

---
<h2 id="noise_cabcel" class="mb-0">ノイズキャンセル</h2>
(NOISE_CANCEL)
{: .text-small }

電波環境が良好とは言えない環境においてこの設定を利用することにより、距離特性と引き換えにノイズ耐性を多少向上させることが出来ます。

2                   | ノイズキャンセルを有効にする
それ以外 (デフォルト) | ノイズキャンセルを無効にする

### 例:

`NOISE_CANCEL=2`

---
<h2 id="product" class="mb-0">製品コード</h2>
(PRODUCT)
{: .text-small }

FlashAirの製品名称です。`FlashAir`となります。

### 例:

`PRODUCT=FlashAir`

---
<h2 id="redirect" class="mb-0">HTTPリダイレクトモード</h2>
(REDIRECT)
{: .text-small }

HTTPリダイレクトモードを変更します。次の値のいずれかを指定します。

1 (デフォルト) | リダイレクト機能有効
0         | リダイレクト機能無効

### 例:

`REDIRECT=1`

---
<h2 id="stamac" class="mb-0">STAモードでのアドレスフィルタリング機能</h2>
(STAMAC)
{: .text-small }

STAモードでのアドレスフィルタリング機能を指定します。複数台登録する場合は、７台まで登録可能。その場合は、STAMACを複数行記載する必要があります。

### 例:

`STAMAC=40b395A0851a`

---
<h2 id="stanum" class="mb-0">STAモードでの接続台数制限</h2>
(STANUM)
{: .text-small }

STAモードでの接続台数制限を指定します。記載しない場合は7台まで接続可能です。

### 例:

`STANUM=2`

---
<h2 id="sta_retry_ct" class="mb-0">STAモードでの接続リトライ回数</h2>
(STA_RETRY_CT)
{: .text-small }

STAモードでの無線LAN親機への接続リトライ回数を指定します。`0`は無限にリトライします。

### 例:

`STA_RETRY_CT=3`

---
<h2 id="timezone" class="mb-0">タイムゾーン</h2>
(TIMEZONE)
{: .text-small }

FlashAirドライブ(WebDAV)動作時に、FATファイル時間からUTC時間へ変換するためのタイムゾーンを設定します。 15分単位を1として`-48`から`54`の数字で設定します。日本は、UTC標準時を`0`とし、9時間進めたUTC+9であるため、`36`(9(h)×4(15m)=36)を設定します。

### 例:

`TIMEZONE=36`

---
<h2 id="updir" class="mb-0">アップロード先ディレクトリの指定</h2>
(UPDIR)
{: .text-small }

アップロード先ディレクトリを指定します。

### 例:

`UPDIR=/DCIM`

---
<h2 id="upload" class="mb-0">アップロード機能の有効化</h2>
(UPLOAD)
{: .text-small }

アップロード機能を有効にするかどうかを指定します。次の値のいずれかを指定します。

1                    | アップロード機能有効
それ以外 (デフォルト) | アップロード機能無効

### 例:

`UPLOAD=1`

---
<h2 id="vendor" class="mb-0">ベンダーコード</h2>
(VENDOR)
{: .text-small }

FlashAirベンダーの名前です。`TOSHIBA`となります。

### 例:

`VENDOR=TOSHIBA`

---
<h2 id="version" class="mb-0">ファームウェアバージョン</h2>
(VERSION)
{: .text-small }

ファームウェアのバージョンです。

### 例:

`VERSION=F24A6W3AW1.00.03`

---
<h2 id="webdav" class="mb-0">FlashAirドライブ(WebDAV)</h2>
(WEBDAV)
{: .text-small }

FlashAirドライブ機能を有効にするかどうかを指定します。次の値のいずれかを指定します。

0 | FlashAirドライブ機能無効            
1 | FlashAirドライブ機能有効（リードオンリーモード）
2 | FlashAirドライブ機能有効（リードライトモード） 

### 例:

`WEBDAV=0`

---
<h2 id="wlanapmode" class="mb-0">無線LAN規格</h2>
(WLANAPMODE)
{: .text-small }

無線LAN規格を指定します。次の値のいずれかを指定します。

0x01         | 802.11b 
0x02         | 802.11g 
0x03 (デフォルト) | 802.11bg
0x82         | 802.11ng

### 例:

`WLANAPMODE=0x03`
