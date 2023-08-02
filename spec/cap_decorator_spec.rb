require_relative '../capitalize_decorator'

class TestNameable
  def correct_name
    'john doe'
  end
end

RSpec.describe CapitalizeDecorator do
  let(:nameable_instance) { TestNameable.new }
  subject { CapitalizeDecorator.new(nameable_instance) }

  describe '#correct_name' do
    context 'when the wrapped object is a Nameable' do
      it 'capitalizes the name using the wrapped Nameable object' do
        expect(subject.correct_name).to eq('john doe')
      end
    end

    context 'when the wrapped object is not a Nameable' do
      it 'calls super to delegate to the Decorator implementation' do
        allow(nameable_instance).to receive(:correct_name).and_return('fallback_name')
        expect(subject.correct_name).to eq('fallback_name')
      end
    end
  end
end
