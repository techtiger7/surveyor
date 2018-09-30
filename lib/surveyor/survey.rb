module Surveyor
  # A survey for storing questions and user responses, including answers to
  # these questions
  class Survey
    attr_reader :name
    attr_reader :questions
    attr_reader :responses

    # Constructs the initial values for the Survey instance
    # @param args [Hash] hash containing `:name`
    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    # Add question to the Survey instance questions Array
    # @param question [Question] The Question instance to be added to this Survey
    def add_question(question:)
      raise ArgumentError, "question: must be a Question instance" unless question.is_a?(Question)

      @questions << question
    end

    # Add response to the Survey instance responses Array
    # @param response [Response] The Response instance to be added to this Survey
    def add_response(response:)
      raise ArgumentError, "response: must be a Response instance" unless response.is_a?(Response)

      @responses << response
    end

    # Check if user has already responsed to this survey
    # @param email [String] String representation of an email address
    # @return [Boolean] true if user has responded, false if not
    def user_responded?(email:)
      @responses.any? { |r| r.email == email }
    end

    # Find a response within Survey by email address
    # @param email [String] String representation of an email address
    # @return [Response, nil] Response found or `nil` if no resonse found
    def find_response(email:)
      result = @responses.detect { |r| r.email == email }
      result
    end

    # Tally breakdown of all answers for a particular rating question
    # @param rating_question [RatingQuestion] rating question for which to tally answers
    # @return [Hash] a Hash containing count of each rating value for question passed in
    def rating_question_tally(rating_question:)
      result = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }
      @responses.each do |r|
        r.answers.each do |a|
          result[a.value] += 1 if a.question == rating_question
        end
      end
      result
    end
  end
end
