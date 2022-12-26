class Public::QuestionsController < ApplicationController

  def new
    @question = Question.new
    4.times do
      @question.question_selects.build
    end
  end

  def create
    @question = Question.new(question_params)
    @question.end_user_id = current_end_user.id

    @question.save!
    redirect_to question_path(@question)
  end

  def index
    @questions = Question.all.includes(:question_selects)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit(
      :text,
      question_selects_attributes: [:selected])
  end
end
