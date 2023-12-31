# spec/solver_spec.rb

require_relative '../solver'

describe Solver do
  let(:solver) { Solver.new }

  describe "#factorial" do
    it "returns 1 when given 0" do
      expect(solver.factorial(0)).to eq(1)
    end

    it "returns the correct factorial for positive integers" do
      expect(solver.factorial(1)).to eq(1)
      expect(solver.factorial(3)).to eq(6)
      expect(solver.factorial(4)).to eq(24)
      expect(solver.factorial(5)).to eq(120)
    end

    it "raises an exception for negative integers" do
      expect { solver.factorial(-1) }.to raise_error(ArgumentError, "Only accepts 0 and positive integers")
    end
  end

  describe "#reverse" do
    it "returns the reversed word" do
      expect(solver.reverse("hello")).to eq("olleh")
      expect(solver.reverse("abcd")).to eq("dcba")
      expect(solver.reverse("12345")).to eq("54321")
    end
  end

  describe "#fizzbuzz" do
    it "returns 'fizzbuzz' when the number is divisible by both 3 and 5" do
      expect(solver.fizzbuzz(15)).to eq("fizzbuzz")
    end

    it "returns 'fizz' when the number is divisible by 3" do
      expect(solver.fizzbuzz(9)).to eq("fizz")
    end

    it "returns 'buzz' when the number is divisible by 5" do
      expect(solver.fizzbuzz(20)).to eq("buzz")
    end

    it "returns the number as a string for other cases" do
      expect(solver.fizzbuzz(7)).to eq("7")
    end
  end
end
