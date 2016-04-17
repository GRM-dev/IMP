class SessionsController < ApplicationController
  def new
    @notice = params[:notice]
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:last_login] = @user.last_login
      session[:last_ip] = @user.last_ip
      @user.touch(:last_login)
      @user.update_attribute(:last_ip, request.remote_ip)
      redirect_to root_path
    else
      redirect_to root_path, alert: "Bad mail/password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
