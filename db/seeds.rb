Arturo = User.create(name: "Arturo", email: "ahpareja@gmail.com", password: "123456")

10.times do |i|
  Article.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user: Arturo
  )
end