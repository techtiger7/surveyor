module Surveyor
  # A class for storing answer values, and linking them to their associated question
  class Answer
    attr_reader :question
    attr_reader :value

    # Constructs the Answer based on passed in value and links to question
    # @param value [String, Integer] The value of the answer provided by the user
    # @param question [Question] Question for which Answer value is being given
    def initialize(value:, question:)
      raise ArgumentError, "Not a valid Question instance" unless question.is_a?(Question)

      raise ArgumentError, "Argument value/question mismatch" unless question.valid_answer?(value: value)

      @value = value
      @question = question
    end
  end
end
