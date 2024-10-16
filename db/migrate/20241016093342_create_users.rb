class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :MFA_secret
      t.string :google_secret

      t.timestamps
    end
  end
end
