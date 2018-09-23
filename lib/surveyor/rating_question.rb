module Surveyor
  # Class extends Question for Rating based
  # questions, validating that answer is between
  # 1 and 5 (inclusive)
  class RatingQuestion < Question
    # Method for validating rating is between 1 and 5
    # (inclusive)
    # params:
    # +rating_value+:: number to check
    def valid_answer?(rating_value)
      rating_value >= 1 && rating_value <= 5
    end
  end
end
