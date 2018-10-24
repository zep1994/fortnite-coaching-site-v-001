class ApplicationController < ActionController::Base
  helper_method :require_login
   def welcome
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

   private
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

   def set_user
    @user = User.find(session[:user_id])
  end
end
