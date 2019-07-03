---
layout: tutorials-api
title: thumbnail.cgi
parent: APIガイド
nav_order: 3
---

# thumbnail.cgi

thumbnail.cgiは画像のサムネイルを取得するために使用します。


機能       | パラメータ例                       | ファームウェアバージョン
-------- | ---------------------------- | ------------
[サムネイルの取得](#getthumbnail) | `/DCIM/100__TSB/DSC_100.JPG` | 1.00.00+    

---
<h2 id="getthumbnail">サムネイルの取得</h2>

指定したファイルからEXIF規格で定められているサムネイル画像を取得して返します。JPEG(image/jpeg)形式です。

指定したファイルがJPEG形式でない場合、またはJPEG形式であってもEXIF規格で定められたサムネイル画像が格納されていない場合は、リクエストが`404 Not Found` となり失敗します。

### リクエスト例:

`http://flashair/thumbnail.cgi?/DCIM/100__TSB/DSC_100.JPG`  

### レスポンスヘッダー:

ファームウェアバージョン3.00.00以上の場合、HTTPレスポンスヘッダーに以下のフィールドが追加されます。

##### **X-exif-WIDTH**
JPEGのEXIF情報よりWIDTHを取得し、ヘッダーへ追加します。
##### **X-exif-HEIGHT**
JPEGのEXIF情報よりHEIGHTを取得し、ヘッダーへ追加します。
##### **X-exif-ORIENTATION**
JPEGのEXIF情報よりORIENTATIONを取得し、ヘッダーへ追加します。
