class SessionsController < ApplicationController
  def new
  end

  def create #login, set session
    user = User.find_by(user_params)
    if user && user.authenticate([:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combo'
      render 'new'
    end
  end

  def destroy #logout, clear session

  end

end

private
def user_params
  params.require(:user).permit(:username, :password)
end
