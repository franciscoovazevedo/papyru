# encoding: utf-8

class CsvFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
