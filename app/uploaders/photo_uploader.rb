class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :standard do
    resize_to_fill 150, 100
  end

  def extension_whitelist
    %w(png)
  end

end
