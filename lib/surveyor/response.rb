module Surveyor
  class Response

    attr_reader :email, :answers, :segments

    # Constructor for Response
    # @param email [String] email address of user responding
    def initialize(email:, segments:[])
      @email = email
      @answers = []
      @segments = segments
    end

    # Add an answer to the answers Array if valid
    # @param question [Question] instance of Question for which Answer is being added
    # @param value [String, Integer] a String or an Integer based on type of question being answered
    def add_answer(question:, value:)
      raise ArgumentError, "Invalid value for question type" unless question.valid_answer?(value: value)
      @answers << Answer.new(question: question, value: value)
    end

    # Check if the Response instance contains the passed in segment values
    # @param segments [Array of String] an Array of Strings defining the segments to check
    # @return [boolean] true if ALL segments passed in are contained in Response
    def segments_contains?(segments:)
      for segment in segments do
        if !@segments.include?(segment)
          return false
        end
      end
      return true
    end
  end
end
