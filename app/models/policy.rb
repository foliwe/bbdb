class Policy < ApplicationRecord
  validates :title, :body , presence: true
end
