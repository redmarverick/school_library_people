class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    "P#{rand(1000..9999)}"
  end

  def can_use_services?
    true
  end

  def correct_name
    @name
  end
end
