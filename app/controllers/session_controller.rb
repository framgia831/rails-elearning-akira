class SessionController < ApplicationController
  

  def new
    @user = User.new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])

  	if @user && @user.authenticate(params[:session][:password])
  		# Creating the session for user_id
  		log_in @user

  		flash[:notice] = "You have successfully logged in."

		  redirect_back_or @user
	   else
  		flash[:notice] = "You have errors."
  		render 'new'
  	 end
  end

  def destroy
  	log_out

  	flash[:notice] = "You successfully logged out."
  	redirect_to root_url
  end
end