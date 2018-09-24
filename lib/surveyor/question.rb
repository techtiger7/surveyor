module Surveyor
  # Class defining the structure of a Question
  # including its title
  class Question
    attr_reader :title # String title of the Question
    
    # Constructor for Question instances
    # @param title [String] the title of the Question
    def initialize(title:)
      @title = title
    end
  end
end
