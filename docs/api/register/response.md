---
layout: api-isdio
title: Response Data Register Port
parent: レジスタマップ
grand_parent: iSDIO
nav_order: 2
---

# Response Data Register Port

iSDIO Command Response Dataは発行されたコマンドからのレスポンスが含まれています。

サイズ\[バイト\] | 名称                              | 簡単な説明                             | 読み込み／書き込み 
----------------| --------------------------------- | ------------------------------------- | -----------
1               | iSDIO Command Response Identifier | 02h                                   | 読み込み専用
3               | Reserved                          |                                       | 読み込み専用
4               | Size of iSDIO Command Response Data | iSDIO Command Response Dataのサイズ  | 読み込み専用
6               | Reserved                          |                                       | 読み込み専用
2               | iSDIO command id                  | Command Write Registerに書かれているコマンドのコマンドID | 読み込み専用
4               | iSDIO command sequence id         | Command Write Registerに書かれているコマンドのコマンドシーケンスID | 読み込み専用
4               | Size of Response Data             | レスポンスデータ(L<sub>1</sub>)のサイズ  | 読み込み専用
L<sub>1</sub>   | Response Data                     | 発行されたコマンドに対するレスポンスデータ  | 読み込み専用
0, 1, 2 または 3 | Padding                          | パディングのサイズはL<sub>1</sub>mod4の値が、0であれば0、1であれば3、2であれば2、3であれば1 | 読み込み専用
（以降）         | Reserved                         |                                        | 読み込み専用
                  