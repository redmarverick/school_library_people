require_relative '../trimmer_decorator'

class TestTrim
  def correct_name
    'This is a long name'
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable_instance) { TestTrim.new }
  subject { TrimmerDecorator.new(nameable_instance) }

  describe '#correct_name' do
    context 'when the wrapped object is a Nameable' do
      it 'trims the name to a maximum length of 10 characters' do
        expect(subject.correct_name).to eq('This is a ')
      end
    end

    context 'when the wrapped object is not a Nameable' do
      it 'calls super to delegate to the Decorator implementation' do
        allow(nameable_instance).to receive(:correct_name).and_return('fallback_name')
        expect(subject.correct_name).to eq('fallback_n')
      end
    end
  end
end
