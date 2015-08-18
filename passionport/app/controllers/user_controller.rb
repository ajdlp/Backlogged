class UserController < ApplicationController
  def homepage
  end

  def index
    @user = User.find(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
end

private
def user_params
  params.require(:user).permit(:username, :password)
end
