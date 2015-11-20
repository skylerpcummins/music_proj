class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(*email_and_password)
    if @user
      log_in_user!(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def destroy
    user = current_user

    user.reset_session_token! if user
    session[:session_token] = nil

    redirect_to users_url
  end


  private
  def email_and_password
    [params[:user][:email], params[:user][:password]]
  end

end
