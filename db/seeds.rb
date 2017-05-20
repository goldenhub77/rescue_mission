# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(provider: "github", uid: 1, nickname: "itzme77", name: "John", email: "test123@123.com", avatar_url: "http://www.test.com", token: "123asdf546")
for q in 1..50 do
  question = user.questions.create(title: "This is a test title question #{q}", description: "This is the description for a question that was asked. we are currently on question #{q}")
  for a in 1..10 do
    question.answers.create(user_id: user, body: "This is an answer that will properly instruct you how to fix your problem for question #{q}. This is answer #{a}")
  end
end
