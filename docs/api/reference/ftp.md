---
layout: api-isdio
title: FTP/FTPS（FlashAir独自拡張）
parent: コマンドリファレンス
grand_parent: iSDIO
nav_order: 4
---

# FTP/FTPS（FlashAir独自拡張）

### FTP

コマンドID         | コマンド名                                                          | 機能                                     
----------------- | ------------------------------------------------------------------ | ---------------------------------------
0E001h | [get(hostname, port, user, pass, serverFile, localFile)](#ftpget)             | FTPサーバーからファイルを取得
0E002h | [put(hostName, port, user, pass, serverFile, localFile)](#ftpput)             | FTPサーバーへファイルを送信
0E003h | [rename(hostName, port, user, pass, sourceFile, distinationFile)](#ftprename) | FTPサーバー上のファイル名を変更
0E004h | [delete(hostName, port, user, pass, serverFile) ](#ftpdelete)                 | FTPサーバーのファイルを削除
0E005h | [getList(hostName, port, user, pass, directoryName) ](#ftpgetlist)            | FTPサーバーのディレクトリ情報を取得

### FTPS

コマンドID | コマンド名                                                                            | 機能                                     
------    | ------------------------------------------------------------------------------------ | ---------------------------------------
0E011h    | [get(hostname, port, mode, user, pass, serverFile, localFile)](#ftpsget)             | FTPSサーバーからファイルを取得
0E012h    | [put(hostName, port, mode, user, pass, serverFile, localFile)](#ftpsput)             | FTPSサーバーへファイルを送信
0E013h    | [rename(hostName, port, mode, user, pass, sourceFile, distinationFile)](#ftpsrename) | FTPSサーバー上のファイル名を変更
0E014h    | [delete(hostName, port, mode, user, pass, serverFile)](#ftpsdelete)                  | FTPSサーバーのファイルを削除
0E015h    | [getList(hostName, port, mode, user, pass, directoryName)](#ftpsgetlist)             | FTPSサーバーのディレクトリ情報を取得

---
<h2 id="ftpget">get(hostname, port, user, pass, serverFile, localFile)</h2>

FTPサーバーからのファイルを取得します。取得したファイルは指定されたlocalFileのファイルパス名により保存されます。

### コマンドID

0E001h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト                  | ポート番号。
user                      | Value                   | 可変長                   | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPサーバーのパスワード。最大64文字指定できます。
serverFile                | Value                   | 可変長                   | FTPサーバー上のファイル名。最大128文字指定できます。
localFile                 | Value			    				  | 可変長                   | 取得したファイルに付ける名称。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpput">put(hostName, port, user, pass, serverFile, localFile)</h2>

FTPサーバーへファイルを送信します。

### コマンドID

0E002h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト                  | ポート番号。
user                      | Value                   | 可変長                   | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPサーバーのパスワード。最大64文字指定できます。
serverFile             	  | Value                   | 可変長                   | FTPサーバー上のファイル名。最大128文字指定できます。
localFile                 | Value                   | 可変長                   | 送信するファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftprename">rename(hostName, port, user, pass, sourceFile, distinationFile)</h2>

FTPサーバー上のファイル名を変更します。

### コマンドID

0E003h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト               	 | ポート番号。
user                      | Value                   | 可変長                	 | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPサーバーのパスワード。最大64文字指定できます。
serverFile                | Value                   | 可変長                   | FTPサーバー上のファイル名。最大128文字指定できます。
distinationFile       		| Value                   | 可変長                   | 変更後のファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpdelete">delete(hostName, port, user, pass, serverFile)</h2>

FTPサーバーのファイルを削除します。

### コマンドID

0E004h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname            		  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト                  | ポート番号。
user                      | Value                   | 可変長                   | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPサーバーのパスワード。最大64文字指定できます。
serverFile                | Value                   | 可変長                   | FTPサーバー上の削除するファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpgetlist">getList(hostName, port, user, pass, directoryName)</h2>

FTPサーバーのディレクトリ情報を取得します。取得するデータは、FTPサーバーにより作成された文字列となります。

### コマンドID

0E005h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト             		 | ポート番号。
user                      | Value                   | 可変長                   | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPサーバーのパスワード。最大64文字指定できます。
directoryName             | Value                   | 可変長                   | FTPサーバー上の情報を取得するディレクトリ名。最大128文字指定できます。

### レスポンス

directoryNameで指定したディレクトリ配下のリストを取得することが出来ます。

---
<h2 id="ftpsget">get(hostname, port, mode, user, pass, serverFile, localFile)</h2>

FTPSサーバーからのファイルを取得します。取得したファイルは指定されたlocalFileのファイルパス名により保存されます。

### コマンドID

0E011h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト                  | ポート番号。
mode                      | integer                 | 1バイト                  | モード設定。
user                      | Value                   | 可変長                   | FTPSサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長               	   | FTPSサーバーのパスワード。最大64文字指定できます。
serverFile           		  | Value                   | 可変長                   | FTPSサーバー上のファイル名。最大128文字指定できます。
localFile           		  | Value                   | 可変長                   | 取得したファイルに付ける名称。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpsput">put(hostName, port, mode, user, pass, serverFile, localFile)</h2>

FTPSサーバーへファイルを送信します。

### コマンドID

0E012h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト               	 | ポート番号。
mode                      | integer                 | 1バイト               	 | モード設定。
user                      | Value                   | 可変長                   | FTPSサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長               	   | FTPSサーバーのパスワード。最大64文字指定できます。
serverFile            	  | Value                   | 可変長                   | FTPSサーバー上のファイル名。最大128文字指定できます。
localFile                 | Value                   | 可変長                   | 送信するファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpsrename">rename(hostName, port, mode, user, pass, sourceFile, distinationFile)</h2>

FTPSサーバー上のファイル名を変更します。

### コマンドID

0E013h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト             		 | ポート番号。
mode                      | integer                 | 1バイト                  | モード設定。
user                      | Value                   | 可変長                   | FTPサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPSサーバーのパスワード。最大64文字指定できます。
serverFile                | Value                   | 可変長                   | FTPSサーバー上のファイル名。最大128文字指定できます。
distinationFile      		  | Value                   | 可変長                   | 変更後のファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpsdelete">delete(hostName, port, mode, user, pass, serverFile)</h2>

FTPSサーバーのファイルを削除します。

### コマンドID

0E014h

### 引数

Name                      | Type                    | Size                    | 説明  
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト               	 | ポート番号。
mode                      | integer                 | 1バイト               	 | モード設定。
user                      | Value                   | 可変長                   | FTPSサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPSサーバーのパスワード。最大64文字指定できます。
serverFile              	| Value	  							  | 可変長                   | FTPSサーバー上の削除するファイル名。最大128文字指定できます。

### レスポンス

なし

---
<h2 id="ftpsgetlist">getList(hostName, port, mode, user, pass, directoryName)</h2>

FTPSサーバーのディレクトリ情報を取得します。取得するデータは、FTPSサーバーにより作成された文字列となります。

### コマンドID

0E015h

### 引数

Name                      | Type                    | Size                    | 説明                                 
------------------------- | ----------------------- | ----------------------- | ---------------------
hostname                  | Value                   | 可変長                   | ホスト名。最大128文字指定できます。
port                      | integer                 | 2バイト                  | ポート番号。
mode                      | integer                 | 1バイト                  | モード設定。
user                      | Value                   | 可変長                   | FTPSサーバーのユーザー名。最大64文字指定できます。
pass                      | Value                   | 可変長                   | FTPSサーバーのパスワード。最大64文字指定できます。
directoryName           	| Value                   | 可変長                   | FTPSサーバー上の情報を取得するディレクトリ名。最大128文字指定できます。

### レスポンス

directoryNameで指定したディレクトリ配下のリストを取得することが出来ます。
