class User < ApplicationRecord

  #has_and_belongs_to_many :skills
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :certificates
  #validate :mail, format: { with: URI::MailTo::EMAIL_REGEXP }
  #validates :lastname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  #validates :firstname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  #validates :surname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :lastname, length: { in: 3..50 }
  validates :firstname, length: { in: 3..50 }
  validates :surname, length: { in: 3..50 }
  validates :lastname, :firstname, :surname, :mail, presence: true
  validates :mail, uniqueness: true

end
