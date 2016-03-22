##導入手順
動作環境 Mac OS 10.10/5
言語 ruby 2.3.0 
フレームワーク rails 4.2.2

```
//関連するgemのinstall
bundle install 
//rails のserverを起動する
rails server
```
ブラウザで
http://localhost:3000
にアクセスする

hello worldと表示されているのを確認する

##Scraping　Sample
スクレイピングのコードを試したい場合は
railsとは別に作成してあるrbファイルを実行する
###準備
account.ymlの更新
```account.yml
account:
  id : "自分のアカウント"
  password: "自分のパスワード"
```
###webkit driverのinstall
Macの場合
```
brew update
brew install qt
```
```
ruby su_time_table.rb
```
