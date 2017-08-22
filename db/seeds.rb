# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
subject = ["Math", "Italian", "Portuguese", "Spanish", "Ruby", "Java", "Algebra"]
subject.each { |subject| Subject.create(name: subject, acronym: fromMayorToAcronym(subject)) }
# Create the Mayors
major =  ["Informatic Engineer", "Business and Computer Science", "Data Engineering", "Psycology", "Finance and Strategy", "Sports Manangement"]
major.each { |mayor| Mayor.create(name: mayor, acronym: fromMayorToAcronym(mayor)) }

# generating a random phone number
def random_phone_numbers
  phone_number = "9"
  8.times do
    phone_number += rand(0..9).to_s
  end
  phone_number
end

# generating a random school number for students
def random_student_school_numbers
  school_number = "s"
  5.times do
    school_number += rand(0..9).to_s
  end
  school_number
end

#generating a random school number for teachers
def random_teacher_school_numbers
  school_number = "t"
  5.times do
    school_number += rand(0..9).to_s
  end
  school_number
end

# #generating a 15 random students
15.times do
  name = Faker::FamilyGuy.character
  Student.create(name: name, email: name.delete(' ') + "@papyru.com", password: "123456", address: Faker::Address.street_address, phone_number: random_phone_numbers, school_number: random_student_school_numbers, mayor: Mayor.first)
end

# #generating a 5 random teachers
5.times do
  name = Faker::Pokemon.name
  Teacher.create(name: name, email: name.delete(' ') + "@papyru.com", password: "123456", address: Faker::Address.street_address, phone_number: random_phone_numbers, school_number: random_teacher_school_numbers)
end

