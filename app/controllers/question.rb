RubyConans::App.controllers :question do
  get :index, map: '/questions/:language', provides: [:js] do
    questions = Question.where(language: params[:language].downcase).order(:display_order)
    questions.to_json
  end

  get :with_topic, map: '/questions/:language/:topic', provides: [:js] do
    topic_title = params[:topic].downcase
    @questions = Question.where(language: params[:language].downcase).order(:questions__display_order).graph(Topic.where(title: topic_title), {id: :topic_id}, {join_type: :inner})
    render 'question/with_topic'
  end

  post :answer, with: :question_id, provides: [:js] do
    @request_payload = JSON.parse request.body.read
    @question_id = params[:question_id]
    record_guess
    is_answer_correct?(@question_id, @request_payload.fetch('answer')).to_json
  end
end
