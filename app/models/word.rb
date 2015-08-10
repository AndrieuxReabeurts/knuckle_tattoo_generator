class Word

  include Mongoid::Document

  store_in collection: "words"

  field :word, type: String
  field :length, type: Integer

  class << self

  	def get_a_word
  		get_random_num
  	end

  	def get_random_num
  		new_rand = Random.new
  		determinant = new_rand.rand(1..8)
  		p determinant
  		get_word(determinant)
  	end

  	def get_word(determinant)
  		first_word_arr = Word.where(length: determinant).to_a
  		second_word_arr = Word.where(length: 8-determinant).to_a

  		words_rand = Random.new

  		if determinant == 8 && 8-determinant == 0
  			eight_letter_word(words_rand, first_word_arr, second_word_arr)
  		else
  			btwn_seven_and_two(words_rand, first_word_arr, second_word_arr)
  		end

  	end

  	def btwn_seven_and_two(words_rand, words1, words2)
			index1 = words_rand.rand(0..words1.length-1)
			index2 = words_rand.rand(0..words2.length-1)
			finalizer(words1, words2, index1, index2)
  	end

  	def eight_letter_word(words_rand, words1, words2)
  		if words1.length == 0
  			index1 = words_rand.rand(0..words1.length)
				index2 = words_rand.rand(0..words2.length-1)
			else
				index1 = words_rand.rand(0..words1.length-1)
				index2 = words_rand.rand(0..words2.length)
			end
			finalizer(words1, words2, index1, index2)
  	end

	  def finalizer(words1, words2, index1, index2)
	  	if words1[index1] == nil 
	  		final_word = "" + words2[index2].word
	  	elsif words2[index2] == nil
	  		final_word = words1[index2].word + ""
	  	else
	  		final_word = words1[index1].word + words2[index2].word
	  	end
	  end

	end

end
