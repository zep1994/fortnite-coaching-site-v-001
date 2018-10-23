class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:name])
    session[:user_id] = user.id
    redirect_to user_path(user), notice: "Welcome back to Fortnite Coaching!"
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
