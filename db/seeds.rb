User.create!(name: "Admin",
             email: "admin@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             role: 1)
User.create!(name: "Test User",
             email: "test@gmail.com",
             password: "123456",
             password_confirmation: "123456")

2.times do |n|
  name = Faker::Name.name
  email = "trainee-#{n+1}@gmail.com"
  password = "123456"
  password_confirmation = "123456"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password, role: 0)
end

5.times do
  name = Faker::Name.title
  cate = Category.create! name: name
end

40.times do
  question = cate.questions.build content: Faker::Lorem.characters(5), pattern: 1
  question.answers = [
    Answer.new(content: Faker::Lorem.characters(11), is_correct: true),
    Answer.new(content: Faker::Lorem.characters(11), is_correct: false),
    Answer.new(content: Faker::Lorem.characters(11), is_correct: false),
    Answer.new(content: Faker::Lorem.characters(11), is_correct: false)
  ].shuffle
  question.save!
end
