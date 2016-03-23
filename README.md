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

方針
jsonを返してほしい場合は
endpointに
/*.json
とすることでjsonを返す
