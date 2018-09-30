module Surveyor
  class Response
    attr_reader :email
    attr_reader :answers # an Array of Answer

    # Constructor for Response
    # @param email [String] email address of user responding
    def initialize(email:)
      @email = email
      @answers = []
    end

    # Add an answer to the answers Array if valid
    # @param question [Question] instance of Question for which Answer is being added
    # @param value [String, Integer] a String or an Integer based on type of question being answered
    def add_answer(question:, value:)
      raise ArgumentError, "Invalid value for question type" unless question.valid_answer?(value: value)

      @answers << Answer.new(question: question, value: value)
    end
  end
end
