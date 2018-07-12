class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users =  User.paginate(page: params[:page], per_page: 15)
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

  def following
    @user = User.find(params[:id])
    @users = @user.following
    @title = "Following"
    render 'show_follow'
    # @users = @user.following
        # @microposts = Micropost.where("user_id IN (?)", current_user.following_ids)
        #                               .paginate(page: params[:page], per_page: 10)
      # @microposts = current_user.feed.paginate(page: params[:page])
      # @micropost = current_user.microposts.build
    end

    def followers
      @user = User.find(params[:id])
      @users = @user.followers
      @title = "Follower"
      render 'show_follow'
    end

  private
    def correct_user
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:danger] = "You are not allowed here."
        redirect_to root_url
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:danger] = "You are not allowed to do that."
        redirect_to root_url
      end
      
    end
end
