class CreateUsersSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :users_skills, id: false do |t|
      t.integer :users_id
      t.integer :skills_id
    end
  end
end
