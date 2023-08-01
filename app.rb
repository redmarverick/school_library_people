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
    choice2 = $stdin.gets.chomp.to_i
    case choice2
    when 1
      print 'You want to create a student. Give me the name [Input the name]: '
      begin
        name = gets.chomp
        raise ArgumentError if name.empty? || name.match?(/[^A-Za-z\s]/)
      rescue ArgumentError
        puts 'Invalid input. Please enter a valid name.'
        return
      end
      print 'Has parent permission? [Y/N]: '
      parent_permission_input = gets.chomp.upcase
      if parent_permission_input == 'Y' || parent_permission_input == 'N'
        parent_permission = parent_permission_input == 'Y'
      else
        puts 'Invalid input. Please enter Y or N.'
        return
      end
      print 'Give me the age [Input the number for age]: '
      begin
        age = Integer(gets.chomp)
      rescue ArgumentError
        puts 'Invalid input. Please enter a valid integer.'
        return
      end
      if age < 1
        puts "Invalid age. Please try again\n"
        return
      else
        create_student(name, age, nil, parent_permission: parent_permission)
      end
    
    when 2
      print 'You want to create a teacher. Give me the name [Input the name]: '
      begin
        name = gets.chomp
        raise ArgumentError if name.empty? || name.match?(/[^A-Za-z\s]/)
      rescue ArgumentError
        puts 'Invalid input. Please enter a valid name.'
        return
      end
      print 'Give me the specialization [Input the specialization]: '
      spec = gets.chomp
      print 'Give me the age [Input the number for age]: '
      age = gets.chomp.to_i
      if age.zero?
        puts "Invalid age. Please try again\n"
        return
      else
        create_teacher(name, age, spec)
      end
    else
      puts 'Invalid choice. Please try again'
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
    begin
      book_index = Integer(gets.chomp)
    rescue ArgumentError
      puts 'Invalid input. Please enter a valid integer.'
      retry
    end

    puts 'Select a person from the following list by number (not id)'
    show_people_with_index
    begin
      people_index = Integer(gets.chomp)
    rescue ArgumentError
      puts 'Invalid input. Please enter a valid integer.'
      retry
    end

    print 'Give me the date [Input the date in format YYYY/MM/DD]: '
    begin
      date = Date.parse(gets.chomp)
    rescue ArgumentError
      puts 'Invalid date format. Please enter a valid date in format YYYY/MM/DD.'
      return
    end

    begin
      book = @books.fetch(book_index)
    rescue IndexError
      puts 'Invalid book index. Please try again.'
      return
    end

    begin
      person = @people.fetch(people_index)
    rescue IndexError
      puts 'Invalid person index. Please try again.'
      return
    end

    create_rental(date, book, person)
    puts "\nRental created successfully\n"
  end

  def age_zero?(age)
    if age.zero?
      puts "Invalid age. Please try again\n"
      true
    else
      false
    end
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