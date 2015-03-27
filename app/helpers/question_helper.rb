# Helper methods defined here can be accessed in any controller or view in the application

module RubyConans
  class App
    module QuestionHelper
      def is_answer_correct?(question_id, answer)
        question = Question.where(id: question_id).first
        begin
          proc {
            $SAFE=4
            question.matches? answer
          }.call 
        rescue SecurityError 
          #puts 'ah ah ah, you didn't say the magic word'
        end
      end
    end

    helpers QuestionHelper
  end
end
