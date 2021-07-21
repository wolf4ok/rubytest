class Certificate < ApplicationRecord

  validates :user, :certs, :number, :file, presence: true
  validates :number, uniqueness: true
  #validates :number, :with => /\A[`!@#\$%\^&*+-_=]+\z/

end
