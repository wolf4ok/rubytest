class Skill < ApplicationRecord

  #has_and_belongs_to_many :users
  has_many :user_skills
  has_many :users, through: :user_skills
  validates :name, uniqueness: true
  validates :name, presence: true

end
