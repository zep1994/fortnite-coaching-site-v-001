class UsersController < ApplicationController

  def show
    if session[:user_id] == params[:id].to_i
      set_user
    else
      redirect_to root_path
    end
  end

  def index
    set_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_meetings_path(@user, @meetings)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end

end
