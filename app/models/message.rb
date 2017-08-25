class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  has_many :notifications
  has_many :documents, inverse_of: :message

  validates :content, presence: true
  validates :identity, presence: true

  #
  accepts_nested_attributes_for :documents

  def has_document?
    Document.where(message: self).empty? ? false : true
  end
end
