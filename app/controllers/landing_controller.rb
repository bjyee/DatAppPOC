class LandingController < ApplicationController
  before_action :auth_check

  def new
  end
  
  private
  
  def auth_check
    if session[:user_id] != nil
      redirect_to groups_url
    end
  end

end
