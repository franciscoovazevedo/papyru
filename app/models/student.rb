class Student < ApplicationRecord
  belongs_to :mayor
  has_many :student_subjects
end
