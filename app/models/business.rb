class Business < ApplicationRecord
  extend FriendlyId
  friendly_id :business_name, use: :slugged
  has_many :likes
  has_many :reviews
  has_many :business_categories,dependent: :delete_all
  has_many :categories , through: :business_categories
  has_many :addresses, inverse_of: :business ,dependent: :destroy
  belongs_to :user
  has_one_attached :logo 
  has_many_attached :photos
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  validates :business_name, :description, :business_email, :number_of_employee,  presence: true 
  searchkick index_name: 'business',word_start: %i[name]

  scope :shares, -> { where(accepts_partnership: true) }
  
  scope :search_import, -> { includes(:categories, :addresses) }

  def search_data
      {
        name: business_name,
        category: categories.present? ? categories.map{|x|x.name} : nil,
        city: addresses.present? ? addresses.pluck(:city) : nil,
        country: addresses.present? ? addresses.pluck(:country) : nil,
        #continent: countries.present? ? countries.joins(:continent).map{|x|x.continent.name} : nil,
        verified: verified,
        partnership: accepts_partnership
      }
  end

  def verified?
    business.verified
  end
end
