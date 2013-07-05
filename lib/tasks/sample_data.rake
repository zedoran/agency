namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "ab@ba.org",
                         password: "123456",
                         password_confirmation: "123456")
    admin.toggle!(:admin)
  end
end