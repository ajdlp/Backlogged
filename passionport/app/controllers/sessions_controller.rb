class SessionsController < ApplicationController
  def new
  end

  def create #login, set session
    user = User.find_by(username: params[:session][:username].downcase)
    if user && User.find_by(username: params[:session][:username]).try(:authenticate, params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combo'
      render 'login'
    end
  end

  def destroy #logout, clear session
    log_out
    redirect_to root_url
  end

end

private
def user_params
  params.require(:user).permit(:username, :password)
end
