# Helper methods defined here can be accessed in any controller or view in the application

module RubyConans
  class App
    module QuestionHelper
      def is_answer_correct?(question_id, answer)
        question = Question.where(id: question_id).first.text
        eval(question) == eval(answer)
      end
    end

    helpers QuestionHelper
  end
end
