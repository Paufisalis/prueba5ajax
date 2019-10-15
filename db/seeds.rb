# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Complaint.destroy_all
User.destroy_all
Company.destroy_all

20.times do
  Company.create(name: Faker::Company.name)
end

30.times do |i|
  User.create(email: "example#{i+1}@mail.com", password: '123123', password_confirmation: '123123')
end

250.times do
  Complaint.create(content: Faker::Lorem.sentence, user_id: User.all.sample.id, company_id: Company.all.sample.id)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation:
'password') if Rails.env.development? 
