class Subject < ApplicationRecord
  has_many :studies
  has_many :teachers, through: :studies
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :acronym, presence: true
  validates :acronym, length: { maximum: 5 }
end
