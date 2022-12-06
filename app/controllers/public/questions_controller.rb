class Public::QuestionsController < ApplicationController
  def new
    @question = Question.new
    @question_select = @question.question_selects.build
  end

  def create
    @question = Question.new(question_params)
    @question.end_user_id = current_end_user.id
    @question.save
    redirect_to question_params(@question)
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:text, :selected)
  end
end
