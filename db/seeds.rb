# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

users = User.create!([
    { username: "Kamilya", password: "test1237320uge", email: "Kami@soemthing.com", MFA_secret: 456, google_secret: "nill" },
    { username: "Khari", password: "test2346773209halsjS73", email: "Khari@soemthing.com", MFA_secret: 900, google_secret: "nill" },
    { username: "Chiara", password: "testPL297278HAVD/", email: "Chiara@soemthing.com", MFA_secret: 655, google_secret: "nill" },
    { username: "Mauro", password: "test786TTjaslasg", email: "Mauro@soemthing.com", MFA_secret: 499, google_secret: "nill" }
])

p "Created #{User.count} Users"