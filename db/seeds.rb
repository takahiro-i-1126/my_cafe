User.create!(id: 1,
             name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(id: 2,
             name:  "Test User",
             email: "test@gmail.com",
             password:              "061126",
             password_confirmation: "061126")

Store.create!(id: 1,
              name: "starbucks",
              title: "welcome",
              introduction: "Coffee shop")

Store.create!(id: 2,
              name: "momocafe",
              title: "マイホームの雰囲気がある喫茶店です",
              introduction: "パンケーキがおすすめです")

@user = User.find(1)
@store = Store.find(1)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  Review.create(content: content,user_id: @user.id, store_id: @store.id)
end
