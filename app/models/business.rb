class Business < ApplicationRecord
  has_many :addresses, inverse_of: :project ,dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true
end
