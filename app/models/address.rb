class Address < ApplicationRecord
  belongs_to :business
  validates :continent, :email,:country, :city, presence: true
end
