class UserLoginDetailsController < ApplicationController
  def index
    @user_login_details = UserLoginDetail.page(params[:page]).per(10)
  end

  def show
    @user_login_detail = UserLoginDetail.find(params[:id])
  end
end
