require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'

# Usage examples
student = Student.new('John Doe', 16, 'Mathematics')
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"
puts "Playing hooky: #{student.play_hooky}"

teacher = Teacher.new('Jane Smith', 35, 'Science')
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services?}"

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
