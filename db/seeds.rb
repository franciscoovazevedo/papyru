def fromMayorToAcronym(mayor)
  result = ""
  if mayor.split(' ').length > 1
    mayor.split(' ').each do |word|
      result += word.first
    end
  else
    result = mayor.split('').first(3).join
  end
  result.upcase!
end

# Seeds - first create the subjects
subject = %w(Ruby JAVA Database\ Basics Software\ Engineer Digital\ Networks Portuguese Italian
   English Math History Psycology\ Introdution Music French Database\ Concepts Economics
   Finance Statistics Marketing Yoga)
subject.each { |subject| Subject.create(name: subject, acronym: "ABC") }
# Create the Mayors
major =  ["Informatic Engineer", "Languages", "Data Enginering", "Psycology", "Finance and Strategy", "Sports Manangement"]
major.each { |mayor| Mayor.create(name: mayor, acronym: fromMayorToAcronym(mayor)) }

# Generating a random phone number
def random_phone_numbers
  phone_number = "9"
  8.times do
    phone_number += rand(0..9).to_s
  end
  phone_number
end

# Generating a random school number for students
def random_student_school_numbers
  school_number = "s"
  5.times do
    school_number += rand(0..9).to_s
  end
  school_number
end

# Generating a random school number for teachers
def random_teacher_school_numbers
  school_number = "t"
  5.times do
    school_number += rand(0..9).to_s
  end
  school_number
end

teachers = %w(Carlos\ Mendes Cyrille\ Labesse Nick\ Major Joao\ Viana Andre\ Bras Mafalda\ Sequeira Andre\ Costa)
students = %w(Francisco\ Azevedo Gabriele\ Canepa Manuel\ Sepulveda)
# Generating a 15 random students

teachers.each { |teacher| Teacher.create(name: teacher, email: teacher.delete(' ') + "@lewagon.com",
                     password: "123456", address: Faker::Address.street_address,
                     phone_number: random_phone_numbers, school_number: random_student_school_numbers)
              }

students.each { |student| Student.create(name: student, email: student.delete(' ') + "@lewagon.com",
                     password: "123456", address: Faker::Address.street_address,
                     phone_number: random_phone_numbers, school_number: random_student_school_numbers,
                     mayor: Mayor.all.sample)
              }
30.times do
  name = Faker::HarryPotter.character
  Student.create(name: name, email: name.delete(' ') + "@papyru.com", password: "123456", address: Faker::Address.street_address, phone_number: random_phone_numbers, school_number: random_student_school_numbers, mayor: Mayor.first)
end

# Generating a 5 random teachers
subject = subject.first(6)
studies = Subject.all.first(6)
students_used_demo = Student.all.first(6)

studies.each do |subject|
  Teacher.all.each { |teacher| Study.create(subject: subject, teacher: teacher)}
  students_used_demo.each { |student| Study.create(subject: subject, student: student)}
end

photos = [
  "http://res.cloudinary.com/flyradical/image/upload/v1504207706/test/13423984_1315779935116832_8274100993163418548_n.jpg",
  "http://res.cloudinary.com/flyradical/image/upload/v1504207741/test/19029697_10155425728567803_1374897217921636789_n.jpg",
  "http://res.cloudinary.com/flyradical/image/upload/v1504207773/test/18556153_1406085619438487_5557006912658018322_n.jpg",
  "http://res.cloudinary.com/flyradical/image/upload/v1504207814/test/185934_1726723059756_2474149_n.jpg",
  nil,
  nil,
  nil,
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/yfnsdqkamwrr1s8mpkfm.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/wlebdl90gtmmbklz7abi.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/auigwptfjhfdaptu8xj0.jpg"
]

photos.each_with_index do |p, i|
  u = USer.find(i-1)
  u.remote_photo_url = p
  if u.save
    puts "Saved #{u.name}'s photo"
  end
end

