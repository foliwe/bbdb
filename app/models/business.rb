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
  has_one_attached :cover_photo
  has_rich_text :description
  #Validate on update
  validates :categories, presence: true, on: :update 

  validates :business_name, :description, :business_email,   presence: true 

  validates :cover_photo, attached: false, on: :update, content_type: ['image/png', 'image/jpg' , 'image/jpeg'],
                                          size: { less_than: 2.megabytes , message: 'Image must be less thab 2MB' }

  validates :logo, attached: false, on: :update,  content_type: ['image/png', 'image/jpg' , 'image/jpeg'],
                                   size: { less_than: 1.megabytes , message: 'Image must be less thab 1MB' }

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  
  searchkick index_name: 'business',word_start: %i[name]


 
  scope :verified, ->{order(verified: true)}
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

  


end
