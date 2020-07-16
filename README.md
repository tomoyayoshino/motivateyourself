# アプリケーション概要
- Motivate Yourself
- SNS、チャットを通じた学習モチベーション維持アプリ

# 機能一覧
ユーザー機能、
ゲストユーザー機能、
投稿機能、
通知機能、
検索機能、
タグ機能、
コメント機能、
お気に入り機能、
フォロー機能、
DM機能、
タスク管理機能、
簡易タイマー

# テストアカウント
[こちらのリンクからアクセスお願いします](http://18.181.137.18/)
- トップページにアクセスし、"ゲストでログイン"ボタンからログイン可能です

# 制作意図
自分がプログラミング学習をはじめた頃、中々成長している実感が得られず挫折しそうになっていました。
そこで、プログラミング学習者が集い交流できる、特化したSNSがほしいと思い作成しました。

# 工夫したポイント
- SNSにタスク管理を組み合わせ、常に目標ややるべきことを確認できるようにした
- 相互フォロー同士のみが使用できるDM機能を実装し、パブリックにはしたくない情報も教えあえるようにした
- デザインはできるだけシンプルにし、投稿が目立つようにした

# 技術一覧
- AWS,EC2,S3
- Capistoranoを用いた自動デプロイ
- データベース：MySQL (MariaDB)
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
- 'gon'
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
