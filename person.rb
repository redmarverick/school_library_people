# person.rb

class Person
  attr_reader :id, :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    "P#{rand(1000..9999)}"
  end

  # Add attr_writer for name and age
  attr_writer :name, :age
end
