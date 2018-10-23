class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @student = @meeting.students.build(student_params)
    @student.save
    redirect_to meeting_path(@meeting)
  end

  private

    def student_params
      params.require(:student).permit(:name, :meeting_id)
    end
end
