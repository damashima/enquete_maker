class Public::QuestionsController < ApplicationController
  def new
    @question = Question.new
    @question_selects = @question.question_selects.build
    
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
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit(:text, question_selects_attributes: [:selected, :question_select_id])

  end
end
