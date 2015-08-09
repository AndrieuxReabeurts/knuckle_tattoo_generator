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
			index1 = words_rand.rand(0..first_word_arr.length-1)
			index2 = words_rand.rand(0..second_word_arr.length-1)
			finalizer(first_word_arr, second_word_arr, index1, index2)

  	end

	  def finalizer(words1, words2, index1, index2)
	  	final_word = words1[index1].word + words2[index2].word
	  	final_word
	  end

	end

end
