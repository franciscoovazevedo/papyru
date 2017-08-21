class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :status, presence: true
end
