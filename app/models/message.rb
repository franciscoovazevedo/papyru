class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :notifications
  has_many :documents

  validates :content, presence: true
  validates :identity, presence: true

  def has_document?
    Document.where(message: self).empty? ? false : true
  end
end
