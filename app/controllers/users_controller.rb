class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
    
  def show
    @user = User.find_by_id(params[:id]) # <== This is the important line!
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
