class CoursesController < ApplicationController
  # GET /todos
  def index
    @courses = Course.all
    json_response(@courses)
  end

  private

  def course_params
    # whitelist params
    params.permit(:title, :expertise, :created_by)
  end

end
