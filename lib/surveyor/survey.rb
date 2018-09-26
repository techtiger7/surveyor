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
    def user_responded?(email:)
      # check all responses and if any contain :email return true
      @responses.any? { |r| r.email == email }
    end

    # Find a response within Survey by email address
    # @param args [Hash] hash containing `:email`
    # @return [Response, nil] Response found or `nil` if no resonse found
    def find_response(email:)
      # store all responses which contain passed in :email
      result = @responses.detect { |r| r.email == email }
      # check response with :email was found and return response or `nil` if none
      result.nil? ? nil : result
    end

    # Tally breakdown of all answers for a particular rating question
    # @param question [RatingQuestion] rating question for which to tally answers
    # @return [Hash] a Hash containing count of each rating for question passed in
    def rating_question_breakdown(question:)
      result = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }
      # check all responses answers for rating questions and increment associated value
      @responses.each do |r|
        r.answers.each do |a|
          result[a.value] += 1 if a.question == question
        end
      end
      result
    end
  end
end
