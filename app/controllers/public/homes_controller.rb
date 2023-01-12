class Public::HomesController < ApplicationController
  def top
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects).page(params[:page])
  end

  def about
  end
end
