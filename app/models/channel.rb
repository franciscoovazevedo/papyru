class Channel < ApplicationRecord
  has_many :messages
  has_many :studies
  validates :description, presence: true, length: { maximum: 30}
  validates :status, presence: true
end
