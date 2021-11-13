class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id
      render json: user
    else
      render json: { errors: user.errors.full_messages, mes: 'errors' }
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
