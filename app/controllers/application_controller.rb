class ApplicationController < ActionController::Base
  helper_method :require_login
  helper_method :current_user
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

  def logged_in?
   !!current_user
 end

 def current_user
    @user = User.find_by(id: session[:user_id]) || User.new
  end

   def set_user
    @user = User.find(session[:user_id])
  end
end
