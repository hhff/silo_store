class Api::V1::SessionsController < ApplicationController
  respond_to :json

  def show
    render json: {
      session: {
        id: current_user.id,
        email: current_user.email
      }
    }, status: :accepted
  end

  def create
    user = User.find_for_database_authentication(email: params[:session][:email])

    if user && user.valid_password?(params[:session][:password])
      sign_in user

      render json: {
        session: { id: user.id, email: user.email }
      }, status: :created
      
    else

      render json: {
        errors: {
          email: ["invalid email or password"]
        }
      }


    end

  end

  def destroy
    # signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    sign_out current_user
    render json: {}, status: :accepted
  end

end
