class Cert < ApplicationRecord

  has_one :certificates
  validates :name, uniqueness: true
  validates :name, presence: true

end
