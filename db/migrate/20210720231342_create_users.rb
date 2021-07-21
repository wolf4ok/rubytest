class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :surname
      t.integer :accaunt
      t.string :foto
      t.string :mail
      t.string :home
      t.integer :skills
      t.string :resume
      t.boolean :resume_active
      t.string :comment
      t.timestamps
    end
    add_index :users, :lastname
    add_index :users, :firstname
    add_index :users, :mail
  end
end
