class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @student = @meeting.students.build(student_params)
    if @student.save
      redirect_to meeting_path(@meeting)
    else
      render "meetings/show"
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)

    redirect_to meeting_path(@student.meeting)
  end

  private

    def student_params
      params.require(:student).permit(:name, :meeting_id)
    end
end
