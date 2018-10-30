class MeetingsController < ApplicationController
  before_action :authentication_required
  before_action :require_login, only: [:index, :show]

  def index
    #check params id
    if current_user.id == params[:user_id].to_i
    @meetings = @user.meetings
  else
    redirect_to root_path
  end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @student = Student.new
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @user = current_user
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to user_meeting_url(@user, @meeting)
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
      redirect_to user_meeting_path(@meeting)
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

  def authenticate_user
    if current_user.id == params[:id].to_i
    else
      redirect_to root_path
    end

  end

end
