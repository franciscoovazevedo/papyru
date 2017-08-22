class Student < User
  belongs_to :mayor
  has_many :studies
end
