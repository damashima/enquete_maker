class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Question.ransack(params[:q])
    @search_questions = @search.result
  end
end
