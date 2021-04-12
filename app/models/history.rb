class History < ApplicationRecord
  has_one_attached :photo
  validates :author,  presence: true
  validates :description, length: { maximum: 300 }
  validates :photo, attached: true,  content_type: ['image/png', 'image/jpg' , 'image/jpeg'],
                                          size: { less_than: 500.kilobytes , message: 'Image must be less than 500KB' }
end
