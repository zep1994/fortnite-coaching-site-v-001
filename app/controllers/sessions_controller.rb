class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back to Fortnite Coaching!"
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
