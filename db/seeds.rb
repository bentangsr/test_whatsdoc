# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding 2 countries"
2.times do |n|
  country_code = Faker::Address.country_code
  Country.create! name: Faker::Address.country_by_code(code: country_code),
    code: country_code
end

puts "Seeding 10 specialists"
Specialist.create([
                    {name: "Sp. Kandungan & Kebidanan", code: Faker::Code.asin},
                    {name: "Sp. Kulit & Kelamin", code: Faker::Code.asin},
                    {name: "Sp. THT", code: Faker::Code.asin},
                    {name: "Sp. Jiwa", code: Faker::Code.asin},
                    {name: "Sp. Penyakit Dalam", code: Faker::Code.asin}
                  ])

puts "Seeding 10 workspaces"
10.times do |n|
  Workspace.create! name: Faker::Address.community, code: (Faker::Code.asin + n.to_s),
    address: Faker::Address.full_address, country_id: Country.all.sample.id
end

puts "Seeding 10 doctors"
10.times do |n|
  Doctor.create! specialist_id: Specialist.all.sample.id, workspace_id: Workspace.all.sample.id,
    chat_price: Faker::Commerce.price, phone_price: Faker::Commerce.price,
    video_price: Faker::Commerce.price
end

puts "Seeding 10 patients"
10.times do |n|
  Patient.create! weight: Faker::Measurement.metric_weight,
  height: Faker::Measurement.metric_height
end

puts "Seeding 10 users doctors"
10.times do |n|
  Faker::Config.locale = 'en-US'
  user = User.new(name: Faker::Name.unique.name,
    email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone_with_country_code,
    address: Faker::Address.full_address, country_id: Country.all.sample.id,
    gender: Faker::Gender.binary_type.downcase, personable: Doctor.all.sample,
    password: '123456789' ,password_confirmation: '123456789')
  user.save
end

puts "Seeding 10 users patients"
10.times do |n|
  Faker::Config.locale = 'en-US'
  user = User.new(name: Faker::Name.unique.name,
    email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone_with_country_code,
    address: Faker::Address.full_address, country_id: Country.all.sample.id,
    gender: Faker::Gender.binary_type.downcase, personable: Patient.all.sample,
    password: '123456789' ,password_confirmation: '123456789')
  user.save
end

puts "Seeding 10 clinics"
10.times do |n|
  Clinic.create! name: Faker::Address.community,
    address: Faker::Address.full_address, phone: Faker::PhoneNumber.cell_phone_with_country_code,
    user_id: User.doctors.sample.id, email: Faker::Internet.email
end