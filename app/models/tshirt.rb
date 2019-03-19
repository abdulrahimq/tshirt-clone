class Tshirt < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
