class StudentSubject < ApplicationRecord
  belongs_to :student
  belongs_to :teacher_subject
end
