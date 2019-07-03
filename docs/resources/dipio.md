---
layout: default
title: FlashAir DIP IOボード
parent: 関連商品・開発リソース
nav_order: 5
---

# FlashAir DIP IOボード

FlashAir DIP IOは、FlashAirにGPIO と I<sup>2</sup>C インターフェースを拡張することができるボードです。

![DIP IOボード]({{ site.baseurl }}/assets/images/dipio1.jpg)

---
## 概要
* FlashAir に GPIO と I<sup>2</sup>C インターフェースを拡張することができます。
* ブレッドボードで使用する際、穴を無駄にしない形状です。
* レギュレータを実装してあるので外付けする必要がありません。（電源電圧範囲外の場合を除きます。）
* リセットスイッチ（SW1）を押すことで FlashAir と SC18IS600IBS をリセットすることができます。
* 裏面に I<sup>2</sup>C のプルアップ設定用ジャンパーがあります
* 開発は Lua スクリプトで行います。FlashAir に Lua スクリプト（*.lua）を書き込むだけなのでノートPCのSDメモリカードスロット等、書き込む事の出来る環境があれば簡単に開発することができます。専用のライターなどは必要ありません。
* FlashAir は別売です。別途ご用意ください。W-03（第三世代）が使用できます。  

---
## 特徴
* GPIO+I<sup>2</sup>C インターフェースブリッジに SC18IS600IBS を使用
* GPIO4 チャネル+I<sup>2</sup>C インタフェースの変換
* 3.3V 出力 LDO レギュレータを内蔵

---
## 仕様
* 電源電圧 2.8V～6V（GPIO 出力電流 10mA 以下の条件で 9V まで入力可）
* 消費電流 140mA～260mA
* GPIO 出力電流 4 チャネル合計 120mA

サンプル回路例

![DIP IOボード]({{ site.baseurl }}/assets/images/dipio.png){: .w-75 }

---
## 購入

FlashAir DIP IOボードは、以下よりご購入いただけます。
<dl class="mb-0">
  <dt>秋月電子通商</dt>
  <dd><a href="http://akizukidenshi.com/catalog/g/gK-10007/" target="_blank">http://akizukidenshi.com/catalog/g/gK-10007/</a></dd>
</dl>

同店にて、FlashAir DIP IOボードと組み合わせ可能なFlashAirも販売しています。
* W-03 8GB: 取り扱いありません（動作確認済み）
* W-03 16GB: M-09651
* W-03 32GB: M-09865

---
## 部品表

部品番号  | 値     | 型式             
-------- | ----- | ---------------
C1～C5   | 0.1uF | GRM155F11E104Z 
R1～R5   | 10kΩ  | RK73B1ETTP103J 
Q1       |       | IRLML6402      
Q2       |       | 2SC4081        
U1       |       | NJM2845DL1-33  
U2       |       | SN74LVC1G17DRLR
U3       |       | SC18IS600IBS   
CN1      |       | 1010070864     

---
## ダウンロード

### サンプルスクリプト（GPIO）

ブリッジICを使いGPIOを動作させます。下記の部品表を参考に部品を接続して下さい。接続はサンプル回路例を参考にしてください。FlashAirの`/SD_WLAN/CONFIG` に`IFMODE=1` を追記してください。

[サンプルスクリプトをダウンロード (0.4KB)](/files/documents/bootscript_SPI_GPIO_dipio.lua){: .btn .btn-primary }

### 部品表

名称  | 型番              | 個数 | 参考URL                                                                                                              
----- | ---------------- | ---- | -------------------------------------------------------------------------------------------------------------------
電源  | 単三アルカリ乾電池 | 4    | [http://akizukidenshi.com/catalog/g/gB-03256/](http://akizukidenshi.com/catalog/g/gB-03256/){: target="_blank" }
LED   | OSDR5113A        | 4    | [http://akizukidenshi.com/catalog/g/gI-00624/](http://akizukidenshi.com/catalog/g/gI-00624/){: target="_blank" }
抵抗  | 約1kΩ             | 4    | [http://akizukidenshi.com/catalog/g/gR-16102/](http://akizukidenshi.com/catalog/g/gR-16102/){: target="_blank" }