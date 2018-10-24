class MeetingsController < ApplicationController

   def index
    set_user
    if params[:user_id]
      @user = User.find(params[:user_id])
      @meetings = @user.meetings
   else
     @meetings = Meeting.all
   end
  end

   def show
    set_user
    @meeting = Meeting.find(params[:id])
  end

   def new
    set_user
    if params[:user_id]
      @user_meetings = UserMeeting.new
    else
      @meeting = Meeting.new
    end
  end

   def create
    @meeting = Meeting.create(meeting_params)
    redirect_to meetings_path
  end

   def edit
    set_user
    if params[:user_id]
      @user_meetings = UserMeeting.find_by(user_id: params[:user_id], meeting_id: params[:id])
      @meeting = Meeting.find(params[:id])
    else
      @meeting = Meeting.find(params[:id])
    end
  end

   def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to meetings_path
  end

   private
   def meeting_params
    params.require(:meeting).permit(:name, :time, :type_player)
  end
end
