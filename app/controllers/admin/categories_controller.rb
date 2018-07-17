class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    @category = Category.create(
          title: params[:title],
          description: params[:description]
      )
      if @category.save
          flash[:notice] = "You have successfully created."
          redirect_to("/admin/categories")
      else
          flash[:danger] = "You have errors."
          render("new")
      end
  end
end
