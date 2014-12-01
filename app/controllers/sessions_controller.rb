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
        # flash.now.alert = "Invalid email or password"
        # redirect_to root_url, :flash => { :login_error => "Invalid email or password" }
        format.html { redirect_to root_url, :flash => { :login_error => "Invalid email or password" } }
        # format.js   { render :js => dat.ui.openLogin(); }
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
