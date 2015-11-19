class WordAnswer < ActiveRecord::Base
	has_many :lesson_words 
	belongs_to :word, inverse_of: :word_answers

	validates :content, presence: true
    validates :word, presence: true

end
