class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    if current_end_user.update(end_user_params)
      flash[:notice] = "編集を完了しました。"
      redirect_to end_users_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が完了しました。"
    redirect_to root_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:name, :email)
  end
end
