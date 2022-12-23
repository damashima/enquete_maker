class Public::AnswersController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params)
    redirect_to question_params(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:end_user_id, :question_id, :question_select_id, :selected)
  end
end
