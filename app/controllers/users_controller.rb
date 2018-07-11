class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]

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
      log_in @user
      flash[:notice] = "Welcome to English e-learning!"
      redirect_to("/")
    else
      flash[:danger] = "You have errors."
      render("users/new")
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )

      flash[:notice] = "Updated your information successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def correct_user
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:danger] = "You are not allowed here."
        redirect_to root_url
      end
    end
end
