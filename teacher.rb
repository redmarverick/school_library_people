# teacher.rb
require_relative 'person'

class Teacher < Person
  def initialize(name = "Unknown", age = nil, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
