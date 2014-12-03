class SessionsController < ApplicationController

  def new
  end

  def create
    respond_to do |format|
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to groups_url, :notice => "Logged in!"
      else
        format.html { render :inline => 'Invalid Email or Password'}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
