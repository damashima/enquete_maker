class Public::AnswersController < ApplicationController
  before_action :authenticate_end_user!

  def create
    @question = Question.find(params[:question_id])
    answer = @question.answers.new(answer_params)
    answer.end_user_id = current_end_user.id
    answer.save!
    redirect_to question_answers_path
  end

  def index
    @question = Question.find(params[:question_id])
    @charts = []

    @question.question_selects.each do | select |
      pp select
      chart = []
      chart[0] = select.selected
      chart[1] = @question.answers.where(question_select_id: select.id).count
      pp chart
      @charts.push(chart)
    end
    pp @charts
  end

  private
  def answer_params
    params.require(:answer).permit(:end_user_id, :question_id, :question_select_id, :selected)
  end
end
