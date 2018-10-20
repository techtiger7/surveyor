require "spec_helper"

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  context "add_question" do
    it "can have questions added" do
      question = Surveyor::Question.new(title: "Test Question")
      subject.add_question(question: question)
      expect(subject.questions).to include(question)
    end

    it "does not add passed in question if it is not the correct type" do
      subject.add_question(question: "Invalid type argument")
    rescue ArgumentError
      expect(subject.questions.length).to eq(0)
    end

    it "raises an error when passed in question is not the correct type" do
      expect { subject.add_question(question: "Invalid type argument") }.to raise_error(ArgumentError)
    end
  end

  context "add_responses" do
    response = Surveyor::Response.new(email: "hello_world@mail.com")

    it "can have responses added" do
      subject.add_response(response: response)
      expect(subject.responses).to include(response)
    end

    it "does not add response if passed in response is not the correct type" do
      subject.add_response(response: "Invalid type argument")
    rescue ArgumentError
      expect(subject.responses.length).to eq(0)
    end

    it "raises an error when passed in response is not the correct type" do
      expect { subject.add_response(response: "Invalid type argument") }.to raise_error(ArgumentError)
    end
  end

  context "find_response" do
    it "returns detected response if email has already been used to submit a response" do
      email = "hello_world@mail.com"
      response = Surveyor::Response.new(email: email)
      subject.add_response(response: response)
      expect(subject.find_response(email: email)).to eq(response)
    end

    it "returns `nil` if email has not been used to submit a response" do
      expect(subject.find_response(email: "hello_world@mail.com")).to eq(nil)
    end
  end

  context "user_responded?" do
    it "returns `false` if user with email has not responded to survey yet" do
      expect(subject.user_responded?(email: "hello_world@mail.com")).to eq(false)
    end

    it "returns `true` if user with email has responded to survey" do
      email = "hello_world@mail.com"
      response = Surveyor::Response.new(email: email)
      subject.add_response(response: response)
      expect(subject.user_responded?(email: "hello_world@mail.com")).to eq(true)
    end
  end

  context "rating_question_tally" do
    response1 = Surveyor::Response.new(email: "hello_world@mail.com", segments: %w[Melbourne Male])
    response2 = Surveyor::Response.new(email: "mail@hello_world.com", segments: %w[Sydney Female])
    question1 = Surveyor::RatingQuestion.new(title: "Question 1")
    question2 = Surveyor::RatingQuestion.new(title: "Question 2")
    response1.add_answer(question: question1, value: 1)
    response2.add_answer(question: question1, value: 4)

    it "returns a hash breakdown of results for a rating question" do
      subject.add_response(response: response1)
      subject.add_response(response: response2)
      expect(subject.rating_question_tally(rating_question: question1)).to eq(1 => 1, 2 => 0, 3 => 0, 4 => 1, 5 => 0)
    end

    it "only returns a tally of valid results for relevant rating question and responses containing matching segments" do
      response2.add_answer(question: question2, value: 6)
    rescue ArgumentError
      response2.add_answer(question: question2, value: 5)
      subject.add_response(response: response1)
      subject.add_response(response: response2)
      expect(subject.rating_question_tally(rating_question: question2)).to eq(1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1)
    end

    it "only returns tally of responses which belonging to passed in segments" do
      subject.add_response(response: response2)
      expect(subject.rating_question_tally(rating_question: question2, segments: %w[Melbourne Male])).to eq(1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0)
      expect(subject.rating_question_tally(rating_question: question2, segments: %w[Sydney Female])).to eq(1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 1)
    end
  end
end
