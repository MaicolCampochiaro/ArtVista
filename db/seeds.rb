# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
5.times do |i|
  User.create!(
    nickname: "user#{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password123",  # You may want to change this to a secure password
  )
end

puts "5 users created successfully!"
