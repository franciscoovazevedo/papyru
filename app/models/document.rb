class Document < ApplicationRecord
  belongs_to :message

  validates :filetype, presence: true
end
