---
layout: api-isdio
title: サーバーアップロードコマンド
parent: コマンドリファレンス
grand_parent: iSDIO
nav_order: 3
---

# サーバーアップロードコマンド

<table>
<thead>
	<tr>
		<th>コマンドID</th>
		<th>コマンド名</th>
		<th>機能</th>
	</tr>
</thead>
	<tbody>
		<tr>
			<td>0021h</td>
			<td><a href="#SendHTTPMessageByRegister">SendHTTPMessageByRegister(hostName, message)</a></td>
			<td rowspan="8">指定したサーバーにHTTPリクエストを送信<br>
				<h5><strong>SendHTTPMessage～：</strong></h5>
				文字データのみのリクエストを発行
				<h5><strong>SendHTTPFile～：</strong></h5>
				ファイルを添付してリクエストを発行
				<h5><strong>SendHTTPSSL～：</strong></h5>
				SSLによる暗号化通信を使用
				<h5><strong>～ByRegister: </strong></h5>
				リクエストデータをメモリから読み込み
				<h5><strong>～ByFile: </strong></h5>
				リクエストデータをファイルから読み込み
			</td>
		</tr>
		<tr>
			<td>0022h</td>
			<td><a href="#SendHTTPFileByRegister">SendHTTPFileByRegister(hostName, appendFileName, message)</a></td>
		</tr>
		<tr>
			<td>0023h</td>
			<td><a href="#SendHTTPSSLMessageByRegister">SendHTTPSSLMessageByRegister(hostName, message)</a></td>
		</tr>
		<tr>
			<td>0024h</td>
			<td><a href="#SendHTTPSSLFileByRegister">SendHTTPSSLFileByRegister(hostName, appendFileName, message)</a></td>
		</tr>
		<tr>
			<td>0025h</td>
			<td><a href="#SendHTTPMessageByFile">SendHTTPMessageByFile(hostName, messageFileName, headerRemoval)</a></td>
		</tr>
		<tr>
			<td>0026h</td>
			<td><a href="#SendHTTPFileByFile">SendHTTPFileByFile(hostName, messageFileName, appendFileName, headerRemoval)</a></td>
		</tr>
		<tr>
			<td>0027h</td>
			<td><a href="#SendHTTPSSLMessageByFile">SendHTTPSSLMessageByFile(hostName, messageFileName, headerRemoval)</a></td>
		</tr>
		<tr>
			<td>0028h</td>
			<td><a href="#SendHTTPSSLFileByFile">SendHTTPSSLFileByFile(hostName, messageFileName, appendFileName, headerRemoval)</a></td>
		</tr>
		<tr>
			<td>0029h</td>
			<td><a href="#SetCertificate">SetCertificate(certificate)</a></td>
			<td></td>
		</tr>
		<tr>
			<td>002Ah</td>
			<td><a href="#SetCertificateByFile">SetCertificateByFile(certificateFileName)</a></td>
			<td></td>
		</tr>
	</tbody>
</table>                                                  

---
<h2 id="SendHTTPMessageByRegister">SendHTTPMessageByRegister(hostName, message)</h2>

特定のサーバにHTTPリクエストメッセージを送るためのホストリクエストです。

HTTPリクエストラインとHTTPメッセージヘッダー、HTTPメッセージボディで構成されるHTTPリクエストメッセージを、ホストは準備します。(optional in \[HTTP\]).（★1）　

すると、HTTPレスポンスラインとHTTPメッセージヘッダー、HTTPメッセージボディ(optional in \[HTTP\]) で構成されるHTTPレスポンスメッセージをFlashAirはサーバより受信します。2.3 Server Uploadを参照してください。（★2）

### コマンドID

0021h

### 引数

Name                      | Type                         | Size                             | 説明
------------------------- | ------------------------- | -------------------------------- | ---------------------
ホスト名 | ASCII       | 変数     | `hostName`はHTTPリクエストメッセージが送信されHTTPレスポンスメッセージを受信するホスト名を意味します。プロキシサーバが使用される場合を除いて、ポート番号は"80"が使われます。値はNull値で終了しません。（★3）
message | Binary data | Variable | `message`はHTTPリクエストラインとHTTPメッセージヘッダー、HTTPメッセージボディで構成されるHTTPリクエストメッセージを意味します。（★4）

### レスポンス

受信したHTTPレスポンスメッセージは、コマンドレスポンスデータのレスポンスデータから取得可能です。2.2.2.3 iSDIO Command Response Data in \[iSDIO\]を参照してください。（★5）

