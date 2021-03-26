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
    if User.count ==1
      self.add_role(:superAdmin) if self.roles.blank?
      self.add_role(:admin)
      self.add_role(:editor)
      self.add_role(:owner)
    else
      self.add_role(:owner) if self.roles.blank?
    end
  end

validate :must_have_a_role, on: :update

private
def must_have_a_role
  unless roles.any?
    errors.add(:roles, "must have at least one role")
  end
end

  
end
