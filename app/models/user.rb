class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :businesses , dependent: :destroy
<<<<<<< HEAD
  validates :title, :first_name, :last_name, presence: true
=======


  
>>>>>>> 69e5dc89668d0836770e33232d8ea7f8e332b1ae
end
