class Admin::WordAnswersController < ApplicationController
	before_action :require_admin

	def require_admin
		unless current_user.admin?
			redirect_to root_path
		end
	end
	def index
		@answers = WordAnser.all
	end

  	def new
  		@word = Word.find(params[:word_id])
 	end

 	def create
 		@word = Word.find(params[:word_id])
 		word_answers = params[:word_answers]

 		word_answers.each do |word_answer|
 			@word.word_answers.build(word_answer)
 		end
 
 		if @word.save
      		flash[:notice] = "You have successfully created."
      		redirect_to("/admin/categories/#{@category.id}/words/#{@word.id}/word_answers")
    	else
      		flash[:danger] = "You have errors."
      		render("new")
    	end
 	end
end
