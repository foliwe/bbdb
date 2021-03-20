class Business < ApplicationRecord
  has_many :likes
  has_many :business_categories
  has_many :categories , through: :business_categories
  has_many :addresses, inverse_of: :business ,dependent: :destroy
  belongs_to :user
  has_one_attached :logo 
  has_many_attached :photos
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  validates :business_name, :description, :business_email, :number_of_employee,  presence: true 
  searchkick index_name: 'business',word_start: %i[name]

    scope :search_import, -> { includes(addresses: {country: :continent})}

    def search_data
        {
          name: business_name,
          #category: category.present? ? category.name : nil,
          #business_type: business_type,
          #country: countries.present? ? countries.pluck(:name) : nil,
          #continent: countries.present? ? countries.joins(:continent).map{|x|x.continent.name} : nil,
          verified: verified,
          partnership: accepts_partnership
        }
    end
end
