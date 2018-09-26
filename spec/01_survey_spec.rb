require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question: question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response: response)
    expect(subject.responses).to include(response)
  end

  it "can detect if a user has already submitted a response" do
    email = "hello_world@mail.com"
    response = Surveyor::Response.new(email: email)
    subject.add_response(response: response)
    expect(subject.find_response(email: email)).to eq(response)
  end

  it "returns nil if a response for passed in email is not found" do
    expect(subject.find_response(email: "hello_world@mail.com")).to eq(nil)
  end

  it "returns `false` if user with email has not responded to survey yet" do
    expect(subject.user_responded?(email: "hello_world@mail.com")).to eq(false)
  end

  it "returns `true` if user with email has responded to survey" do
    email = "hello_world@mail.com"
    response = Surveyor::Response.new(email: email)
    subject.add_response(response: response)
    expect(subject.user_responded?(email: "hello_world@mail.com")).to eq(true)
  end

  it "returns a hash breakdown of results for a rating question" do
    response1 = Surveyor::Response.new(email: "hello_world@mail.com")
    response2 = Surveyor::Response.new(email: "mail@hello_world.com")
    question1 = Surveyor::RatingQuestion.new(title: "Question 1")
    response1.add_answer(question: question1, value: 1)
    response2.add_answer(question: question1, value: 4)
    subject.add_response(response: response1)
    subject.add_response(response: response2)
    expect(subject.rating_question_breakdown(question: question1)).to eql(1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0)
  end
end
