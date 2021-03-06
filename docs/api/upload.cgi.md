---
layout: tutorials-api
title: upload.cgi
parent: APIガイド
nav_order: 4
---

# upload.cgi

upload.cgiは、ネットワーク越しにSDメモリカードの中身を変更するためのAPIです。

{% include warning.html title="ご注意" content="本機能を誤って使用すると、FlashAirのファイルシステムを破壊してデータを失う恐れがあります。 PCなどのSDメモリカードホスト機器はSDメモリカードの内容(FAT)をキャッシュしている場合がありますが、本CGIで行った変更をSDメモリカードホスト機器が認識する方法がありません。そのため、本CGIとSDメモリカードホスト機器から同時に変更を行うとFAT不整合が起こる可能性があります。<br />書き込み後は必ずカードをいったん抜いて再挿入するなどしてSDメモリカードホスト機器に再認識させてください。" %}


### アップロード手順 #1 -Webブラウザから行う場合-

1.  [CONFIG ファイル]({{ site.baseurl }}/docs/api/config)に`UPLOAD=1` を書きこむ
2.  FlashAirを再起動する
3.  FlashAirに無線LANで接続する
4.  Webブラウザで`http://flashair/upload.cgi` を開く
5.  アップロードするファイルを選択し、Submitボタンを押す

### アップロード手順 #2 -CGIで行う場合-

1.  [CONFIG ファイル]({{ site.baseurl }}/docs/api/config)に`UPLOAD=1` を書きこむ
2.  FlashAirを再起動する
3.  FlashAirに無線LANで接続する
4.  `WRITEPROTECT` コマンドで、SDメモリカードホスト機器からの書き込みを禁止する
5.  `UPDIR` コマンドで、アップロード先ディレクトリを設定する
6.  `FTIME` コマンドで、ファイルの作成日時を設定する
7.  upload.cgiにファイルをPOSTし、ファイルをアップロードする  


機能                                                    | パラメータ例                                           | ファームウェアバージョン
------------------------------------------------------- | --------------------------------------------------------- | ------------
[ファイルのアップロード](#upload)                         | `http://flashair/upload.cgi`                                | 1.00.00+    
[ファイルの削除](#delete)                                | `http://flashair/upload.cgi?DEL=/DCIM/100__TSB/DSC_100.JPG` | 1.00.00+    
[アップロード先ディレクトリの設定](#updir)                 | `http://flashair/upload.cgi?UPDIR=/DCIM/101__TSB`           | 1.00.00+    
[システム時間の設定](#ftime)                              | `http://flashair/upload.cgi?FTIME=0x00210000`               | 1.00.00+    
[SDメモリカードホスト機器からの書き込み禁止](#writeprotect) | `http://flashair/upload.cgi?WRITEPROTECT=ON`                | 1.00.00+      

---
<h2 id="upload">ファイルのアップロード</h2>

multipart/form-data形式でデータをPOSTリクエストで送信すると、`UPDIR` で指定されたディレクトリにファイルをアップロードします。なお、本URLに対してWebブラウザからGETリクエストを使用すると、アップロードを行うための画面が表示されます。

設定に成功すると`SUCCESS`、失敗すると`ERROR` を返します。

#### リクエスト例:

`http://flashair/upload.cgi`

---
<h2 id="delete">ファイルの削除</h2>

指定したファイルをFlashAirから削除します。

<span class="badge label-red">重要</span>&nbsp; ディレクトリを指定した場合、ディレクトリ以下にファイルおよびディレクトリが存在してはいけません。存在している場合にディレクトリを削除すると、ディレクトリ以下のファイルおよびディレクトリはファイルシステムから認識できなくなることがあります。

設定に成功すると`SUCCESS`、失敗すると`ERROR` を返します。

#### リクエスト例:

`http://flashair/upload.cgi?DEL=/DCIM/100__TSB/DSC_100.JPG`

---
<h2 id="updir">アップロード先ディレクトリの設定</h2>

アップロードされたファイルを保存するディレクトリを指定します。 デフォルトではルートディレクトリ(/)に設定されています。

ディレクトリが存在しな場合は作成されますが、親ディレクトリが存在しない場合は作成されません。<br>存在しないディレクトリを指定した場合は、その後のアップロード動作は失敗となります。

常に`SUCCESS` を返します。<br>
アップロード操作が失敗してしまった場合でも`SUCCESS` が返されるため、このコマンドを使った後には、無事にファイルがアップロードされているかどうか確認することをお勧めします。 

#### リクエスト例:

`http://flashair/upload.cgi?UPDIR=/DCIM/101__TSB`

---
<h2 id="ftime">システム時間の設定</h2>

アップロードされたファイルの作成時間を指定します。元のファイルのファイル時間情報は失われます。

パラメータは32ビットの16進数で、上位16ビットが日付、下位16ビットが時刻を表します。 情報の詳細はFAT32の規格を参照ください。

設定に成功すると`SUCCESS`、失敗すると`ERROR` を返します。

#### リクエスト例:

`http://flashair/upload.cgi?FTIME=0x00210000`

---
<h2 id="writeprotect">SDメモリカードホスト機器からの書き込み禁止</h2>

SDメモリカードホスト機器からの書き込みを禁止します。<br>
書き込み禁止後は、SDメモリカードホスト機器からのライト動作にはエラーを返すため、SDメモリカードホスト機器はカードの異常として認識する場合があります。

書き込み禁止を解除するには、カードを再起動する必要があります。

設定に成功すると`SUCCESS`、失敗すると`ERROR` を返します。

#### リクエスト例:

`http://flashair/upload.cgi?WRITEPROTECT=ON`
