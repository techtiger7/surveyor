require "spec_helper"

RSpec.describe Surveyor::Answer do
  free_text_question = Surveyor::FreeTextQuestion.new(title: "Test Free Text Question")
  rating_question = Surveyor::RatingQuestion.new(title: "Test Rating Question")

  it "is not possible to initialize an answer without a question" do
    subject = described_class.new(value: "Hello World")
  rescue ArgumentError
    expect(subject).to be(nil)
  end

  it "raises an error if attempt made to initialize without question" do
    expect { described_class.new(value: "Hello World") }.to raise_error(ArgumentError)
  end

  it "has a question attribute" do
    subject = described_class.new(question: free_text_question, value: "Hello World")
    expect(subject.question).not_to be_nil
  end

  it "can have a String value if a free text question is passed in" do
    subject = described_class.new(question: free_text_question, value: "Hello World")
    expect(subject.value).to eq("Hello World")
  end

  it "can have an integer value is a rating question is passed in" do
    subject = described_class.new(question: rating_question, value: 2)
    expect(subject.value).to eq(2)
  end

  it "raises an error if passed in value does not match question type" do
    expect { described_class.new(question: free_text_question, value: 2) }.to raise_error(ArgumentError)
    expect { described_class.new(question: rating_question, value: "Hello World") }.to raise_error(ArgumentError)
  end
end
