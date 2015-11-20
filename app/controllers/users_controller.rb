class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password=(params[:user][:password])

    if @user.save
      log_in_user!(@user)
      # Use a redirect
      render :show
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
