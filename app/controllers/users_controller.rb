class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: encode_token(user), user: user }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index 
    users = User.all
    render json: users
  end

  # def show
  #   # byebug
  #   user = User.find(params["id"])
  #   render json: user
  # end 

  def profile 
    token = request.headers["Authorization"]
    decoded_token = JWT.decode(token, secret, true, { algorithm: 'HS256' })
    user_id = decoded_token[0]["user_id"]
    user = User.find(user_id)
    # byebug
    render json: user
  end 

  def update 
    user = User.find(params["id"])
    user.update(update_user_params)
    render json: user
  end 

  def destroy 
    user = User.find(params["id"])
    user.destroy
  end 
  private 

  def user_params
    params.permit(:username, :password)
  end 

  def update_user_params
    params.permit(:username, :password, :age, :bio, :email, :profile_pic )
  end

end
