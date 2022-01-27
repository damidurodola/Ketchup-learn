class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :destroy]
  before_action :authorized, only: [:create, :edit, :destroy]
  # GET /todos
  def index
    # @courses = Course.all
    json_response(@current_user.courses)
  end

  def show
    @my_course = UserCourse.where(user_id: current_user.id, course_id: @course.id)
    if !@my_course.empty?
      json_response(@my_course.map(&:course))
    else
      json_response(
        'You can only see your enrolled course'
      )
    end
  end

  def enroll
    @course = Course.find(params[:id])
    if @course.expertise == current_user.expertise_level
      @course.user_courses.create(
        user_id: current_user.id,
        course_id: @course.id
      )
      json_response(@course, :ok)
    else
      json_response(
        'You can only enroll for course based on your expertise'
      )
    end
  end

  def create
    @course = Course.new(course_params)
    @course.created_by = current_user.id
    @course.save!
    json_response(@course, :created)
  end

  def edit
    @course.update(course_params)
    head :no_content
  end

  def destroy
    @course.destroy
    head :no_content
  end

  private

  def course_params
    # whitelist params
    params.permit(:title, :expertise)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def authorized
    raise AuthorizationError unless current_user.admin? || current_user.author?
  end

  def not_authorized
    UserCourse.where(user_id: current_user.id)
  end

end
