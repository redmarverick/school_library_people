require_relative 'app'

@app = App.new

def main(app = nil)
  app.load_data_from_json
  loop do
    menu
    choice = gets.chomp.to_i
    case choice
    when 1
      app.show_books
    when 2
      app.show_people
    when 3
      app.insert_person
    when 4
      app.insert_book
    when 5
      app.insert_rental
    when 6
      app.show_rentals_by_id
    when 7
      app.save_data_to_json
      break
    else
      puts 'Invalid choice. Please try again'
    end
  end
end

def menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  print "\nEnter your choice: "
end

puts 'Welcome to School Library App!'
main(@app)
