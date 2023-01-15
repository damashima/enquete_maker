class Admin::HomesController < ApplicationController
  before_action :set_search

  def set_search
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects)
  end

  def top
    @questions = Question.page(params[:page])
  end
end
