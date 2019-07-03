---
layout: default
title: FlashAirでできること
parent: 開発を始めよう
nav_order: 4
---

# FlashAirでできること
## FlashAirでできること

FlashAirは、SDメモリカードの中に、無線LAN機能とマイコンを内蔵した、iSDIO規格に準拠した機器です。

カメラやPCなど、SDメモリカードスロットを持つ機器（SDメモリカードホスト機器）は、FlashAirをSDHC/SDXCメモリカードとして認識し、データの読み書きを行うことができます。また、iSDIOコマンドをサポートしているSDメモリカードホスト機器ならば、無線LAN機能のコントロールを行うこともできます。

FlashAirはWebサーバーを内蔵しています。無線LAN親機（アクセスポイント, AP）として動作しているFlashAirに、無線LAN子機（ステーション, STA）として動作しているPCやスマートフォンといった無線LAN機器から接続し、HTTP (HyperText Transfer Protocol) 経由で通信することができます。

![FlashAirでできること]({{ site.baseurl }}/assets/images/flashair-overview.png){: .d-block }

<dl>
	<dt>無線</dt>
	<dd>APモードで起動、STAモードで起動、AP+STA同時起動、無線切断、SSIDのスキャンといった無線LANの制御ができます。</dd>
	<dt>HTTP</dt>
	<dd>無線LAN上で、HTTP通信ができます。</dd>
	<dt>Webサーバー</dt>
	<dd>FlashAir内のファイルにHTTP
		GETリクエストを発行することで、ファイルをダウンロードすることができます。また、FlashAirの情報を読み取る、設定を変更するなどの操作が行えるCGI (Common Gateway
		Interface) が用意されています。
	</dd>
	<dt>スクリプト</dt>
	<dd>Luaスクリプトの実行ができます。</dd>
	<dt>GPIO</dt>
	<dd>SD端子のGPIO制御ができます。</dd>
	<dt>SD</dt>
	<dd>内蔵フラッシュメモリのファイル読み書きができます。</dd>
	<dt>その他</dt>
	<dd>SRAMの読み書きができます。</dd>
</dl>

---
## アプリ作成

FlashAirアプリ作成方法は、制御する機器によって異なります。

![アプリ作成]({{ site.baseurl }}/assets/images/flashair-development-overview.png){: .d-block }

### FlashAir連携アプリの開発
HTTP制御でスマートフォンアプリやウェブブラウザを使ったインターフェースを作成したい方は、 アプリ開発の概要をご覧ください。
- iOSやAndroidのスマートフォンアプリ
- ウェブブラウザ

### 組み込み機器を開発
iSDIOやLuaスクリプトを利用してデバイスを開発したい方は、[組み込み機器開発の概要](./device)をご覧ください。
- Arduinoでデバイス作成

---
## FlashAir世代ごとの違い

FlashAirカードには、 **第1世代（W-01）**、 **第2世代（W-02）**、 **第3世代（W-03）**、 **第4世代（W-04）**の4種類のバージョンがあり、第2世代でSDメモリーカードがClass10に、第4世代でUHSスピードクラス3に対応し高速化されている、第4世代の無線による転送速度は第3世代の約2.9倍となっている、といった違いがあります。

また、第1世代はファームウェアバージョン1.00系列、第2世代は同2.00系列、第3世代は同3.00系列、第4世代は同4.00系列の対応となっており、2.00系列ではAPI仕様が大幅に拡張されています。アプリ開発者は、ファームウェアによる挙動の違いに注意しましょう。

|  | FlashAir W-04<br>第4世代<br>SD-UWA | FlashAir W-03<br>第3世代<br>SD-WE | FlashAir W-02<br>第2世代<br>SD-WD/WC | FlashAir W-01<br>第1世代<br>SD-WB/WL |
| - | ---------------------------------- | -------------------------------- | ------------------------------------ | ----------------------------------- | 
| 読み書き最大速度 | 読み出し: 90MB/s<br>書き出し: 70MB/s | - | - | - | 

