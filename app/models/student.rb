class Student < User
  belongs_to :mayor
  has_many :student_subjects
end
