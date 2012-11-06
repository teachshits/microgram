namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Ridbin",
                         email: "kyzon42@gmail.com")
    admin.toggle!(:admin)
    User.create!(name: "Example User",
                 email: "example@myexample.org")
    45.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@myexample.org"
      User.create!(name: name,
                   email: email)
    end
  end
end