require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :people, :books

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def insert_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice2 = gets.chomp.to_i
    case choice2
    when 1
      print 'You want to create a student. Give me the name [Input the name]: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission_input = gets.chomp.upcase
      parent_permission = parent_permission_input == 'Y'
      print 'Give me the age [Input the number for age]: '
      age = gets.chomp.to_i
      age_zero?(age) ? return : create_student(name, age, nil, parent_permission: parent_permission)
    when 2
      print 'You want to create a teacher. Give me the name [Input the name]: '
      name = gets.chomp
      print 'Give me the specialization [Input the specialization]: '
      spec = gets.chomp
      print 'Give me the age [Input the number for age]: '
      age = gets.chomp.to_i
      age_zero?(age) ? return : create_teacher(name, age, spec)
    else
      puts 'Invalid choice. Please try again'
    end
  end

  def insert_book
    print 'You want to create a book. Give me the title [Input the title]: '
    title = gets.chomp
    print 'Give me the author [Input the author]: '
    author = gets.chomp
    create_book(title, author)
    puts "\nBook created successfully\n"
  end

  def age_zero?(age)
    if age.zero?
      puts "Invalid age. Please try again\n"
      true
    else
      false
    end
  end

  def insert_rental
    if @people.empty?
      puts "No people in the app yet. Add some people first to make a rental\n"
      return
    elsif @books.empty?
      puts "No books in the app yet. Add some books first to make a rental\n"
      return
    end

    puts 'Select a book from the following list by number'
    show_books_with_index
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    show_people_with_index
    people_index = gets.chomp.to_i

    print 'Give me the date [Input the date in format YYYY/MM/DD]: '
    date = gets.chomp

    create_rental(date, @books[book_index], @people[people_index])
    puts "\nRental created successfully\n"
  end

  def show_rentals_by_id
    if @people.empty?
      puts 'No people in the app yet'
      puts "\n"
      return
    end

    puts 'Select a person from the following list by index:'
    show_people_with_index
    person_index = gets.chomp.to_i

    person = @people[person_index]

    if person.nil?
      puts "Invalid index. No person found."
      puts "\n"
      return
    end

    rentals = rentals(person.id)
    if rentals.empty?
      puts "No rentals found for #{person.name} (ID: #{person.id})"
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
    puts "\n"
  end

  def create_student(name = 'Unknown', age = nil, classroom = nil, parent_permission: true)
    student = Student.new(name, age, classroom, parent_permission: parent_permission)
    @people << student
  end

  def create_teacher(name = 'Unknown', age = nil, specialization = nil, parent_permission: true)
    teacher = Teacher.new(name, age, specialization, parent_permission: parent_permission)
    @people << teacher
  end

  def show_classrooms_with_index
    @classrooms.each_with_index do |classroom, index|
      puts "#{index}. Classroom Label: #{classroom.label}"
    end
  end

  def create_book(title = nil, author = nil)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date = nil, book = nil, person = nil)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def rentals(person_id)
    @rentals.select { |rental| rental.person.id == person_id }
  end

  def show_books
    if @books.empty?
      puts 'No books in the app yet'
    else
      puts 'List of Books:'
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts "\n"
  end

  def show_people
    if @people.empty?
      puts 'No people in the app yet'
    else
      puts 'List of People:'
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
    puts "\n"
  end

  def show_books_with_index
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def show_people_with_index
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}. [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}. [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}. #{person.name} (#{person.age} years old)"
      end
    end
  end
end
