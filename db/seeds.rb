5.times do |_n|
  user = User.create!(account: Faker::Internet.username,
                      name: Faker::JapaneseMedia::DragonBall.character,
                      email: Faker::Internet.email)

  user.articles.create!(title: Faker::Lorem.word,
                        body: Faker::Lorem.sentence)
end
