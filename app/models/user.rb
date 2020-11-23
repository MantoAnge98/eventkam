class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name , presence: true , uniqueness: true

  has_many :events, foreign_key: 'organizer_id', dependent: :destroy
  has_many :participants, foreign_key: 'participants_id', class_name: 'Participant',  dependent: :destroy
  has_many :participate, through: :participants,  dependent: :destroy


  def avatar_thumbnail
    if avatar.present?
      avatar.url
    else
      '/image.png'
    end
  end

  paginates_per 4
  
end
