class Address < ApplicationRecord
  belongs_to :business
  #validates :continent, :country, :city, presence: true
end
