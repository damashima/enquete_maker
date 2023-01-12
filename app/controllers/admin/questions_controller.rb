class Admin::QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_question_path
  end

  private
  def question_params
    params.require(:question).permit(
      :text,
      question_selects_attributes: [:selected])
  end
end
