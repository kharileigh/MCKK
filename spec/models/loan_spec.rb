require 'rails_helper'

RSpec.describe Loan, type: :model do
  # TEST USER
  before(:each) do
    @user = User.create!(username: "Chiara", email: "Chiara@soemthing.com", password: "test123/", password_confirmation: "test123/")
  end

  # TEST DATA -- company_name: "Tech Innovators Inc.", industry: "Technology", description: "A company specializing in innovative tech solutions for businesses.", revenue: 5000000, operating_expenses: 3500000, net_income: 1500000, years_in_business: 5, loan_amount: 1000000

  # VALID
  it "it valid with all attributes" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      operating_expenses: 3500000,
      net_income: 1500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to be_valid
  end

  # INVALID - no company name
  it "is not valid without a company name" do
    loan = Loan.new(
        user: @user,
        industry: "Technology",
        description: "A company specializing in innovative tech solutions for businesses.",
        revenue: 5000000,
        operating_expenses: 3500000,
        net_income: 1500000,
        years_in_business: 5,
        loan_amount: 1000000
      )
      expect(loan).to_not be_valid
      expect(loan.errors[:company_name]).to include("can't be blank")
  end

  # INVALID - no industry
  it "is not valid without an industry" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      operating_expenses: 3500000,
      net_income: 1500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:industry]).to include("can't be blank")
  end

  # INVALID - no description
  it "is not valid without a description" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      revenue: 5000000,
      operating_expenses: 3500000,
      net_income: 1500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:description]).to include("can't be blank")
  end

  # INVALID - no revenue
  it "is not valid without a revenue" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      operating_expenses: 3500000,
      net_income: 1500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:revenue]).to include("can't be blank")
  end

  # INVALID - no operating expenses
  it "is not valid without operating expenses" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      net_income: 1500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:operating_expenses]).to include("can't be blank")
  end

  # INVALID - no net income
  it "is not valid without a net income" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      operating_expenses: 3500000,
      years_in_business: 5,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:net_income]).to include("can't be blank")
  end

  # INVALID - no years in business
  it "is not valid without years in business" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      operating_expenses: 3500000,
      net_income: 1500000,
      loan_amount: 1000000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:years_in_business]).to include("can't be blank")
  end

  # INVALID - no loan amount
  it "is not valid without loan amount" do
    loan = Loan.new(
      user: @user,
      company_name: "Tech Innovators Inc.",
      industry: "Technology",
      description: "A company specializing in innovative tech solutions for businesses.",
      revenue: 5000000,
      operating_expenses: 3500000,
      net_income: 1500000
    )
    expect(loan).to_not be_valid
    expect(loan.errors[:loan_amount]).to include("can't be blank")
  end
end
