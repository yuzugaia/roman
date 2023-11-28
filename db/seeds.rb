# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者
Admin.create!(
  email: 'kanri@sya',
  password: '123kanri',
)

#サンプルユーザー

User.create!(
  name: "麦茶",
  email: "11@11",
  password: "password",
)

User.create!(
  name: "マテ茶",
  email: "22@22",
  password: "password",
)

User.create!(
  name: "緑茶",
  email: "33@33",
  password: "password",
)

User.create!(
  name: "抹茶",
  email: "44@44",
  password: "password",
)

User.create!(
  name: "ほうじ茶",
  email: "55@55",
  password: "password",
)

User.create!(
  name: "紅茶",
  email: "66@66",
  password: "password",
)

#ジャンル
genres = [
  'ファンタジー',
  '恋愛',
  'ミステリー',
  'SF',
  'エッセイ',
  'ノンフィクション',
  'その他',
]

genres.each do |genre|
  Genre.create!(
    name: genre
  )
end

#投稿物

