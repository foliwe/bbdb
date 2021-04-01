class Address < ApplicationRecord
  belongs_to :business
  validates :continent, :email,:country, :city, presence: true

  def country_name
    c = ISO3166::Country[self.country]
    return c.translations[I18n.locale.to_s] || c.name
 end
end
