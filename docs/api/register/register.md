---
layout: api-isdio
title: レジスタマップ
parent: iSDIO
nav_order: 1
---

# レジスタマップ

FlashAirのiSDIOのメモリマップです。

アドレス | サイズ | タイプ      | 名称                                             | 読み／書き
------ | ------ | ----------- | ------------------------------------------------ | -----
00000h | 00200h | データポート | [Command Write Register](./request)       | 書き込み 
00200h | 00200h | データポート | [Response Data Register Port](./response) | 読み込み 
00400h | 00200h | メモリ      | [Status Register](./status)                |      
00600h | 00200h | メモリ      | Capability Register                               | 読み込み 
00800h | 00200h | -           | Reserved                                          |      
01000h | 00200h | メモリ      | Shared Memory (W-02, W-03, W-04)<sup>\*</sup>     | 読み書き 
01200h | 00600h | メモリ      | Shared Memory (W-04)<sup>\*</sup>                 | 読み書き 
01800h | 00800h | -          | Reserved for Vendor                                |      
02000h | 1E000h | -          | Reserved                                           |      

<sup>\*</sup>Shared Memory は iSDIO のメモリアクセスコマンドのほか、下記のAPIで利用できます。

* command.cgi [共有メモリからのデータの取得 (op=130)]({{ site.baseurl }}/docs/api/command.cgi.html#130)
* command.cgi [共有メモリへのデータの書き込み (op=131)]({{ site.baseurl }}/docs/api/command.cgi.html#131)
* lua機能 [sharedmemory]({{ site.baseurl }}/docs/api/lua.html#sharedmemory)