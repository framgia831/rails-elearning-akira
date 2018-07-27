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
          flash[:notice] = "You have errors."
          render("new")
      end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Delete category successfully."
    redirect_to("/admin/categories")
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(title: params[:title])
      flash[:notice] = "Updated your category successfully."
      redirect_to("/admin/categories")
    else
      render 'edit'
    end
  end


end
