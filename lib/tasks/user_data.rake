namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.new(
                 email: ENV["SCRAPCAL_ADMIN_USER"],
                 password: ENV["SCRAPCAL_ADMIN_PASS"],
                 password_confirmation: ENV["SCRAPCAL_ADMIN_PASS"])

    user.create! if ! User.exists?(:email => user.email)
  end
end