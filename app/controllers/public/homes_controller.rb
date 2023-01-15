class Public::HomesController < ApplicationController
  before_action :set_search

  def set_search
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects)
  end

  def top
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects).page(params[:page])
  end

  def about
  end
end
