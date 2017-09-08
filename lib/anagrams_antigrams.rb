class AnagramsAntigrams
	attr_accessor(:first_word, :second_word)
	def initialize(first_word, second_word)
		@first_word = first_word
		@second_word = second_word
	end
	def find_anagrams
		first_word_arry = @first_word.downcase().split("")
		second_word_arry = @second_word.downcase().split("")
		matching_letter_arr = []
		first_word_arry.each do |letter|
			if (second_word_arry.include?(letter)) & (first_word_arry.length == second_word_arry.length)
				matching_letter_arr.push(letter)
				# binding.pry
			end
		end
		if first_word_arry.length == matching_letter_arr.length
		 return "These words are anagrams"
		end
	end
end