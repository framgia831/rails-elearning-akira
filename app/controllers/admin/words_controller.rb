class Admin::WordsController < ApplicationController
	before_action :require_admin

	def require_admin
		unless current_user.admin?
			redirect_to root_path
		end
	end

	def index
		@words = Word.all
	end

	def new
		@category = Category.find(params[:category_id])
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.new(content: params[:content])
    	if @word.save
      		flash[:notice] = "You have successfully created."
      		redirect_to("/admin/categories/#{@category.id}/words")
    	else
      		flash[:danger] = "You have errors."
      		render("new")
    	end
	end
end
