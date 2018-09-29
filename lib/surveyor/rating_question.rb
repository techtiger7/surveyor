module Surveyor
  # Class extends Question for Rating based questions on a scale of 1 to 5
  class RatingQuestion < Question
    # Check if passed in value is an Integer between 1 and 5 (inclusive)
    # @param value [Integer] value to check
    # @return [Boolean] true if valid, false if not
    def valid_answer?(value:)
      value >= 1 && value <= 5
    end
  end
end
