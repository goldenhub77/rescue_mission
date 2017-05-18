# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for q in 1..50 do
  question = Question.create(title: "This is a test title question #{q}", description: "This is the description for a question that was asked. we are currently on question #{q}")
  for a in 1..10 do
    question.answers.create(body: "This is an answer that will properly instruct you how to fix your problem for question #{q}. This is answer #{a}")
  end
end
