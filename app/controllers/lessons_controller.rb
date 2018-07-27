class LessonsController < ApplicationController
  def create
  	category = Category.find(params[:category_id])
  	lesson = current_user.lessons.create(category: category)

  	category.words.each do |word|
  		lesson.lesson_words.create!(word: word)
  	end

  	redirect_to [lesson, lesson.lesson_words.first]
  end

  def show
  	@lesosn = Lesson.find(params[:id])
  end
end
