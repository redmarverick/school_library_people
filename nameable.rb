# nameable.rb

class Nameable
  def correct_name
    raise NotImplementedError, "Method 'correct_name' must be implemented in subclasses."
  end
end
