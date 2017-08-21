class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :student_subjects
end