---
<h2 id="SendHTTPFileByRegister">SendHTTPFileByRegister(hostName, appendFileName, message)</h2>

HTTPリクエストメッセージをファイルを添付して特定のサーバに送るためのホストリクエストです。

（★1と同じ） さらにサーバへメッセージが送信される際、FlashAirはメッセージ内の事前に定義された文字を特定のファイルに置き換えます。

（★2と同じ）

### コマンドID

0022h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                         | （★3と同じ）
appendFileName    				| ASCII character   					 | Variable  											 | `appendFileName`は、NANDメモリモジュール内のアペンドファイルのルートディレクトリからサーバに送信されるファイル名とファイルパッチを意味します。例"/DCIM/100XXXXX/YYYY1234.JPG"値はNull値で終了しません。（★8）
message                   | Binary data                  | Variable                         | （★4と同じ）

### レスポンス

（★5と同じ）

---
<h2 id="SendHTTPSSLMessageByRegister">SendHTTPSSLMessageByRegister(hostName, message)</h2>

このコマンドの定義は、 FlashAirにSSL経由でHTTPメッセージをリクエストする以外は、"SendHTTPMessageByRegister(hostName, message)"と同じです。プロキシサーバが使用される場合を除いて、ポート番号443が使われます。

このコマンドを実行する前に、"SetCertificate"または"SetCertificateByFile"コマンドでルート認証を設定することが推奨されています。ルート認証を設定せずにコマンドを実行した場合、ルート認証によるサーバ証明書を認証しないまま、FlashAirはこのコマンドを実行します。（★6）

サーバ証明書がルート認証によって認証されない場合、レスポンスステータスが"85h: SSL certification error"となり、このコマンドの実行は失敗となります。（★7）

### コマンドID

0023h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                         | （★3と同じ）
message                   | Binary data                  | Variable                         | （★4と同じ）

### レスポンス

無し

---
<h2 id="SendHTTPSSLFileByRegister">SendHTTPSSLFileByRegister(hostName, appendFileName, message)</h2>

このコマンドの定義は、 FlashAirにSSL経由でHTTPメッセージをリクエストする以外は、"SendHTTPMessageByRegister(hostName, message)"と同じです。プロキシサーバが使用される場合を除いて、ポート番号443が使われます。（★13）

（★6と同じ）

（★7と同じ）

### コマンドID

0024h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                         | （★3と同じ）
appendFileName            | ASCII character              | Variable                         | （★8と同じ）
message                   | Binary data                  | Variable                         | （★4と同じ）

### レスポンス

無し

---
<h2 id="SendHTTPMessageByFile">SendHTTPMessageByFile(hostName, messageFileName, headerRemoval)</h2>

特定のサーバにHTTPリクエストメッセージを送るためのホストリクエストです。

コマンドが実行される前に、HTTPリクエストラインとHTTPメッセージヘッダー、HTTPメッセージボディで構成されるHTTPリクエストメッセージを、ホストはメッセージファイルとしてNANDメモリモジュールに保存します。（★9）

すると、HTTPレスポンスラインとHTTPメッセージヘッダー、HTTPメッセージボディ(optional in \[HTTP\])から構成されるHTTPレスポンスメッセージをFlashAirがサーバから受信し、"RESPONSE" ディレクトリの下に"iSDIO command sequence id"のファイル名で保存します。もしこのファイルが存在した場合、上書きして保存されます。HTTPリクエストラインとHTTPメッセージヘッダーを除くよう、ホストがリクエストした場合、HTTPメッセージボディのみがレスポンスファイルとして保存されます。2.3 Server Uploadを参照してください。 Capability Register内の"Max Size of Command Response Data"による制限は、このコマンドによって作られるレスポンスファイルのサイズに適用されません。（★10）

### コマンドID

0025h

### 引数

<table>
	<thead>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Size</th>
			<th>説明</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>hostName</td>
			<td>ASCII character</td>
			<td>Variable</td>
			<td>（★3と同じ）</td>
		</tr>
		<tr>
			<td>messageFileName</td>
			<td>ASCII character</td>
			<td>Variable</td>
			<td><code>messageFileName</code>は、NANDメモリモジュール内のメッセージファイルのルートディレクトリから送られ？、HTTPリクエストラインとHTTPメッセージヘッダー、HTTPメッセージボディで構成されるファイル名とファイルパッチを意味します。例 "/REQUEST/MESSAGE1.TXT"。 値はNull値で終了しません。（★11）</td>
		</tr>
		<tr>
			<td>headerRemoval</td>
			<td>integer</td>
			<td>1-byte</td>
			<td><code>headerRemoval</code>はHTTPヘッダーを除くことに関して意味します。
				<dl>
					<dt>00h</dt>
					<dd>
						HTTPレスポンスメッセージはそのまま保存されます。
					</dd>
					<dt>01h</dt>
					<dd>
						HTTPヘッダーを除くことにより、HTTPメッセージボディのみ保存されます。（★12）
					</dd>
				</dl>
			</td>
		</tr>
	</tbody>
