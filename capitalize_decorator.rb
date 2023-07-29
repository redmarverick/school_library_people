# capitalize_decorator.rb

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
