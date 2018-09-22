require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject { described_class.new("Hello World", double(:question)) }

  it 'has a value' do
    expect(subject.value).to eq("Hello World")
  end

  it 'has a question' do
    expect(subject.question).not_to be_nil
  end
end

RSpec.describe Surveyor::Answer do
  subject { described_class.new(2, double(:question)) }

  it 'has a number value' do
    expect(subject.value).to eq(2)
  end

end

