class Channel < ApplicationRecord
  belongs_to :teacher_subject
  has_many :messages

  validates :description, presence: true, length: { maximum: 30}
  validates :status, presence: true
end
