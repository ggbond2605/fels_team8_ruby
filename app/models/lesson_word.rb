class LessonWord < ActiveRecord::Base
	belongs_to :word
	belongs_to :word_answer
	belongs_to :lesson
end
