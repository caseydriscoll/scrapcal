namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(
                 email: ENV["SCRAPCAL_ADMIN_USER"],
                 password: ENV["SCRAPCAL_ADMIN_PASS"],
                 password_confirmation: ENV["SCRAPCAL_ADMIN_PASS"])
  end
end