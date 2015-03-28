RubyConans::App.controllers :question do
  get :index, map: '/questions/:language', provides: [:js] do
    questions = Question.where(language: params[:language].downcase)
    questions.to_json
  end

  post :answer, with: :question_id, provides: [:js] do
    @request_payload = JSON.parse request.body.read
    @question_id = params[:question_id]
    record_guess
    is_answer_correct?(@question_id, @request_payload.fetch('answer')).to_json
  end
end
