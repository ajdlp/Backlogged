class UsersController < ApplicationController
  def index
    @user = User.find(user_params)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to @user
    else
    end
  end

  def show
  end

end

private
def user_params
  params.require(:user).permit(:username, :password, :email, :name) #d
end
