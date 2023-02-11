class Admin::QuestionsController < ApplicationController
  before_action :set_search

  def set_search
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_root_path
  end

  private
  def question_params
    params.require(:question).permit(
      :text,
      question_selects_attributes: [:selected])
  end
end
