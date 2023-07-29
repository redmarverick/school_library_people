# decorator.rb

class Decorator < Nameable
    def initialize(nameable)
      super(nameable)
  
    def correct_name
      @nameable.correct_name
    end
  end
  