# アプリケーション概要
- Motivate Yourself
- SNS、チャット、タスク管理、イベント機能を持つ、交流を通じた技術・モチベーション向上アプリケーション
- [こちらのリンクからアクセスお願いします](http://motivate-yourself-ty.work/)　"ゲストでログイン"ボタンからログイン可能です
### アプリケーションイメージ
<img width="1321" alt="スクリーンショット 2020-07-27 20 58 59" src="https://user-images.githubusercontent.com/65991651/88539336-06e53d00-d04c-11ea-9237-6afff3a57e48.png">

# 機能一覧
## ユーザー機能(devise使用)
- 新規登録機能
- ログイン・ログアウト機能
- ゲストログイン機能
- プロフィール編集機能(ゲストユーザーは不可)
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

## その他
- 通知機能
- タイマー機能

# テストアカウント
[こちらのリンクからアクセスお願いします](http://motivate-yourself-ty.work/) <br>
トップページにアクセスし、"ゲストでログイン"ボタンからログイン可能です。

# 使い方、デモムービー
### 以下の動画でほぼ一通りの機能を実演しております。<br>
[![](http://img.youtube.com/vi/uYqz8nRgsdo/0.jpg)](http://www.youtube.com/watch?v=uYqz8nRgsdo "")

# データベース設計(ER図)
<img width="712" alt="スクリーンショット 2020-07-22 21 06 27" src="https://user-images.githubusercontent.com/65991651/88174455-492f0880-cc5f-11ea-886a-577c30ecc1d4.png">

# 制作意図
自分自身がプログラミング学習をはじめた頃、中々成長している実感が得られず挫折しそうになっていました。<br>
そこで、プログラミング学習者が集い交流でき、技術もモチベーションも向上しあえるような、特化した交流の場がほしいと思い作成しました。<br>
また、実際にエンジニア同士の交流会に参加した際に、とても勉強になったと感じたためイベント機能を追加実装いたしました。

# 工夫したポイント
- SNSにタスク管理を組み合わせ、自分のやるべき事と、他人がやっている事を同時に確認できるようにした。
- 投稿内容とタグの２種類の検索を可能にしたことで、使う側の目的としている投稿やユーザーへのアクセシビリティを向上させた。
- 通知機能を実装し、ユーザビリティの向上を図った。
- 相互フォロー同士のみが使用できるDM機能を実装し、パブリックにはしたくない情報も教えあえるようにした。
- イベント機能を実装し、オフラインでの交流やオンラインでのより大規模な交流も行えるようにした。
- 学習する際に自分だけの世界に入りたい場合を考慮し、タイマーページを実装し効率的な勉強をサポート出来るようにした。
- 他の方からのフィードバックを参考に、リンクとなっている箇所を分かりやすいように修正した。

# 技術一覧
- AWS　(EC2,S3,VPC,Route53)
- Capistorano
-　MySQL

## 使用言語
- Ruby '2.6.5'
- Rails '6.0.3'
- Haml
- SCSS
- JavaScript
- jQuery

## 使用gem
### 開発関連
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
