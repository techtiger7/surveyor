module Surveyor
  class RatingQuestion < Question
    def valid_answer?(rating)
      1 <= rating && rating <= 5
    end
  end
end
