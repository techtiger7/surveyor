module Surveyor
  # A survey for storing questions and user responses, including answers to 
  # these questions
  class Survey
    attr_reader :name # a String 
    attr_reader :questions # an Array of Question
    attr_reader :responses # an array of Response

    # Constructs the initial values for the Survey instance
    #
    # @param args [Hash] hash containing `:name`
    def initialize(name:)
      @name = name # extract value from name and store as instance variable
      @questions = [] # set questions to empty Array
      @responses = [] # set resonses to an empty Array
    end

    # Add question to the Survey instance questions Array
    def add_question(question:)
      @questions << question
    end

    # Add response to the Survey instance responses Array
    def add_response(response:)
      @responses << response
    end
    # Check if user has already responsed to this survey
    # @param args [Hash] hash containing `:email` 
    def has_user_responded(email:)
      # check all responses and if any contain :email return true
      @responses.any? { |r| r.email == email }
    end

    # Find a response within Survey by email address
    # @param args [Hash] hash containing `:email` 
    def find_response(email:)
      # store all responses which contain passed in :email
      result = @responses.detect { |r| r.email == email }
      # check response with :email was found and return response or `nil` if none
      (result.nil?) ? nil : result.email
    end

    # Tally breakdown of all answers for a particular rating question
    # @param question [RatingQuestion] rating question for which to tally answers
    def rating_question_breakdown(question:)
      # initial result Hash to build on
      result = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      # check all responses answers for rating questions and increment associated value selected
      @responses.each { |r| r.answers.each { |a| if(a.question == question) then result[a.value] += 1 end } }
      return result
    end
  end
end
