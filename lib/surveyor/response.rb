module Surveyor
  class Response
    attr_reader :email # a String holding user email value
    attr_reader :answers # an Array of Answer
    def initialize(email:)
      @email = email
      @answers = []
    end
    def add_answer(answer:)
      if answer.question.valid_answer?(value: answer.value)
        @answers << answer
      end
    end
  end
end