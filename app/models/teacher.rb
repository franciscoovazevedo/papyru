class Teacher < User
  has_many :studies
  has_many :subjects, through: :studies
end
