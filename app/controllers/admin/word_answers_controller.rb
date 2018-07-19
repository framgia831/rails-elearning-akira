class Admin::WordAnswersController < ApplicationController
    before_action :require_admin

    def require_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end
    def index
        @category = Category.find(params[:category_id])
        @word = Word.find(params[:word_id])
        @answers = @word.word_answers
    end

    def new
        @word = Word.find(params[:word_id])
        4.times {@word.word_answers.build}
    end

    def edit
        @category = Category.find(params[:category_id])
        @word = Word.find(params[:word_id])
        @answer = WordAnswer.find(params[:id])
    end

    def update
        @category = Category.find(params[:category_id])
        @word = Word.find(params[:word_id])
        @answer = WordAnswer.find(params[:id])
        if @answer.update_attributes(content: params[:content])
            flash[:notice] = "Updated your option successfully."
            redirect_to("/admin/categories/#{@category.id}/words/#{@word.id}/word_answers")
        else
            render 'edit'
        end
    end

    def create
        @word = Word.find(params[:word_id])
        @word.assign_attributes(word_params)
 
        if @word.save
            flash[:notice] = "You have successfully created."
            redirect_to admin_category_word_word_answers_path(@word.category, @word)
        else
            flash[:danger] = "You have errors."
            render("new")
        end
    end

    private
    def word_params
        params.require(:word).permit(word_answers_attributes: [:content, :correct])
    end
end
