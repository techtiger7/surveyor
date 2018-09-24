module Surveyor
  class Response
    attr_reader :email # a String holding user email value
    attr_reader :answers # an Array of Answer

    # Constructor for Response
    # @param email [String] email address of user responding
    def initialize(email:)
      @email = email
      @answers = [] # initialise empty answers Array
    end

    # Add an answer to the answers Array if valid
    # @param answer [Answer] instance of Answer to be added to Response
    def add_answer(answer:)
      # Call against answer.question to utilise correct validation method for question type
      if answer.question.valid_answer?(value: answer.value)
        @answers << answer
      end
    end
  end
end