class Public::QuestionSelectsController < ApplicationController
  def index
    @question_selects = QusetionSelect.all
  end

  def new
    @question = Queston.new
  end

  def create
    @question = Queston.new(question_params)
    if @question.save
      redirect_to new_question_path
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(question_selects_attributes: :selected)
    end
end
