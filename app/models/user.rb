class User < ApplicationRecord
  rolify
  extend FriendlyId
  friendly_id :first_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :assign_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :businesses , dependent: :destroy
  has_many :likes
  validates :title, :first_name, :last_name, presence: true

  
  def assign_default_role
    self.add_role(:owner) if self.roles.blank?
  end



  
end
