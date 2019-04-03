class User < ApplicationRecord
  has_many :tshirts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :services, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  mount_uploader :photo, PhotoUploader
end
