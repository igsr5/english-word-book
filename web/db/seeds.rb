# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Word.destroy_all
User.destroy_all

user = User.create(name: '田中太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')

words = [
  {origin: 'Hello', text: 'こんにちは'},
  {origin: 'World', text: '世界'},
  {origin: 'Rice', text: '米'},
  {origin: 'Water', text: '水'},
  {origin: 'Sunny', text: '晴れ'},
]

words.each do |word|
  Word.create(origin: word[:origin], text: word[:text], user_id: user.id)
end
