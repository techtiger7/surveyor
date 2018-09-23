module Surveyor
  class Answer
    attr_reader :question # a Question Object instance
    attr_reader :value # the value of the user answer provided
    def initialize(value, question)
      @value = value
      @question = question
    end
  end
end