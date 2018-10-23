class ApplicationController < ActionController::Base
  before_action :current_user
  

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  helper_method :current_user
   def logged_in?
    !!current_user
  end

end
