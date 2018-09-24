require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "hello-world77@me.com") }

  it 'has an email address' do
    expect(subject.email).to eq("hello-world77@me.com")
  end

  it "can have answers to FreeTextQuestion added when value is valid String" do
    question = double(:free_text_question)
    expect(question).to receive(:valid_answer?) { true }
    answer = Surveyor::Answer.new(value: "User Answer", question: question)
    subject.add_answer(answer: answer)
    expect(subject.answers[0].value).to eq("User Answer")
  end

  it "can have answers to RatingQuestion added when value is valid Integer" do
    question = double(:rating_question)
    expect(question).to receive(:valid_answer?) { true }
    answer = Surveyor::Answer.new(value: 2, question: question)
    subject.add_answer(answer: answer)
    expect(subject.answers[0].value).to eq(2)
  end

  it "passes a negative message expectation when FreeTextQuestion answer value is not valid String" do
    question = double(:free_text_question)
    answer = Surveyor::Answer.new(value: 2, question: question)
    expect(answer).to_not receive(:question)
  end

  it "can be asked for a list of answers" do
    question = double(:free_text_question)
    allow(question).to receive(:valid_answer?) { true }
    answer = Surveyor::Answer.new(value: "User Answer", question: question)
    subject.add_answer(answer: answer)
    expect(subject.answers).to eq([answer])
  end
end
