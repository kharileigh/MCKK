class Loan < ApplicationRecord
    belongs_to :user

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
