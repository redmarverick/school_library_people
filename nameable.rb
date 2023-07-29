# nameable.rb

class Nameable
  attr_accessor :nameable

  def correct_name
    raise NotImplementedError, 'You must implement the correct_name method.'
  end
end
