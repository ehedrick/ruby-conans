# Helper methods defined here can be accessed in any controller or view in the application

module RubyConans
  class App
    module QuestionHelper
      def is_answer_correct?(question_id, answer)
        question = Question.where(id: question_id).first.text
        begin
          proc {
            $SAFE=4
            eval(question) == eval(answer)
          }.call 
        rescue SecurityError 
          puts "ah ah ah, you didn't say the magic word"
          false
        end
      end

      def record_guess
        guess = Guess.new
        guess.text = @request_payload.fetch('answer')
        guess.ip_address = request.ip
        guess.question_id = @question_id
        guess.save
      end
    end

    helpers QuestionHelper
  end
end
