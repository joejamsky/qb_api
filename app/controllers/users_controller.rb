class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: encode_token(user) }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index 
    users = User.all
    render json: users
  end

  def profile 
    token = request.headers["Authorization"]
    decoded_token = JWT.decode(token, 'secret', true, { algorithm: 'HS256' })
    decoded_token = decoded_token[0][user_id]
    user = User.find(user_id)
    render json: user
  end 
  private 

  def user_params
    params.permit(:username, :password)
  end 

end
