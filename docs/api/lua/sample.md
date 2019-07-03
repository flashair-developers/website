---
layout: tutorials-api
title: Luaサンプルプログラム
parent: Lua機能
grand_parent: APIガイド
nav_exclude: true
---

# Luaサンプルプログラム

FlashAirの /DCIM 以下の最新フォルダーから、Facebookへアップロードするサンプルプログラムです。

[リポジトリを見る（GitHub）](https://github.com/FlashAirDevelopers/LuaTutorial/tree/master/lua_tutorial_5){: target="_blank" }{: .btn .btn-primary } 

このサイトのサンプルコードは
[二条項BSDライセンス]({{ site.baseurl }}/docs/license)で提供されています。

1. [開発者登録](#1-開発者登録)
2. [アプリ登録](#2-アプリの登録)
3. [アクセストークンの取得](#3-アクセストークンの取得)
4. [アップロードの準備](#4-アップロードの準備)
5. [写真のアップロード](#5-写真のアップロード)

サンプルプログラムをFlashAirの /lua フォルダに保存しておきましょう。 FlashAirのフォルダ・ファイル構成は次のようになります。

<pre>
/
+-- DCIM/
|   +-- 100__TSB/
|   +-- 101_FILE/
|       +-- JPEGファイル
+-- lua/
|   +-- facebook.html
|   +-- facebook.cfg
|   +-- fb_auto_up.lua
|   +-- fb_get_token.lua
|   +-- fb_token_handler.lua
|   +-- lastupload.cfg
+-- SD_WLAN/
    +-- CONFIG
</pre>

* DCIM/101_FILEフォルダーは例です。お使いのカメラによってフォルダー名は異なります。
* Luaスクリプトは lua フォルダーに保存します。別のフォルダーに保存する場合は、fb_auto_up.lua, SD_WLAN/CONFIGの設定を実際の構成に合わせてください。

### 注意事項

* 本プログラムは、実用を想定したものではありません。
* カメラに挿入したカードでの実行、カードのデータの削除、カードの空き容量不足、 などの場合に正しく動かない可能性があります。
* Facebookの仕様変更があった場合、動作しない可能性があります。

---
## 1. 開発者登録

Facebookにアクセスするアプリを作成するには、開発者登録が必要です。 開発者登録済の場合は、次のステップに進んでください。

この作業は、インターネットに接続されたPC上で行います。

1.  [Facebook Developers](https://developers.facebook.com/){: target="_blank" }を開きます。
2. 画面右上の"ログイン"をクリックし、Facebookアカウントにログインします。
3. ログイン後、画面右上の"登録"をクリックし、開発者登録します。
  * [アプリ開発](https://developers.facebook.com/docs/apps){: target="_blank" }

---
## 2. アプリの登録

Facebookにアクセスするアプリの登録とアプリ情報の取得を行います。

この作業は、インターネットに接続されたPC上で行います。

1. Facebook Developersの[アプリ管理ページ](https://developers.facebook.com/apps){: target="_blank" }を開きます。
2. 画面上の "新しいアプリを作成"をクリックします。
  ![lua_sample_02_03]({{ site.baseurl }}/assets/images/lua_sample_02_03.png){: .d-block .img-thumbnail }

3.  "表示名"を入力し、"アプリIDを作成してください"をクリックします。
  ![lua_sample_02_04]({{ site.baseurl }}/assets/images/lua_sample_02_04.png){: .d-block .img-thumbnail }
  * 例: "Lua Upload"

4. 登録が完了すると、下記のような画面が表示されます。左ナビゲーションの"ダッシュボード"をクリックします。
  ![lua_sample_02_05]({{ site.baseurl }}/assets/images/lua_sample_02_05.png){: .d-block .img-thumbnail }

5. 左ナビゲーションの"設定"をクリックします。
  ![lua_sample_02_06]({{ site.baseurl }}/assets/images/lua_sample_02_06.png){: .d-block .img-thumbnail }

6. "カテゴリ"を入力し、"＋プラットフォームを追加"をクリックします。
  ![lua_sample_02_07]({{ site.baseurl }}/assets/images/lua_sample_02_07.png){: .d-block .img-thumbnail }
  * 例: "写真"
  
7. "ウェブサイト"をクリックします。
  ![lua_sample_02_08]({{ site.baseurl }}/assets/images/lua_sample_02_08.png){: .d-block .img-thumbnail }

8. ウェブサイトに関する入力欄が追加されます。 サイトURLに http://flashair.local/lua/facebook.html と入力し、"変更を保存"をクリックします。
  ![lua_sample_02_09]({{ site.baseurl }}/assets/images/lua_sample_02_09.png){: .d-block }

9. アプリの情報を控えます。これらの情報は取扱に注意し、他人と共有しないようにしてください。
  ![lua_sample_02_10]({{ site.baseurl }}/assets/images/lua_sample_02_10.png){: .d-block .img-thumbnail }
  - アプリID
  - app secret
    - "表示"をクリックすると、アプリのシークレットキーが表示されます。

10. メニューの"ツール＆サポート"をクリックします。
  ![lua_sample_02_11]({{ site.baseurl }}/assets/images/lua_sample_02_11.png){: .d-block .img-thumbnail }

11. ツールの"アクセストークンツール"をクリックします。
  ![lua_sample_02_12]({{ site.baseurl }}/assets/images/lua_sample_02_12.png){: .d-block .img-thumbnail }

12. "App Token"を控えます。
  ![lua_sample_02_13]({{ site.baseurl }}/assets/images/lua_sample_02_13.png){: .d-block .img-thumbnail }

---
## 3. アクセストークンの取得

1. FlashAirをカードリーダーに挿入します。
2. FlashAirのSD_WLANフォルダに保存されている、CONFIGファイルを編集します。

    キー          | 値                      | 意味                                                                   
    ------------- | ---------------------- | ---------------------------------------------------------------------
    APPMODE       | `6`                    | インターネット同時接続モードで起動
    APPSSID       | `例) lua_test`         | FlashAirのSSID
    APPNETWORKKEY | `例) 12345678`         | FlashAirのパスワード
    BRGSSID       | `例) my_home_wlan`     | 家庭の無線LAN APのSSID
    BRGNETWORKKEY | `例) password12345678` | 家庭の無線LAN APのパスワード
    APPAUTOTIME   | `0`                    | FlashAirの無線LAN機能自動停止無効
    WEBDAV        | `2`                    | WebDAV機能有効

3. facebook.htmlを編集し、変数 appID をApp IDの値にします。

        var appId = "1369419999999999";

4. FlashAirをカードリーダーから一旦取り出し、再び挿入します。
5. PCの無線LANを、FlashAirに接続します。 SSIDとパスワードはCONFIGファイルに設定した値です。
6. ウェブブラウザから、http://flashair.local/lua/facebook.html にアクセスします。
7. OAuthの認証画面が出るので、"（名前）としてログイン"をクリックします。
  ![lua_sample_02_14]({{ site.baseurl }}/assets/images/lua_sample_02_14.png){: .d-block .img-thumbnail }

8. "投稿をシェアしたい相手は？"の選択肢を"自分のみ"に変更し、"OK"をクリックします。
  ![lua_sample_02_15]({{ site.baseurl }}/assets/images/lua_sample_02_15.png){: .d-block .img-thumbnail }

9. PUT Success: OK と表示されれば成功です。
  ![lua_sample_02_16]({{ site.baseurl }}/assets/images/lua_sample_02_16.png){: .d-block .img-thumbnail }
  * FlashAirのluaフォルダに"fb_access_token"というファイルが作成されます。
  * このファイルは、FlashAirをカードリーダーから抜き差ししてから確認して下さい。

---
## 4. アップロードの準備

1. FlashAirをカードリーダーに挿入します。
2. facebook.cfg ファイルを編集し、控えた、App Token, App Secret, App IDを設定します。

        app_access_token=1369419999999999|x2bu1ED9XxXxXxXxXxXxXxXxXxX
        app_secret=e820256be7XxXxXxXxXxXxXxXxXxXxXx
        app_id=1369419999999999
        token_fullpath=/lua/fb_access_token

3. アクセストークンを、約60日間有効なアクセストークンに更新します。 現在のトークンは約1時間で無効になります。http://flashair.local/lua/fb_get_token.luaにアクセスします。 user access token:に続けて以下の様な文字列が表示されれば成功です。
  ![lua_sample_02_17]({{ site.baseurl }}/assets/images/lua_sample_02_17.png){: .d-block .img-thumbnail }

4. lastupload.cfg ファイルを編集し、下記のような内容に変更してください。無ければ新規に作成してください。

        lastupload=1000001

    * 100__TSBフォルダーのFA000001.JPGファイルはアップロード済みという意味になります。

5. FlashAirのSD_WLANフォルダに保存されている、CONFIGファイルを編集します。

    キー           | 値                        | 意味                                                                 
    -------------- | ------------------------- | --------------------------------------------------------------------
    APPMODE        | `5`                       | ステーションモードで起動
    APPSSID        | `例) my_home_wlan`        | 家庭の無線LAN APのSSID
    APPNETWORKKEY  | `例) password12345678`    | 家庭の無線LAN APのパスワード
    LUA_RUN_SCRIPT | `例) /lua/fb_auto_up.lua` | 電源投入後に実行したいスクリプトのフルパス

6. FlashAirをカードリーダーから抜きます。

---
## 5. 写真のアップロード

1. FlashAirをカードリーダーに挿入します。
2. 自動的に、アクセスポイントへの接続と、Facebookへのアップロードが開始されます。
  * 画像ファイルの更新日を元にアルバムを作成してアップロードします。
  * アルバム名の書式は“YYYY-M-D”です。
  * DCIM以下の古いフォルダーから順にアップロードします。
  * フォルダーの削除並びに、名前の変更をした場合、正しく動作しません。
  * フォルダー内の古い画像ファイルから順にアップロードします。
  * サイズにもよりますが、１枚の写真のアップロードに数分かかることもあります。
3. Facebookのページにアクセスすると、写真がアップロードされていることが確認できます。
  ![lua_sample_02_18]({{ site.baseurl }}/assets/images/lua_sample_02_18.png){: .d-block .img-thumbnail }
