module Surveyor
  class Survey
    attr_reader :name # a String 
    attr_reader :questions # an Array of Question
    attr_reader :responses # an array of Response

    # Constructor for Survey instance
    # Input: a single hash containing {name: "value"}
    def initialize(args)
      @name = args[:name] # extract value from name and store as instance variable
      @questions = []
      @responses = []
    end

    # Add question to the Survey instance questions Array
    def add_question(question)
      @questions << question
    end

    # Add response to the Survey instance responses Array
    def add_response(response)
      @responses << response
    end

    def has_user_responded(args)
      @responses.any? { |r| r.email == args[:email] } # return true any response has passed in email
    end

    def find_response(args)
      result = @responses.detect { |r| r.email == args[:email] }
      (result.nil?) ? nil : result.email # return nil no matches, else return email value
    end

    def rating_question_breakdown(question)
      result = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      @responses.each { |r| r.answers.each { |a| if(a.question == question) then result[a.value] += 1 end } }
      return result
    end
  end
end
