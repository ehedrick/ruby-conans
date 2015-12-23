# Helper methods defined here can be accessed in any controller or view in the application

module RubyConans
  class App
    module QuestionHelper
      def judge_anser(question_id, answer)
        question = Question.where(id: question_id).first.text

        return "invalidAnswer" if remove_common_substitutions(question) == remove_common_substitutions(answer)

        begin
          proc {
            # TODO this needs looked at since it was removed in ruby 2.1 perhaps replace with https://github.com/tario/shikashi
            # $SAFE=4
            eval(question) == eval(answer)
          }.call
        rescue Exception
          "insecureAnswer"
        end
      end

      def record_guess
        guess = Guess.new
        guess.text = @request_payload.fetch('answer')
        guess.ip_address = request.ip
        guess.question_id = @question_id
        guess.save
      end

      def remove_common_substitutions(item)
        item.gsub(/'/, '"').gsub(/\(|\)/, '').gsub(" ", '')
      end
    end

    helpers QuestionHelper
  end
end