∗1MB/秒を1,000,000バイト/秒として計算しています。最大転送速度は、東芝メモリの試験環境で特定の条件により得られた最良の値であり、ご使用機器での速度を保証するものではありません。読み出し/書き込み速度は使用する機器等の条件により異なります。従来SDインターフェースでの転送速度は、UHS-Iインターフェースに比べ低下します。
{: .fs-1 }

| 無線転送速度 | 約31.4Mbps | 約10.8Mbps | - | - |

∗測定値はメーカー独自で計測したものであり、実際の送信速度を保証するものではありません。使用される機材や環境によって実際の無線送信速度は異なります。
{: .fs-1 }

| UHS | UHS-I<br>UHS Speed Class3 | - | - | - |

SDHC/SDXCメモリカードで利用できるインターフェースで、対応機器と使用することで高速のパフォーマンスが得られます
{: .fs-1 }

| SDスピードクラス | Class 10 | Class 10 | Class 10 | Class 6 |

SDホスト機器とのデータ転送速度を定めた規格で、Class 10では、読み書き時のデータ転送速度が最低10MB/秒となっています。
{: .fs-1 }

| 対応ファームウェア | 4.00系列<br>例: F15DBW3BW4.00.00 | 3.00系列<br>例: FA9CAW3AW3.00.02 | 2.00系列<br>例: F19BAW3AW2.00.04 | 1.00系列<br>例: F24A6W3AW1.00.04 |

| List.htmへのファイル一覧埋め込み方法 | JavaScriptプログラムとして | JavaScriptプログラムとして | JavaScriptプログラムとして | カンマ区切りリストとして |
List.htmについては[こちら](doc/api/utility/)をご覧ください
{: .fs-1 }

| Eyefi Connected | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-close text-red-300"></i> | <i class="fa fa-close text-red-300"></i> | <i class="fa fa-close text-red-300"></i> |

SDメモリカードの無線のオン・オフをカメラ側で設定したり、データ転送中の電源停止を防ぐことができる機能です
{: .fs-1 }

| FlashAirドライブ(WebDAV) | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-close text-red-300"></i> | <i class="fa fa-close text-red-300"></i> | 

FlashAirに無線LANで接続したパソコンから、FlashAir内の写真やファイルを閲覧、コピーすることができる機能です
{: .fs-1 }

| インターネット同時接続モード | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-close text-red-300"></i> | 

FlashAirを介して、他のアクセスポイントに接続することができる機能です
{: .fs-1 }

| Luaスクリプトサポート | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-check text-green-300"></i> | <i class="fa fa-close text-red-300"></i> | <i class="fa fa-close text-red-300"></i> | 

Lua言語で書かれたスクリプトファイルをFlashAirに保存することでさまざまな処理を行うことができます
{: .fs-1 }

| その他 | ブラウザユーティリティのカスタマイズ<br>iSDIOサポート<br>GPIOサポート<br>ロングファイルネーム<br>日本語ファイル名 | ブラウザユーティリティのカスタマイズ<br>iSDIOサポート<br>GPIOサポート<br>ロングファイルネーム<br>日本語ファイル名 | ブラウザユーティリティのカスタマイズ<br>iSDIOサポート<br>GPIOサポート<br>ロングファイルネーム<br>日本語ファイル名 | ブラウザユーティリティのカスタマイズ<br>iSDIOサポート |

| CGIコマンド数 | command.cgi: 25<br>config.cgi: 12<br>thumbnail.cgi: 1<br>update.cgi: 5 | command.cgi: 25<br>config.cgi: 12<br>thumbnail.cgi: 1<br>update.cgi: 5 | command.cgi: 23<br>config.cgi: 9<br>thumbnail.cgi: 1<br>update.cgi: 5 | command.cgi: 10<br>config.cgi: 6<br>thumbnail.cgi: 1<br>update.cgi: 5 |

* 第4世代は、ファームウェアバージョン4.00.00の内容です。 
* 第3世代は、ファームウェアバージョン3.00.02の内容です。 
* 第2世代は、ファームウェアバージョン2.00.04の内容です。 
* 第1世代は、ファームウェアバージョン1.00.04の内容です。
{: .fs-1 }
