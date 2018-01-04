require 'faker'

User.destroy_all

test = User.create!(admin: true, email: "test@test.com", password: "123456")
admin = User.create!(admin: true, email: Faker::Internet.email, password:  Faker::Internet.password)
admin_2 = User.create!(admin: true, email: Faker::Internet.email, password:  Faker::Internet.password)

student_1 = User.create!(email: "student@student.com", password:  "123456")
student_2 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_3 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_4 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_5 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_6 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_7 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_8 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_9 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
student_10 = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)

StudentGroup.create!(user_id: student_1.id, date: Date.yesterday, group_id: 1)
StudentGroup.create!(user_id: student_2.id, date: Date.yesterday, group_id: 1)
StudentGroup.create!(user_id: student_1.id, date: Date.today, group_id: 2)
StudentGroup.create!(user_id: student_4.id, date: Date.today, group_id: 2)
StudentGroup.create!(user_id: student_1.id, date: Date.tomorrow, group_id: 3)
StudentGroup.create!(user_id: student_5.id, date: Date.tomorrow, group_id: 3)



StudentGroup.create!(user_id: student_6.id, date: Date.today, group_id: 4)
StudentGroup.create!(user_id: student_7.id, date: Date.today, group_id: 4)
StudentGroup.create!(user_id: student_8.id, date: Date.today, group_id: 5)
StudentGroup.create!(user_id: student_9.id, date: Date.today, group_id: 5)
StudentGroup.create!(user_id: student_10.id, date: Date.today, group_id: 6)
