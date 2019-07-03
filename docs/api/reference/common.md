---
layout: api-isdio
title: 共通コマンド
parent: コマンドリファレンス
grand_parent: iSDIO
nav_order: 2
---

# 共通コマンド

コマンドID | コマンド名                                                   | 機能                                                        
--------- | ----------------------------------------------------------- | ----------------------------------------------------------
0011h     | [SetCurrentTime(currentDate, currentTime)](#SetCurrentTime) | 現在時刻の設定
0012h     | [Abort(sequenceID)](#Abort)                                 | 特定のiSDIOコマンドの実行を停止
0013h     | [ReadResponse(sequenceID)](#ReadResponse)                   | レスポンスデータの読み取り
0014h     | [SetPowerSaveMode(powerMode)](#SetPowerSaveMode)            | パワーセーブモードの設定（オン/オフ）
0015h     | [SetChannel(channelNum)](#SetChannel)                       | APモードで使用する無線チャネルの設定


---
<h2 id="SetCurrentTime">SetCurrentTime(currentDate, currentTime)</h2>

FlashAirに現在時刻を設定するためのホストリクエストです。FlashAirの内部の時計の数字からカウントが始まります。時刻を設定、修正、アクセスしたときに、ファイルやディレクトリにタイムスタンプが設定されます。

### コマンドID

0011h

### 引数

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Size</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>現在時刻</td>
      <td>integer (little endian)</td>
      <td>2バイト</td>
      <td>
        <code>currentDate</code>はFlashAirに設定する時刻です。フォーマットは以下のとおりです。
        <ul>
          <li>Bits 0 to 4: 日の設定、有効な数値は1～31</li>
          <li>Bits 5 to 8: 月の設定、有効な数値は1～12</li>
          <li>Bits 9 to 15: 年の設定、有効な数値は0～127（1980～2107）</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>現在時刻</td>
      <td>integer (little endian)</td>
      <td>2バイト</td>
      <td>
        <code>currentDate</code>はFlashAirに設定する時刻です。フォーマットは以下のとおりです。<p></p>
        <ul>
          <li>Bits 0 to 4: 秒の設定（2秒？）、有効な数値は0～29(0～58秒) 2-second count</li>
          <li>Bits 5 to 10: 分の設定、有効な数値は0～59</li>
          <li>Bits 11 to 15: 時の設定、有効な数値は0～23、設定可能な時刻は深夜00:00:00～23:59:58</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>                                                                      

### レスポンス

無し

---
<h2 id="abort">Abort(sequenceID)</h2>

特定のiSDIOコマンドの実行を停止するためのホストリクエストです。FlashAirがこのコマンドを受信すると、現在プロセス中のコマンドは発行されていないものとみなして動作します。しかし、NANDメモリーモジュールの中にファイルを作るコマンド（"SendHTTPMessageByFile"、"SendHTTPFileByFile"、"SendHTTPSSLMessageByFile"、"SendHTTPSSLFileByFile"、"DLNA_AcceptUpload"、"GetFile" and "PTP_ReceiveFile"など）があっても、FlashAirはプロセスが完全に終わっていなくてもファイルを除く必要はありません。これは、FlashAirがすべてのデータを保存しているとは限らないということです。そのためプロセス中断後、ホストは完了していないファイルを適切に処理します。さらに、FlashAirはファイルアロケーションテーブル、ディレクトリーエントリーなどのファイルシステムのメタデータを継続的に維持します。このコマンドは、受信された場合、現在のプロセス中のコマンドより先に実行されます。このコマンドのためのCommand Response Status はCommand Response Status Queue に登録されません。しかし、中断したコマンドのCommand Response Statusは"04h: Process Terminated"に変換されます。つまり、このコマンドが発行されていても、いずれのコマンドのステータスはキューにから除かれないということです。例えば、複数のコマンドがプロセス中で、そのうちの一つが中断されたとき、他のコマンドは影響を受けずプロセスを継続します。

コマンドが発行されたタイミングによって、このコマンドは無視され、中断されたターゲットコマンドはプロセスを完了します。ターゲットコマンドのコマンドレスポンスステータスは"03h: Process Succeeded"または "80h to FFh: Process Failed"になります。この場合も "Abort"コマンドのプロセス時間は変わりません。

無線LAN接続の終了またはPeer-to-Peer File Transferアプリケーションの終了には、"Disconnect"コマンドを使用することが推奨されています。

### コマンドID

0012h

### 引数

Name       | Type    | Size   | 説明                                                           
---------- | ------- | ------ | --------------------------------------------------------------
sequenceID | integer | 4-byte | `sequenceID`は、コマンド発行時ホストによって特定された、コマンドのiSDIOコマンドシークエンスIDを意味します。値は "00 00 00 00h"から"FF FFFF FFh"となります。

### レスポンス

無し

---
<h2 id="readresponse">ReadResponse(sequenceID)</h2>

指定のiSDIOコマンドシークエンスIDによって発行されたコマンドに対応して、レスポンスデータを読み取るためのホストリクエストです。レスポンスデータは、バッファオーバーフローでない限り、Response Data Register Portから取得可能です。このコマンドは特定のコマンドが完了しCommand Response Status Queueにあるときにのみ有効です。さらに、このコマンドのプロセスは、現在プロセス中のコマンドより優先され、このコマンドのコマンドレスポンスステータスはCommand Response Status Queueに登録されません。つまり、このコマンドが発行されても、いずれのコマンドステータスもキューから除かれることはありません。

### コマンドID

0013h

### 引数

Name       | Type    | Size   | 説明                                                           
---------- | ------- | ------ | --------------------------------------------------------------
sequenceID | integer | 4-byte | `sequenceID`は、コマンド発行時ホストによって特定された、コマンドのiSDIOコマンドシークエンスIDを意味します。値は "00 00 00 00h"から"FF FFFF FFh"となります。

### レスポンス

レスポンスデータは特定のiSDIOコマンドによります。(2.2.2.3 iSDIO Command Response Data in \[iSDIO\]を参照してください)。

Command Response Status Queueにある最初のコマンドにおいて、コマンドレスポンスステータス#1のレスポンスデータはResponse Data Register Portにデフォルトでマップされます。また#2～8のコマンドレスポンスステータスについては、このコマンドは特定のレスポンスデータがResponse Register Portにマップされるよう発行されます。（もしホストがCommand Write DataにあるひとつのiSDIOコマンドを、キューのプロセス無しで発行した場合、ホストはこのコマンドを使う必要がなくなります。）このコマンドはResponse DataをCommand Response Status #1にマップするために発行されることが可能です。

さらに、現在のレスポンスデータの読み込みが完了する前に、このコマンドが発行された場合でも、新しいレスポンスデータはデータの最初から読み取りが可能です。つまり、同じコマンドのうち、一つがこのコマンドによって特定され、現在のレスポンスデータの読み込みが完了する前でも、レスポンスデータは最初から読み取りが可能です。

---
<h2 id="setpowersavemode">SetPowerSaveMode(powerMode)</h2>

FlashAirのパワーセーブモードを変更するためのホストリクエストです。モードがオンのとき、FlashAirはパワーセーブモードで機能します。（パワーセービングの認識はFlashAir実行によります。データ移行など他の動作が行われていた場合はFlashAirによってはこのモードが低くなります。）

### コマンドID

0014h

### 引数

<table>
  <colgroup>
    <col>
    <col class="w-25">
    <col>
    <col class="w-50">
  </colgroup>
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
      <td>
        パワーモード
      </td>
      <td>
        integer
      </td>
      <td>
        1-byte
      </td>
      <td>
        <code>powerMode</code>はパワーセーブモードを意味します。
        <dl>
          <dt>00h</dt>
          <dd>
            パワーセーブモード Off
          </dd>
          <dt>01h</dt>
          <dd>
            パワーセーブモード On
          </dd>
        </dl>
      </td>
    </tr>
  </tbody>
</table>

    <section>
        ### レスポンス

        無し
    </section>
</section>

<section>
    ## SetChannel(channelNum)

    <div class="separator-2"></div>

    FlashAirのAPにチャンネルを設定するためのホストリクエストです。FlashAirが一部のチャンネルをサポートしていない場合、このコマンドは拒否されます。ホストはCapability
    Registerの"Channel
    Support"を確認する必要があります。iSDIO Capability Register for Wireless LANを参照してください。

    <section>
        ### コマンドID

        0015h
    </section>

    <section>
        ### 引数

        <colgroup>
                            <col>
                            <col class="w-25">
                            <col>
                            <col class="w-50">
                          </colgroup>
        Name                                                   | Type                                                   | Size                                                  | 説明                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        ------------------------------------------------------ | ------------------------------------------------------ | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                チャンネル番号
                               |                         integer
                               |                         1-byte
                               | `channelNum`はチャンネルの番号を意味します。


        <dl>
            <dt>00h</dt>
            <dd>                            チャンネル番号は自動的に設定されます。
                                      </dd>
            <dt>01h</dt>
            <dd>                            チャンネル 1 …​
                                      </dd>
            <dt>0Eh</dt>
            <dd>                            チャンネル 14
                                      </dd>
            <dt>24h</dt>
            <dd>                            チャンネル 36 …​
                                      </dd>
            <dt>A1h</dt>
            <dd>                            チャンネル 161
                                      </dd>
        </dl>
    </section>

    <section>
        ### レスポンス

        無し
    </section>
</section>