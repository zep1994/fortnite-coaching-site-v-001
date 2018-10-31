class SessionsController < ApplicationController

  def new

  end

  def create
    if auth_hash = request.env["omniauth.auth"]
        #log in omniauth

        oauth_email = request.env["omniauth.auth"]["email"]
        if @user = User.find_by(:email => oauth_email)
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome back to Fortnite Coaching!"

        else
          user = User.new(:email => oauth_email)
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Welcome back to Fortnite Coaching!"
          else
            redirect_to root_path
          end
        end
    else
      @user = User.find_by(email: params[:email])
      if @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome back to Fortnite Coaching!"
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
