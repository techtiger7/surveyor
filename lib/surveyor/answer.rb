module Surveyor
  class Answer
    attr_reader :question
    attr_reader :value
    def initialize(value, question)
      @value = value
      @question = question
    end
  end
end