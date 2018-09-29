module Surveyor
  # A simple class for storing free text questions, questions with answers which are text-based
  class FreeTextQuestion < Question
    # Checks whether passed in value is a String
    # @param value [String] value to check
    # return [Boolean] true if value is String, otherwise false
    def valid_answer?(value:)
      value.is_a?(String)
    end
  end
end
