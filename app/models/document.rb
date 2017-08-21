class Document < ApplicationRecord
  belongs_to :message

  validates :type, presence: true
end
