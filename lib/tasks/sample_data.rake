namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Rid",
                         email: "kyzon42@gmail.com")
    admin.toggle!(:admin)
    User.create!(name: "Example User",
                 email: "example@myexample.org")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@myexample.org"
      User.create!(name: name,
                   email: email)
    end
  end
end