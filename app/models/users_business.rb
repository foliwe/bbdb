class UsersBusiness < ApplicationRecord
  belongs_to :user
  belongs_to :business
end
