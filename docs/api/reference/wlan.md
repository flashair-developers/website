---
layout: api-isdio
title: WLANコマンド
parent: コマンドリファレンス
grand_parent: iSDIO
nav_order: 1
---

# WLANコマンド

コマンドID                    | コマンド名                           | 機能                                                           
---------------------------- | ------------------------------------ | -------------------------------------------------------------
[0001h](#scan)               | Scan()                               | 近傍の無線LANの検索
[0002h](#connect)            | Connect(ssid, networkKey)            | STAモードで起動し、指定の無線LANに接続
[0E401h](#connect8021x)      | Connect8021X(ssid)                   | EAPモードによる接続
[0003h](#establish)          | Establish(ssid, networkKey, encMode) | APモードで起動
[0005h](#startwps)           | StartWPS(ssid, wpsMode, pin)         | STAモードでWPSを開始
[0007h](#disconnect)              | Disconnect()                         | 無線LAN接続の切断


※「0004h:WiFiDirect(wpsMode, pin)」と「0006h:StartWPSAP(wpsMode, pin)」はFlashAirでは利用不可です。

---
<h2 id="scan">Scan()</h2>

接続可能な無線LANを検索するホストリクエストです。 接続可能なSSIDリストは、コマンドプロセスの結果で[Response Data Register Port](../register/response/)から読み取れます。

### コマンドID

0001h

### 引数

無し

### レスポンス

SSIDリストはCommand Response Data（[iSDIO Simplified Specification－2.2.2.3 iSDIO Command Response Data](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_iSDIO_Simplified_Specification_Ver1.10.jpg&f=PartE7_iSDIO_Simplified_Specification_Ver1.10.pdf&e=EN_SSE7){:target="_blank"}参照）のレスポンスデータから読み取れます。SSIDリストのフォーマットは[Wireless LAN Simplified Addendum－3.6.2 Wireless LAN SSID List](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&e=EN_SSLAN){:target="_blank"}で定義されているものです。

---
<h2 id="connect">Connect(ssid, networkKey)</h2>

STAモードで起動し、指定のAPに無線LANで接続するホストリクエストです。FlashAirが完全にAPと接続したときにコマンドプロセスが終了します。

### コマンドID

0002h

### 引数

名前       | 型          | サイズ  | 説明                         
---------- | ----------- | ------ | --------------------------------------------------------------------
ssid       | ASCII 文字型 | 可変長 | 接続先APのSSIDです。Null値にはできません。
networkKey | ASCII 文字型 | 可変長 | SSIDに対応したネットワークキーです。Null値にはできません。無線LAN接続が暗号化されていない場合、この値は省略することができます（引数は「00 00 00 00h」にセットされます）。

### レスポンス

無し

---
<h2 id="connect8021x">Connect8021X(ssid)</h2>

EAPモードによる接続を行います。PEAPモードにおいては、IDとpasswordを指定し、CertificateFileはArgument length=0、値なしと指定します。TLSモードの場合にはクライアント証明書のファイルパスをCertificateFileに設定します。

### コマンドID

0E401h

### 引数

<table>
  <thead>
    <tr>
      <th>名前</th>
      <th>型</th>
      <th>サイズ</th>
      <th>説明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ssid</td>
      <td>ASCII 文字型</td>
      <td>可変長</td>
      <td>接続先APのSSIDです。Null値にはできません。</td>
    </tr>
    <tr>
      <td>Type</td>
      <td>整数型</td>
      <td>1バイト</td>
      <td>接続タイプを指定します。
        <dl class="ml-4 mb-0">
          <dt>0</dt>
          <dd>PEAPモード</dd>
          <dt>1</dt>
          <dd>TLSモード</dd>
        </dl>
      </td>
    </tr>
    <tr>
      <td>ID</td>
      <td>ASCII 文字型</td>
      <td>可変長</td>
      <td>ユーザーIDを1～32文字で設定します。</td>
    </tr>
    <tr>
      <td>password</td>
      <td>ASCII 文字型</td>
      <td>可変長</td>
      <td>PEAPパスワードまたはTLS秘密キーパスワードを1～32文字で設定します。</td>
    </tr>
    <tr>
      <td>CertificateFile</td>
      <td>ASCII 文字型</td>
      <td>可変長</td>
      <td>ファイルパス、TLS証明書を設定します。（.pfxまたは.p12形式）最大64文字指定できます。</td>
    </tr>
  </tbody>
</table>

### レスポンス

無し

---
<h2 id="establish">Establish(ssid, networkKey, encMode)</h2>

無線LAN内でAPモードとして起動するホストリクエストです。FlashAirはDHCPサーバとなり、（ホストの命令なしに）他のSDメモリカードのレスポンスを受けて[Wireless LAN Simplified Addendum－D.4 Peer-to-Peer File Transfer Sequence](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&e=EN_SSLAN){:target="_blank"}に従って、[Wireless LAN Simplified Addendum－Appendix C](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&e=EN_SSLAN){:target="_blank"}で定義されているHTTPリクエスト/レスポンスの処理を行います。APモードでの起動が成功または失敗したときにコマンドプロセスは終了します。

### コマンドID

0003h

### 引数

<table>
  <thead>
    <tr>
      <th>名前</th>
      <th>型</th>
      <th>サイズ</th>
      <th>説明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ssid</td>
      <td>ASCII 文字型</td>
      <td>変数</td>
      <td>SSIDです。Null値にはできません。</td>
    </tr>
    <tr>
      <td>networkKey</td>
      <td>ASCII 文字型</td>
      <td>変数</td>
      <td>SSIDに対応したネットワークキーです。Null値にはできません。無線LAN接続が暗号化されていない場合、この値は省略することができます（引数は「00 00 00 00h」にセットされます）。</td>
    </tr>
    <tr>
      <td>encMode</td>
      <td>整数型</td>
      <td>1バイト</td>
      <td>encModeは、ネットワーク認証とAP用のデータ暗号化方式を示します。
        <dl class="ml-4 mb-0">
          <dt>00h</dt>
          <dd>オープンシステム認証、非暗号化</dd>
          <dt>01h</dt>
          <dd>オープンシステム認証、WEP暗号化（オプション）</dd>
          <dt>03h</dt>
          <dd>WPA-PSK認証、TKIP暗号化（オプション）</dd>
          <dt>04h</dt>
          <dd>WPA-PSK認証、AES暗号化（オプション）</dd>
          <dt>05h</dt>
          <dd>WPA2-PSK認証、TKIP暗号化（オプション）</dd>
          <dt>06h</dt>
          <dd>WPA2-PSK認証、AES暗号化（必須）</dd>
        </dl>
        SDメモリカードにより実装されているネットワーク認証とデータ暗号化、そしてホストがCapability Registerで使用する暗号化がサポートされているかを確認してください。 詳細は
        <a href="https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&amp;f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&amp;e=EN_SSLAN" target="_blank">Wireless LAN Simplified Addendum－3.5 iSDIO Capability Register for Wireless LAN</a>を参照してください。
      </td>
    </tr>
  </tbody>
</table>

### レスポンス

無し

---
<h2 id="startwps">StartWPS(ssid, wpsMode, pin)</h2>

WPS機能のPINコード方式またはプッシュボタン方式で無線LAN内のAPへ接続を開始するホストリクエストです。FlashAirがWPSプロセス後にAPへ接続完了したときにコマンドプロセスは終了します。追加の接続コマンドは必要ありません。

### コマンドID

0005h

### 引数

<table>
  <thead>
    <tr>
      <th>名前</th>
      <th>型</th>
      <th>サイズ</th>
      <th>説明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ssid</td>
      <td>ASCII 文字型</td>
      <td>変数</td>
      <td>接続先APのSSIDです。Null値にはできません。値は除外される可能性があります。この値は省略することができます（引数は「00 00 00 00h」にセットされます）。またプッシュボタン方式の場合は設定値は無視されます。</td>
    </tr>
    <tr>
      <td>wpsMode</td>
      <td>整数型</td>
      <td>1バイト</td>
      <td>WPS機能のモードです。
        <dl class="ml-4 mb-0">
          <dt>01h</dt>
          <dd>PINコード方式</dd>
          <dt>02h</dt>
          <dd>プッシュボタン方式</dd>
        </dl>
      </td>
    </tr>
    <tr>
      <td>pin</td>
      <td>実数型</td>
      <td>4バイト または 8バイト</td>
      <td>PINコード方式のpinコードです。この値は省略することができます（引数は「00 00 00 00h」にセットされます）。またプッシュボタン方式の場合は設定値は無視されます。</td>
    </tr>
  </tbody>
</table>

### レスポンス

接続先APの32バイトのSSIDと64バイトのネットワークキー（合計96バイト）は、([Wireless LAN Simplified Addendum－3.6 iSDIO Response Data for Wireless LAN](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&e=EN_SSLAN){:target="_blank"})のレスポンスデータからWPSリストとして読み取れます。

---
<h2 id="disconnect">Disconnect()</h2>

APへの接続を切断または終了し、アプリケーション使用時はアプリケーションを終了するホストリクエストです。これに伴い、無線LAN接続を要求しているコマンドプロセスは終了します。P2P通信を行っている場合、FlashAirは終了（[Wireless LAN Simplified Addendum－C.2.6 HTTP(END)](https://www.sdcard.org/downloads/pls/pdf/index.php?p=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.jpg&f=PartE7_Wireless_LAN_Simplified_Addendum_Ver1.10.pdf&e=EN_SSLAN){:target="_blank"}を通知するHTTPリクエストメッセージを送信します。FlashAirがAPへの接続を切断または終了したときにコマンドプロセスは終了します。

### コマンドID

0007h

### 引数

無し

### レスポンス

無し