</table>

### レスポンス

無し

---
<h2 id="SendHTTPFileByFile">SendHTTPFileByFile(hostName, messageFileName, appendFileName, headerRemoval)</h2>

ファイルを添付して、HTTPリクエストメッセージを特定のサーバに送るためのホストリクエストです。（★9と同じ） メッセージがサーバへ送信されると、FlashAirはメッセージ内の事前に定義した文字 (例: "<!--WLANSDFILE-->" in \[ISO 8859-1\]) を特定のファイルに変換します。

（★10と同じ）

### コマンドID

0026h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                         | （★3と同じ）
messageFileName           | ASCII character              | Variable                         | （★11と同じ）
appendFileName            | ASCII character              | Variable                         | （★8と同じ）
headerRemoval             | integer                      | 1-byte                           | （★12と同じ）

### レスポンス

無し

---
<h2 id="SendHTTPSSLMessageByFile">SendHTTPSSLMessageByFile(hostName, messageFileName, headerRemoval)</h2>

（★13とほぼ同じ　"SendHTTPMessageByFile (hostName, messageFileName, headerRemoval)） （★6と同じ）（★7と同じ） (i.e. Response Status becomes "85h: SSL certification error").

### コマンドID

0027h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                      	  | （★3と同じ）
messageFileName           | ASCII character              | Variable                         | （★11と同じ）
headerRemoval             | integer                      | 1-byte                           | （★12と同じ）

### レスポンス

無し

---
<h2 id="SendHTTPSSLFileByFile">SendHTTPSSLFileByFile(hostName, messageFileName, appendFileName, headerRemoval)</h2>

（★13とほぼ同じ　"SendHTTPFileByFile (hostName, messageFileName, appendFileName, headerRemoval)"） 

（★6と同じ）

（★7と同じ） (i.e. Response Status becomes "85h: SSL certification error").

### コマンドID

0028h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
hostName                  | ASCII character              | Variable                         | （★3と同じ）
messageFileName           | ASCII character         		 | Variable                         | （★11と同じ）
appendFileName            | ASCII character              | Variable                         | （★8と同じ）
headerRemoval             | integer                      | 1-byte                           | （★12と同じ）

### レスポンス

無し

---
<h2 id="SetCertificate">SetCertificate(certificate)</h2>

HTTPS接続のためルート認証を行います。このコマンド実行後、FlashAirは付与されたHTTPS接続の証明書を使用します。ルート認証がすでに行われている場合は、現在の証明書は無効となり、FlashAirは新しく設定されたものを使用します。

### コマンドID

0029h

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
certificate             	| Binary data									 | Variable                       	| `certificate`はDER (Distinguished Encoding Rules)によるX.509バイナリです。<br>"Length of Argument"を"00 00 00 00h"に設定した場合、この値は無視できます。無視した場合は、FlashAirは現在の証明書を無効にし、デフォルトの設定に戻ります。（★14）

### レスポンス

無し

---
<h2 id="SetCertificateByFile">SetCertificateByFile(certificateFileName)</h2>

HTTPS接続のためNANDメモリモジュール内に保存されたファイルをルート認証に設定します。このコマンド実行後、このコマンド実行後、FlashAirは付与されたHTTPS接続の証明書を使用します。ルート認証がすでに行われている場合は、現在の証明書は無効となり、FlashAirは新しく設定されたものを使用します。

### コマンドID

002Ah

### 引数

Name                      | Type                         | Size                             | 説明                                 
------------------------- | ---------------------------- | -------------------------------- | ---------------------
certificateFileName       | ASCII character              | Variable                         | 接続するためのAPのSSIDです。値はNull値で終了しません。
networkKey                | ASCII character							 | Variable                         | `certificateFileName`は、NANDメモリモジュール内の認証ファイルのルートディレクトリからサーバに送信されるファイル名とファイルパッチを意味します。例 "/ABCDEF.CRT" 値はNull値で終了しません。（★8と似ている）<br> 証明ファイルはDER (Distinguished Encoding Rules)によるX.509バイナリです。(Distinguished Encoding Rules).<br>（★14と同じ）

### レスポンス

無し
