class MeetingsController < ApplicationController
#  before_action :require_login, only: [:index, :show]

  def index
    #check params id
    if current_user.id == params[:user_id].to_i
    @meetings = Meeting.all
  else
    redirect_to root_path
  end
  end

  def show
    if session[:user_id] == params[:id].to_i
    @meeting = Meeting.find(params[:id])
    @student = Student.new
  end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    binding.pry
    @user = current_user
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to user_meeting_url(@user, @meetings)
    else
      @meetings = Meeting.all
      render :new
    end
  end

  def edit
    @user = current_user
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to user_meeting_path(@user, @meetings)
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to user_meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(
      :name,
      :time,
      :type_player
    )
  end


  def require_login
     return head(:forbidden) unless session.include? :user_id
  end

end
