module Surveyor
  class Response
    attr_reader :email # a String holding user email value
    attr_reader :answers # an Array of Answer
    def initialize(args)
      @email = args[:email]
      @answers = []
    end
    def add_answer(args)
      answer = args[:answer]
      if answer.question.valid_answer?(answer.value)
        @answers << answer
      end
    end
  end
end