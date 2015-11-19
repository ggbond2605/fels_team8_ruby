class LessonsController < ApplicationController
  before_action :logged_in_user

  def show
    @lesson = Lesson.find params[:id] 
  end
    
  def create
    @lesson = current_user.lessons.create lesson
    if @lesson
      redirect_to [@lesson.category, @lesson]
    else
      flash[:danger] = "Invalid"
      redirect_to categories_url
    end
    
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson
      redirect_to filter_path @lesson
    else
      flash[:danger] = "Invalid"
      redirect_to root_url
    end
  end

  private
  def lesson
    params.require(:lesson).permit :category_id, lesson_words_attributes: [:id, :word_answer_id]
  end
end
