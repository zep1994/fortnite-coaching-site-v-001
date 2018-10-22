class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
  end

end
