class Loan < ApplicationRecord
    belongs_to :user

    encrypts :revenue, deterministic: true
    encrypts :operating_expenses, deterministic: true
    encrypts :net_income, deterministic: true
    encrypts :years_in_business, deterministic: true
    encrypts :loan_amount, deterministic: true

    validates :company_name, presence: true
    validates :industry, presence: true
    validates :description, presence: true
    validates :revenue, presence: true
    validates :operating_expenses, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
    validates :net_income, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
    validates :years_in_business, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
    validates :loan_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
    
    attribute :loan_status, :string, default: "pending"

end
