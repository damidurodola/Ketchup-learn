class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def enrolled_courses
    my_courses = @current_user.courses
    json_response(my_courses, :ok)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :first_name,
      :last_name,
      :role,
      :expertise_level,
      :password,
      :password_confirmation
    )
  end
end
