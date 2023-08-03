require_relative '../nameable'

RSpec.describe Nameable do
  let(:nameable_instance) { described_class.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable_instance.correct_name }.to raise_error(NotImplementedError, 'You must implement the correct_name method.')
    end
  end
end
