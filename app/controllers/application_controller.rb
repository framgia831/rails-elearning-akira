class ApplicationController < ActionController::Base
    
  include SessionHelper

  def require_login
    unless logged_in?
        store_location
        flash[:notice] = "Please log in."
        redirect_to login_url
    end
  end
end
