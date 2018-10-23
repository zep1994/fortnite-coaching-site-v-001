class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: "Welcome back to Fortnite Coaching!"
  else
    redirect_to signin_path
  end

end
