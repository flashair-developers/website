---
layout: api-isdio
title: Command Write Register
parent: レジスタマップ
grand_parent: iSDIO
great_grand_parent: APIガイド
nav_order: 1
---
# Command Write Register

---
## iSDIO Command Write Data

iSDIO Command Write Dataは、1つまたは複数のコマンド情報を保持します。 FlashAirでは1度に1つのコマンドの発行のみをサポートしていることに注意してください。 つまり、 _Number of iSDIO Commands_ は常に１となります。

サイズ\[バイト\] | 名称                           | 簡単な説明                             | 読み込み／書き込み 
--------------| ------------------------------ | ------------------------------------- | -----------
1             | iSDIO Command Write Identifier | 01h                                   | 書き込み専用
1             | Number of iSDIO Commands       | 登録されるiSDIOコマンドの数（1～8）。FlashAirでは常に1です。 | 書き込み専用
2             | Reserved                       |                                       | 書き込み専用
4             | Size of iSDIO Command Write Data | iSDIO Command Write Dataのサイズです。| 書き込み専用
4             | Reserved                       |                                       | 書き込み専用
可変長        | [iSDIO Command Information](#isdio-command-information) |               | 書き込み専用
（以降）      | Reserved                        |                                       | 書き込み専用

---
## iSDIO Command Information

iSDIO Command Informationは単一コマンドのコマンドIDと引数の情報を保持します。 すべての引数は、_Padding_ で4バイトに整列されます。

<table>
  <thead>
    <tr>
      <th>サイズ
        <br>[バイト]</th>
      <th>名称</th>
      <th>簡単な説明</th>
      <th>読み込み／
        <br>書き込み</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2</td>
      <td>Reserved</td>
      <td>
      </td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>2</td>
      <td>iSDIO command id</td>
      <td>コマンドID</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>4</td>
      <td>iSDIO command sequence id</td>
      <td>他に発行されたコマンドと区別する為のシーケンスID</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Number of Arguments</td>
      <td>コマンドの引数の数</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Reserved</td>
      <td></td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Length of Argument（No.1）</td>
      <td>コマンドの引数（L<sub>1</sub>）の長さ</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>L<sub>1</sub></td>
      <td>Argument（No.1）</td>
      <td>コマンドの引数（1番目）</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>0, 1, 2 または 3</td>
      <td>Padding（No.1）</td>
      <td>パディングのサイズはL<sub>1</sub>mod4の値が、0であれば0、1であれば3、2であれば2、3であれば1</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td colspan="3">…​</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Length of Argument（No.n）</td>
      <td>コマンドの引数（L<sub>n</sub>）の長さ</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>L<sub>n</sub></td>
      <td>Argument（No.n）</td>
      <td>コマンドの引数（n番目）</td>
      <td>書き込み専用</td>
    </tr>
    <tr>
      <td>0, 1, 2 または 3</td>
      <td>Padding（No.n）</td>
      <td>パディングのサイズはL<sub>n</sub>mod4の値が、0であれば0、1であれば3、2であれば2、3であれば1</td>
      <td>書き込み専用</td>
    </tr>
  </tbody>
</table>