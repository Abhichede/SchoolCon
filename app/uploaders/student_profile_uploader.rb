# encoding: utf-8
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'ap-south-1'
  }
  config.fog_directory  = ENV['AWS_S3_BUCKET'] # bucket name
end

# require 'carrierwave/storage/ftp'
# CarrierWave.configure do |config|
#   config.ftp_host = "ftp.myschoolcon.com"
#   config.ftp_port = 21
#   config.ftp_user = ENV['FTP_USERNAME']
#   config.ftp_passwd = ENV['FTP_PASSWORD']
#   config.ftp_folder = ENV['FTP_FOLDER']
#   config.ftp_url = ENV['FTP_URL']
#   config.ftp_passive = false # false by default
#   config.ftp_tls = false # false by default
# end

class StudentProfileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # version :medium do
  #   process :resize_to_fit => [150, 150]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "student_profile.jpg" if original_filename
  end

end
