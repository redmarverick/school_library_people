require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = nil)
    super(name, age)
    @specialization = specialization
  end
end
