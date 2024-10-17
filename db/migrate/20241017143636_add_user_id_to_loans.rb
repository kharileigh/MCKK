class AddUserIdToLoans < ActiveRecord::Migration[7.2]
  def change
    add_reference :loans, :user, null: false, foreign_key: true
  end
end
