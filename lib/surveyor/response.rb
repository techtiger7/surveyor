module Surveyor
  class Response
    attr_reader :email
    attr_reader :answers
    def initialize(args)
      @email = args[:email]
      @answers = {}
    end
    def add_answer(question, value)
      if question.valid_answer?(value)
        @answers[question] = value
      end
    end

  end
end