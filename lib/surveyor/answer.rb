module Surveyor
  # A class for storing answer values, and linking them to their associated questions
  class Answer
    attr_reader :question # a Question Object instance
    attr_reader :value # the value of the user answer provided

    # Constructs the Answer based on passed in value and links to question
    # @param value [String, Integer] The value of the answer provided by the user
    # @param question [Question] Question for which Answer value is being given
    def initialize(value:, question:)
      @value = value
      @question = question
    end
  end
end
