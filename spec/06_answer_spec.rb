require 'spec_helper'

RSpec.describe Surveyor::Answer do
  subject { described_class.new(value: "Hello World", question: double(:question)) }

  it 'has a value if a String is passed in' do
    expect(subject.value).to eq("Hello World")
  end

  it 'has a question' do
    expect(subject.question).not_to be_nil
  end
end

RSpec.describe Surveyor::Answer do
  subject { described_class.new(value: 2, question: double(:question)) }

  it 'has a number value if an Integer is passed in' do
    expect(subject.value).to eq(2)
  end

end

