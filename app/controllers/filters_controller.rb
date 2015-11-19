class FiltersController < ApplicationController
  before_action :logged_in_user

  choosen_word = "SELECT word_answer_id FROM lesson_words where (word_answer_id NOT nil)" 
  def show
    @lesson_words = Lesson.find(params[:id]).lesson_words.choosen_word
  end
end
