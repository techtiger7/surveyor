require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "hello-world77@me.com") }

  it 'has an email address' do
    expect(subject.email).to eq("hello-world77@me.com")
  end

  # it "can have answers to FreeTextQuestion added when value is valid String" do
  #   question = Surveyor::FreeTextQuestion.new(title: "Hello World")
  #   answer = Surveyor::Answer.new("User Answer", question)
  #   subject.add_answer(answer: answer)
  #   expect(subject.answers[0].value).to eq("User Answer")
  # end

  # it "can have answers to RatingQuestion added when value is valid Integer" do
  #   question = double(:free_text_question)
  #   answer = double(:answer, :value => "User Answer")
  #   subject.add_answer(answer: answer)
  #   allow(question).to receive() 
  #   expect(subject.answers[0].value).to eq(2)
  # end

  # it "passes a negative message expectation to when FreeTextQuestion answer value is not valid String" do
  #   question = Surveyor::FreeTextQuestion.new(title: "Hello World")
  #   answer = Surveyor::Answer.new(2, question)
  #   subject.add_answer(answer: answer)
  #   expect(subject.answers[0].value).to eq("User Answer")
  # end

  # it "can be asked for a list of answers" do
  #   question = double(:free_text_question)
  #   allow(question).to receive(:valid_answer?) { true }
  #   subject.add_answer(question, "User Answer")
  #   expect(subject.get_answers()).to eq(["User Answer"])
  # end
end
