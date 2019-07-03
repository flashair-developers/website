---
layout: api-isdio
title: Status Register
parent: レジスタマップ
grand_parent: iSDIO
nav_order: 3
---

# Status Register

FlashAirのiSDIOステータスレジスタマップです。

* [iSDIOステータスレジスタ](#isdioステータスレジスタ)
* [無線LAN機能 ステータスレジスタ](#無線lan機能-ステータスレジスタ)

---
## iSDIOステータスレジスタ

iSDIO機器すべてで利用できるレジスタです。

* 引用元: Table 2-7 : iSDIO Status Register Map - [iSDIO Simplified Specification Version 1.10](https://www.sdcard.org/downloads/pls/index.html){: target="_blank" }


アドレス  | サイズ\[バイト\] | 名称                          | Bit7 | Bit6 | Bit5 | Bit4 | Bit3     | Bit2     | Bit1     | Bit    0 | 読み込み／書き込み           
-------- | --------------- | ----------------------------- | ---- | ---- | ---- | ---- | -------- | -------- | -------- | -------- | -------------------------
00400h   | 1               | Command Write Status          | -    | -    | -    | -    | -        | -        | CWA      | CWU(opt) | 読み込み／書き込み 
00401h   | 15              | Reserved                      |      |      |      |      |          |          |          |          | 読み込み専用 
00420h   | 1               | iSDIO Status                  | -    | -    | -    | -    | ASU(Int) | MCU(Int) | ESU(Int) | CRU(Int) | 読み込み／書き込み 
00421h   | 1               | iSDIO Status (Reserved)       | -    | -    | -    | -    | -        | -        | -        | -        | 
00422h   | 1               | iSDIO Int Enable              | -    | -    | -    | -    | ASU_ENA  | MCU_ENA  | ESU_ENA  | CRU_ENA  | 読み込み／書き込み 
00423h   | 1               | iSDIO Int Enable (Reserved)   | -    | -    | -    | -    | -        | -        | -        | -        | 
00424h   | 1               | Error Status                  | -    | -    | -    | -    | APE      | RPE      | CWE      | CRE      | 読み込み／書き込み 
00425h   | 1               | Error Status (Reserved)       | -    | -    | -    | -    | -        | -        | -        | -        |
00426h   | 1               | Memory Status                 | -    | -    | -    | -    | -        | -        | FAT      | MEX      | 読み込み専用 
00427h   | 1               | Memory Status (Reserved)      | -    | -    | -    | -    | -        | -        | -        | -        |   
00428h   | 24              | Reserved                      |      |      |      |      |          |          |          |          |    
00440h   | 160             | Command Response Status Queue |      |      |      |      |          |          |          |          | 読み込み専用 
004E0h   | 32              | Reserved                      |      |      |      |      |          |          |          |          |    
00500h   | 256             | Application Status            |      |      |      |      |          |          |          |          |   
{: .table-sm }

（解説は順次公開予定）

## 無線LAN機能 ステータスレジスタ

無線LAN機能に対応したiSDIO機器で利用できるレジスタです。 FlashAirで利用できない部分は省略してあります。


* 引用元: Table 3-2 : Application Status for Wireless LAN - [Wireless LAN Simplified Addendum Version 1.10](https://www.sdcard.org/downloads/pls/index.html){: target="_blank" }

下記のFlashAir独自拡張があります。


### BridgeモードにおけるWLANステータス値*1

アドレス：00507h、bit0

説明：Bridgeモード動作時に1bとなります。

### EAPモードを含むEncryption Modeステータス値*2

アドレス：00528h、bit0～7

説明：EAPモード（WPA/WPA2 Enterprise）を示す次の値を追加しています。

* 07h: WPA-EAP認証、TKIP暗号化
* 08h: WPA-EAP認証、AES暗号化
* 09h: WPA2-EAP認証、TKIP暗号化
* 0Ah: WPA2-EAP認証、AES暗号化

<table class="table-sm">
  <thead>
    <tr>
      <th>アドレス</th>
      <th>サイズ<br>[バイト]</th>
      <th>名称</th>
      <th>Bit7</th>
      <th>Bit6</th>
      <th>Bit5</th>
      <th>Bit4</th>
      <th>Bit3</th>
      <th>Bit2</th>
      <th>Bit1</th>
      <th>Bit0</th>
      <th>読み込み／<br>書き込み</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>00500h</td>
      <td>6</td>
      <td>Reserved</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>00506h</td>
      <td>1</td>
      <td>WLAN</td>
      <td>Connected</td>
      <td colspan="2">Infra-Direct</td>
      <td>AP-STA</td>
      <td>Group</td>
      <td colspan="2">WPS</td>
      <td>Scan</td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00507h</td>
      <td>1</td>
      <td>WLAN (Reserved)</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>*1</td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00508h</td>
      <td>32</td>
      <td>SSID</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00528h</td>
      <td>1</td>
      <td>Encryption Mode*2</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00529h</td>
      <td>1</td>
      <td>Signal Strength</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>0052Ah</td>
      <td>1</td>
      <td>Channel</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>0052Bh</td>
      <td>5</td>
      <td>Reserved</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>00530h</td>
      <td>6</td>
      <td>MAC Address</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00536h</td>
      <td>10</td>
      <td>Reserved</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>00540h</td>
      <td>16</td>
      <td>ID</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00550h</td>
      <td>4</td>
      <td>IP Address</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00554h</td>
      <td>4</td>
      <td>Subnet Mask</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00558h</td>
      <td>4</td>
      <td>Default Gateway</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>0055Ch</td>
      <td>4</td>
      <td>Preferred DNS Server</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00560h</td>
      <td>4</td>
      <td>Alternate DNS Server</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00564h</td>
      <td>1</td>
      <td>Proxy Server</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>PSE</td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00565h</td>
      <td>11</td>
      <td>Proxy Server</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>00570h</td>
      <td>2</td>
      <td>Date</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00572h</td>
      <td>2</td>
      <td>Time</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00574h</td>
      <td>1</td>
      <td>HTTP Status</td>
      <td>HPC</td>
      <td colspan="7">HTTP Progress</td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00575h</td>
      <td>1</td>
      <td>Power Save Management</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>PSM</td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>00576h</td>
      <td>1</td>
      <td>File System Management</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
      <td>FIM</td>
      <td>読み込み／<br>書き込み</td>
    </tr>
    <tr>
      <td>00577h</td>
      <td>73</td>
      <td>Reserved</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>005C0h</td>
      <td>8</td>
      <td>Reserved for Vendor</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>005C8h</td>
      <td>4</td>
      <td><a href="#005C8h">HTTP転送ステータス・レジスタ</a></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>005CCh</td>
      <td>4</td>
      <td><a href="#005CCh">HTTP転送サイズ・レジスタ</a></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>005D0h</td>
      <td>6</td>
      <td>Reserved for vendor</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>005D6h</td>
      <td>1</td>
      <td><a href="#005D6h">ファイルダウンロードステータス・レジスタ</a></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
    <tr>
      <td>005D7h</td>
      <td>9</td>
      <td>Reserved for vendor</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>005F0h</td>
      <td>16</td>
      <td><a href="#005F0h">FWバージョンレジスタ</a></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>読み込み専用</td>
    </tr>
  </tbody>
</table>                  

<h3 id="005C8h">HTTP転送ステータス・レジスタ</h3>

HTTPClientの転送済みデータサイズを取得します。転送中のデータサイズが取得できるために、データ転送の経過状況を取得することが可能です。

<h3 id="005CCh"> HTTP転送サイズ・レジスタ</h3>

HTTPレスポンスヘッダーのContent-lengthの値を取得します。Content-lengthがレスポンスに含まれていない場合には設定されません。

<h3 id="005D6h">ファイルダウンロードステータス・レジスタ</h3>

ファイルダウンロード中かどうかを判定します。

<h3 id="005F0h">FWバージョンレジスタ</h3>

FWバージョン情報を示すレジスタです。 （例：F24A6W3AW1.00.02）
