class CreateLoans < ActiveRecord::Migration[7.2]
  def change
    create_table :loans do |t|
      t.string :company_name
      t.string :industry
      t.text :description
      t.integer :revenue
      t.integer :operating_expenses
      t.integer :net_income
      t.integer :years_in_business
      t.integer :loan_amount
      t.string :loan_status

      t.timestamps
    end
  end
end
