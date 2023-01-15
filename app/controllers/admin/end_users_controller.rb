class Admin::EndUsersController < ApplicationController
  before_action :set_search

  def set_search
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:question_selects)
  end

  def index
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_end_user_path(@end_user)
    else
      render 'edit'
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(:name, :email, :is_deleted)
  end
end
