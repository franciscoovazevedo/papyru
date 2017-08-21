class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :notifications, :documents

  validates :content, presence: true
  validates :identify, presence: true

end
