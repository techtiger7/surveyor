require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "hello-world77@me.com") }

  it 'has an email address' do
    expect(subject.email).to eq("hello-world77@me.com")
  end

  it "can have answers added when value is valid answer" do
    question = double(:free_text_question)
    allow(question).to receive(:valid_answer?) { true }
    subject.add_answer(question, "User Answer")
    expect(subject.answers[question]).to eq("User Answer")
    question = double(:rating_question)
    allow(question).to receive(:valid_answer?) { true }
    subject.add_answer(question, 2)
    expect(subject.answers[question]).to eq(2)
  end

  it "does not add answer when value is not valid answer" do
    question = double(:free_text_question)
    allow(question).to receive(:valid_answer?) { false }
    subject.add_answer(question, 2)
    expect(subject.answers[question]).not_to eq(2)
    question = double(:rating_question)
    allow(question).to receive(:valid_answer?) { false }
    subject.add_answer(question, "User Answer")
    expect(subject.answers[question]).not_to eq("User Answer")
  end
end
