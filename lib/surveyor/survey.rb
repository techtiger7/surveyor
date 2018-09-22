module Surveyor
  class Survey
    attr_reader :name
    attr_reader :questions
    attr_reader :responses

    # Constructor for Survey instance
    # Input: a single hash containing {name: "value"}
    def initialize(args)
      @name = args[:name] #extract value from name and store as instance variable
      @questions = Array.new
      @responses = Array.new
    end

    # Add question to the Survey instance questions Array
    def add_question(question)
      @questions << question
    end

    # Add response to the Survey instance responses Array
    def add_response(response)
      @responses << response
    end
  end
end
