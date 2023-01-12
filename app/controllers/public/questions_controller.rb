class Public::QuestionsController < ApplicationController

  before_action :search

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

  def search
    # params[:q]のqには検索フォームに入力した値が入る
    @q = Question.ransack(params[:q])
  end

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects).page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
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
