RubyConans::App.controllers :question do
  get :index, map: '/questions/:language', provides: [:js] do
    questions = Question.where(language: params[:language].downcase)
    questions.to_json
  end

  post :answer, with: :question_id, provides: [:js] do
    is_answer_correct?(params[:question_id], JSON.parse(request.body.read).fetch('answer')).to_json
  end
end
