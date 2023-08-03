require_relative '../decorator'

RSpec.describe Decorator do
  let(:nameable) { instance_double(Nameable) }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'delegates correct_name to the wrapped Nameable object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end
end