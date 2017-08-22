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

#
