class AuthController < ApplicationController
  def login
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def userSignedIn
    render json: { logged_in: logged_in? }
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
