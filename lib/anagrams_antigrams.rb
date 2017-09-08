module AnagramsAntigramsMatchingLetter
	def MatchingLetterArray(first_array, second_array)
		matching_letter_arr = []
		first_array.each do |letter|
			if (second_array.include?(letter))
				matching_letter_arr.push(letter)
			end
		end
		matching_letter_arr	
	end
end

class AnagramsAntigrams

	attr_accessor(:first_word, :second_word)

	def initialize(first_word, second_word)
		@first_word = first_word
		@second_word = second_word
	end

	include AnagramsAntigramsMatchingLetter

	def find_anagrams 
		first_word_arry = @first_word.downcase().gsub(/[^A-Za-z0-9]/,"")
		second_word_arry = @second_word.downcase().gsub(/[^A-Za-z0-9]/,"")
		binding.pry
		if (@first_word.match(/[aieouy]/i)) && (@second_word.match(/[aieouy]/i))
			if @first_word == @second_word
				return "These words are palindromes"
			else
				first_word_arry = first_word_arry.split("")
				second_word_arry = second_word_arry.split("")

				matching_letter_arr = MatchingLetterArray(first_word_arry, second_word_arry)
				if matching_letter_arr.length == 0
					return "These words have no letter matches and are antigrams"
				elsif (second_word_arry.length == matching_letter_arr.length) & (first_word_arry.length == matching_letter_arr.length)
				 return "These words are anagrams"
				end
			end
		else
			"You need to input actual words!"
		end
	end
end