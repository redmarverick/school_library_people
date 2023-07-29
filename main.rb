require_relative 'person'
require_relative 'student'
require_relative 'teacher'

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
