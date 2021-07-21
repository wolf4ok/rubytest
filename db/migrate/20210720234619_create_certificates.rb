class CreateCertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates do |t|
      t.integer :user
      t.integer :certs
      t.string :number
      t.date :data
      t.string :file
      t.timestamps
    end
    add_index :certificates, :number
  end
end
