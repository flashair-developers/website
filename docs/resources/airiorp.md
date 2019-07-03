---
layout: default
title: Airio RP
parent: 関連商品・開発リソース
nav_order: 3
---

# FlashAirプロトタイピングボード「Airio RP」

Airio RP（えありおあーるぴー）はFlashAir でプロトタイピングを行うためのボードです。

![Airio RP]({{ site.baseurl }}/assets/images/airiorp.png){: .w-50 }

---
## 特徴
### DIP形状

900mil DIP形状でFlashAirの全端子が外ピンに出ており、ブレッドボードを用いて簡単に外部回路と接続することができます。


### SPI-I<sup>2</sup>Cブリッジ IC

CP2120 を搭載しており、I<sup>2</sup>C デバイスと接続することが可能です。スライドスイッチを使い、CP2120の有効/無効を切り替えることができます。

### リセットスイッチ・リセット端子

基板上にリセットスイッチがあり、外ピンにリセット端子が出ています。FlashAirを抜き差しせずにリセット可能です。

### LEDピン

外ピンの LEDピンをGNDに落とすことで電源を消灯させることが可能です。

### FlashAirのピンアサイン

![Airio RP]({{ site.baseurl }}/assets/images/airiorp-2.png)

ピン | SD I/F | SPI I/F | GPIO | Lua SPI
-- | ------ | ------- | ---- | -------
8  | DAT1   | -       | 0x04 | CS     
7  | DAT0   | DO      | 0x02 | CLK    
6  | Vss2  
5  | CLK    | SCLK    | -    | -      
4  | Vcc   
3  | Vss1  
2  | CMD    | DI      | 0x01 | DO     
1  | DAT3   | CS      | 0x10 | -      
9  | DAT2   | -       | 0x08 | DI       

---
## 購入

Airio RPは、以下よりご購入いただけます。

<dl>
  <dt>マルツエレック</dt>
  <dd><a href="http://www.marutsu.co.jp/pc/i/557784/" target="_blank">http://www.marutsu.co.jp/pc/i/557784/</a></dd>
  <dt>スイッチサイエンス</dt>
  <dd><a href="https://www.switch-science.com/catalog/2373/" target="_blank">https://www.switch-science.com/catalog/2373/</a></dd>
</dl>

[取り扱い説明書をダウンロード (452KB)](/files/documents/AirioRP-instruction-v1.pdf){: .btn .btn-primary }

---
## ダウンロード

### サンプルHTM

FlashAirに接続し、GPIOを操作します。下記のList.htmを`/SD_WLAN/` に配置してください。

* `/SD_WLAN/CONFIG` に`IFMODE=1` を追記してください。
* Airio RPのスライドスイッチは2-3にしてください。

[サンプルHTMをダウンロード (3KB)](/files/documents/List.htm){: .btn .btn-primary }

### SPI→I<sup>2</sup>CブリッジIC サンプルスクリプト（GPIO）

Airio RPのブリッジICを使いGPIOを動作させます。

* FlashAirの`/SD_WLAN/CONFIG` に`IFMODE=1` を追記してください。
* Airio RPのスライドスイッチは1-2にしてください。

[サンプルスクリプトをダウンロード (0.5KB)](/files/documents/bootscript_SPI_GPIO.lua){: .btn .btn-primary }

### SPI→I<sup>2</sup>CブリッジIC サンプルスクリプト（温度センサ/LCDモジュール）

Airio RPのブリッジICを使い温度センサの値をLCDモジュールに表示します。下記の部品表を参考に部品をI<sup>2</sup>C接続してください。

* I<sup>2</sup>Cの信号線には10kΩ程度のプルアップ抵抗を挿入してください。
* FlashAirの`/SD_WLAN/CONFIG` に`IFMODE=1` を追記してください。
* Airio RPのスライドスイッチは1-2にしてください。

[サンプルスクリプトをダウンロード (5KB)](/files/documents/bootscript_TEMP_LCD.lua){: .btn .btn-primary }

---
## 部品表

名称         | 参考URL
------------ | ------------------
温度センサ    | [https://www.switch-science.com/catalog/1813/](https://www.switch-science.com/catalog/1813/){: target="_blank" }<br>[http://www.marutsu.co.jp/pc/i/227596/](http://www.marutsu.co.jp/pc/i/227596/){: target="_blank" }
LCDモジュール | [http://akizukidenshi.com/catalog/g/gK-06795/](http://akizukidenshi.com/catalog/g/gK-06795/){: target="_blank" }<br>[https://www.switch-science.com/catalog/1405/](https://www.switch-science.com/catalog/1405/){: target="_blank" }

---
## 注意事項
* Airio RPに搭載されているSPI→I<sup>2</sup>C変換IC CP2120は、起動時にGPIOが入力に設定されています。起動直後にGPIOポートに電流を流さないようにご注意ください。
* 電源の立ち上がり時間が遅い（1ms超）ときにはCP2120のpower on resetに失敗する場合があります。Airio RPのUSBコネクタを使わず、外部から3.3Vを給電する際にはご注意ください。