class Public::AnswersController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @answer = Answer.new(answer_params)
    @answer.end_user_id = current_end_user.id
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to question_params(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:selected)
  end
end
