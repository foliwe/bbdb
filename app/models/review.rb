class Review < ApplicationRecord
  belongs_to :business
  validates :comment, presence: true
end
