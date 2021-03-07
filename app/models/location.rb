class Location < ApplicationRecord
  belongs_to :business
  has_many :contacts
end
