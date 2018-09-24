module Surveyor
  # Class defining the structure of a Question
  # including its title
  class Question
    attr_reader :title
    # Constructor for Question instances
    # params:
    # +args+:: hash containing {title: '_value_::'}
    def initialize(title:)
      @title = title
    end
  end
end
