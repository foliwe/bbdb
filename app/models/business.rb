class Business < ApplicationRecord
  has_many :addresses, inverse_of: :business ,dependent: :destroy
  belongs_to :user
  has_one_attached :logo 
  has_many_attached :photos
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
end
