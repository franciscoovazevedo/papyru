class Mayor < ApplicationRecord
  has_many :mayor_subjects
  has_many :subjects, through: :mayor_subjects
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :acronym, presence: true
  validates :acronym, length: { maximum: 5 }
end
