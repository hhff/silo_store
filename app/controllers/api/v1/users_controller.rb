class Api::V1::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      respond_with user
    end
  end

  def show
    if user_signed_in?
      respond_with current_user
    else
      render json: {errors: {email:["No Current User Session"]}}
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
