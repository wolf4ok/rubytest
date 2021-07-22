class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.string :mail
      t.timestamps
    end
  end
end
