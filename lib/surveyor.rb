require "surveyor/question"
require "surveyor/free_text_question"
require "surveyor/rating_question"
require "surveyor/survey"
require "surveyor/version"
require "surveyor/answer"
require "surveyor/response"

module Surveyor
  # my_survey = Survey.new(name: "Test Survey")
  # puts my_survey.name
  # my_question = RatingQuestion.new(title: "Question 1")
  # my_survey.add_question(my_question)
  # my_response = Response.new(email: "hello_world@mail.com")
  # my_answer = Answer.new(2, my_question)
  # my_response.add_answer(answer: my_answer)
  # my_survey.add_response(my_response)
  # puts my_survey.rating_question_breakdown(my_question)
  
  # survey1 = Surveyor::Survey.new(name: "Test")
  # response1 = Surveyor::Response.new(email: "hello_world@mail.com")
  # response2 = Surveyor::Response.new(email: "mail@hello_world.com")
  # question1 = Surveyor::RatingQuestion.new(title: "Question 1")
  # answer1 = Surveyor::Answer.new(1, question1)
  # answer2 = Surveyor::Answer.new(4, question1)
  # response1.add_answer(answer: answer1)
  # response2.add_answer(answer: answer2)
  # survey1.add_response(response1)
  # survey1.add_response(response2)
  # survey1.add_question(question1)
  # puts survey1.rating_question_breakdown(question1)
  
end
