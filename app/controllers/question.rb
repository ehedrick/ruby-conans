RubyConans::App.controllers :question do
  get :index, map: '/questions/:language', provides: [:js] do
    questions = Question.where(language: params[:language].downcase)
    questions.to_json
  end

end
