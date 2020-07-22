# アプリケーション概要
- Motivate Yourself
- SNS、チャットを通じた学習モチベーション維持アプリ
- [こちらのリンクからアクセスお願いします](http://18.181.137.18/)

# 機能一覧
## ユーザー機能(devise使用)
- 新規登録機能
- ログイン・ログアウト機能
- ゲストログイン機能
- プロフィール編集機能(ゲストユーザーは出来ません)
- ユーザー検索機能
- フォロー機能

## SNS機能
- 投稿・編集機能
- 投稿検索機能
- タグ付け投稿、タグ検索機能
- コメント機能
- お気に入り登録、一覧機能
- DM機能(相互フォローのユーザー同士のみ可能)

## タスク管理機能
- 作成・編集機能
- 詳細確認機能

## イベント機能
- 開催機能
- 参加機能
- 参加イベント一覧機能
- 住所マップ機能(実装途中)

## その他
- 通知機能

# テストアカウント
[こちらのリンクからアクセスお願いします](http://18.181.137.18/) <br>
トップページにアクセスし、"ゲストでログイン"ボタンからログイン可能です

# データベース設計(ER図)
<img width="712" alt="スクリーンショット 2020-07-22 21 06 27" src="https://user-images.githubusercontent.com/65991651/88174455-492f0880-cc5f-11ea-886a-577c30ecc1d4.png">

# 制作意図
自分がプログラミング学習をはじめた頃、中々成長している実感が得られず挫折しそうになっていました。<br>
そこで、プログラミング学習者が集い交流でき、技術もモチベーションも向上しあえるような<br>
特化した交流の場がほしいと思い作成しました。

# 工夫したポイント
- SNSにタスク管理を組み合わせ、常に目標ややるべきことを確認できるようにした
- 相互フォロー同士のみが使用できるDM機能を実装し、パブリックにはしたくない情報も教えあえるようにした
- イベント機能を実装し、オフラインでの交流やオンラインでのより大規模な交流も行えるようにした

# 技術一覧
- AWS,EC2,S3
- Capistoranoを用いた自動デプロイ
- データベース：MySQL (MariaDB)
- Google Maps API(実装途中)
## 使用言語
- Ruby '2.6.5'
- Rails '6.0.3'
- Haml
- SCSS
- JavaScript
- jQuery

## 使用gem
### 開発
- 'haml-rails'
- 'font-awesome-sass'
- 'carrierwave'
- 'mini_magick'
- 'devise'
- 'jquery-rails'
- 'acts-as-taggable-on'

### テスト・デバッグ等
- 'pry-rails'
- 'rspec-rails'
- 'faker'
- 'factory_bot_rails'
- 'rails-controller-testing'
- 'rubocop'
### デプロイ
- 'capistrano'
- 'capistrano-rbenv'
- 'capistrano-bundler'
- 'capistrano-rails'
- 'capistrano3-unicorn'
- 'unicorn'
