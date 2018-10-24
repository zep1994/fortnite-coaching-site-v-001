class UserMeetingController < ApplicationController

  def create
  set_user
  params[:user_meeting].each do |meeting|
    UserMeeting.find_or_create_by(user_id: @user.id, meeting_id: meeting.last[:meeting_id].to_i)
  end
   redirect_to "/users/#{@user.id}/meetings"
end

 def destroy
  UserMeeting.find(params[:id]).destroy
  set_user
  redirect_to "/users/#{@user.id}/meetings"
end

 def update
  @user_meeting = UserMeeting.find(params[:id])
  @user_time_slot.save
  set_user
  redirect_to "/users/#{@user.id}/meetings"
end

 private
def user_meeting_params
  params.require(:user_meeting).permit(:meeting_id)
end
end
