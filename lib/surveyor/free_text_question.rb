module Surveyor
  class FreeTextQuestion < Question
    attr_reader :answer
    
    def valid_answer?(answer)
      answer.is_a?(String)
    end
  end
end
