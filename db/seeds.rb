User.create!(id: 1,
             name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

Store.create!(id: 1,
              name: "starbucks",
              title: "welcome",
              introduction: "Coffee shop")

@user = User.find(1)
@store = Store.find(1)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  Review.create(content: content,user_id: @user.id, store_id: @store.id)
end
