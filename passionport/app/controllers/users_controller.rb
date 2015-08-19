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
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    render 'show'
  end



end

private
def user_params
  params.require(:user).permit(:username, :password, :email, :name) #d
end
