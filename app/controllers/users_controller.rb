class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )
    	if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to English e-learning!"
        redirect_to("/users/#{@user.id}")
      else
        render("users/new")
      end
    end
end
