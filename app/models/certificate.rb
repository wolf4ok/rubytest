class Certificate < ApplicationRecord

  belongs_to :user
  belongs_to :cert
  validates :user_id, :cert_id, :number, :file, presence: true
  validates :number, uniqueness: true
  #validates :number, :with => /\A[`!@#\$%\^&*+-_=]+\z/

end
