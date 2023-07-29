require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

book1 = Book.new('Famous in Love', 'Rebecca Serle')
book2 = Book.new('The Night Circus', 'Erin Morgenstern')

classroom1 = Classroom.new('Class A')

student1 = Student.new('Emma', 20, true, classroom1)
student2 = Student.new('Noah', 22, true, classroom1)

rental1 = Rental.new('2023-07-27', book1, student1)
rental2 = Rental.new('2022-06-18', book2, student2)
rental3 = Rental.new('2021-05-09', book2, student1)
rental4 = Rental.new('2020-04-13', book1, student2)

puts 'The classroom1 has these students:'
classroom1.students.each { |student| puts student.name }

puts "The student \"#{rental1.person.name}\" rented \"#{rental1.book.title}\"
by #{rental1.book.author} on #{rental1.date}"
puts "The student \"#{rental2.person.name}\" rented \"#{rental2.book.title}\"
by #{rental2.book.author} on #{rental2.date}"
puts "The student \"#{rental3.person.name}\" rented \"#{rental3.book.title}\"
by #{rental3.book.author} on #{rental3.date}"
puts "The student \"#{rental4.person.name}\" rented \"#{rental4.book.title}\"
by #{rental4.book.author} on #{rental4.date}"
