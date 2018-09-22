require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  it "can find a survey response by email address" do
    response = double("Response", :email => "hello_world@mail.com")
    allow(response).to receive(:valid_answer?) { false }
    subject.add_response(response)
    expect(subject.find_response("hello_world@mail.com")).to eq(response)
end
