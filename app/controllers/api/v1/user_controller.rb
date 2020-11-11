class Api::V1::UserController < ApplicationController
  
  def create
    new_user = User.create(user_params)
    if new_user.save
      render json: UserSerializer.new(new_user)
    else
      render json: new_user.errors.full_messages.to_sentence, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end