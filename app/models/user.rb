class User < ApplicationRecord
  has_many :tshirts, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :omniauthable, omniauth_providers: %i[facebook github google_oauth2]

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.provider = provider_data.provider
      user.uid = provider_data.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
