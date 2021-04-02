class Address < ApplicationRecord
  belongs_to :business
  validates :continent, :country, :email,:city, presence: true 

#   def country_name
#     country = ISO3166::Country[self.country]
#     return country.translations[I18n.locale.to_s] || country.name
#  end
end
