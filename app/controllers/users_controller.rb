class UsersController < ApplicationController

   def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

   def show
    if session[:user_id] == params[:id].to_i
      set_user
    else
      redirect_to '/'
    end
  end

   def index
    set_user
    if session[:user_id] == params[:id].to_i
    @users = User.all
  else
    redirect_to root_path
  end
  end

   def edit
    if session[:user_id] == params[:id].to_i #can this be dried up?
      set_user
    end
  end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save && @user.id == session[:user_id]
      redirect_to user_path(@user)
    elsif @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

   private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
