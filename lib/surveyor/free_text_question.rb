module Surveyor
  class FreeTextQuestion < Question
    attr_reader :answer
    def valid_answer?(value:)
      value.is_a?(String)
    end
  end
end
