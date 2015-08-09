class WordsController < ApplicationController

	def index

	end

	def show
		p params
		@word = Word.get_a_word
		render :json => {ugh: @word}
	end

end
