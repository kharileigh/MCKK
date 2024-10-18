# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Loan.destroy_all
User.destroy_all


users = User.create!([
    { username: "Kamilya", password: "test123", email: "Kami@soemthing.com", MFA_secret: nil, google_secret: "nil" },
    { username: "Khari", password: "test123", email: "Khari@soemthing.com", MFA_secret: nil, google_secret: "nil" },
    { username: "Chiara", password: "test123/", email: "Chiara@soemthing.com", MFA_secret: nil, google_secret: "nil" },
    { username: "Mauro", password: "test123", email: "Mauro@soemthing.com", MFA_secret: nil, google_secret: "nil" }
])

p "Created #{User.count} Users"



Loan.create!([
    {
        company_name: "Tech Innovators Inc.",
        industry: "Technology",
        description: "A company specializing in innovative tech solutions for businesses.",
        revenue: 5000000,
        operating_expenses: 3500000,
        net_income: 1500000,
        years_in_business: 5,
        loan_amount: 1000000,
        loan_status: "approved",
        user_id: users[0].id
    },
    {
        company_name: "Green Energy Solutions",
        industry: "Renewable Energy",
        description: "Providing eco-friendly energy alternatives to homes and businesses.",
        revenue: 7500000,
        operating_expenses: 4000000,
        net_income: 3500000,
        years_in_business: 8,
        loan_amount: 1500000,
        loan_status: "approved",
        user_id: users[1].id
    },
    {
        company_name: "Urban Outfitters Inc.",
        industry: "Retail",
        description: "A clothing and accessories retail company serving urban markets.",
        revenue: 12000000,
        operating_expenses: 9000000,
        net_income: 3000000,
        years_in_business: 10,
        loan_amount: 2000000,
        loan_status: "pending",
        user_id: users[2].id
    },
    {
        company_name: "HealthFirst Medical Group",
        industry: "Healthcare",
        description: "A medical group offering high-quality healthcare services to local communities.",
        revenue: 9000000,
        operating_expenses: 6000000,
        net_income: 3000000,
        years_in_business: 15,
        loan_amount: 2500000,
        loan_status: "approved",
        user_id: users[2].id
    },
    {
        company_name: "Skyline Construction LLC",
        industry: "Construction",
        description: "A company specializing in commercial and residential construction projects.",
        revenue: 15000000,
        operating_expenses: 12000000,
        net_income: 3000000,
        years_in_business: 20,
        loan_amount: 3000000,
        loan_status: "declined",
        user_id: users[3].id
    }
    ])
    p "Created #{Loan.count} Loans"
