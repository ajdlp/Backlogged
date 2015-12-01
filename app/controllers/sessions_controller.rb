class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && User.find_by(username: params[:session][:username]).try(:authenticate, params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combo'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end

private
def user_params
  params.require(:user).permit(:username, :password)
end
