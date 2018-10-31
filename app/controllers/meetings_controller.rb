class MeetingsController < ApplicationController

   def index
     if current_user.id == params[:user_id].to_i
    set_user
      @user = User.find(params[:user_id])
      @meetings = @user.meetings
   else
redirect_to root_path
   end
  end

   def show
     if current_user.id == params[:user_id].to_i
    set_user
    @meeting = Meeting.find(params[:id])

  else
    redirect_to root_path
  end
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
