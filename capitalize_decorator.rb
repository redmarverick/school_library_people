# capitalize_decorator.rb
require_relative 'decorator'
require_relative 'nameable'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    if @nameable.is_a?(Nameable)
      @nameable.correct_name.capitalize
    else
      super
    end
  end
end
