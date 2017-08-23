class Student < User
  belongs_to :mayor
  has_many :studies
  has_many :subjects, through: :studies
end
