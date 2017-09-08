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
	include AnagramsAntigramsMatchingLetter

	def initialize(first_word, second_word)
		@first_word = first_word.downcase()
		@second_word = second_word.downcase()
	end
	

	def find_anagrams 
		@first_word.gsub!(/[^A-Za-z0-9]/,"")
		@second_word.gsub(/[^A-Za-z0-9]/,"")
		if (@first_word.match(/[aieouy]/)) && (@second_word.match(/[aieouy]/)) && (!@second_word.match(/([a-zA-Z0-9])\1{2,}/)) && (!@first_word.match(/([a-zA-Z0-9])\1{2,}/))
			if @first_word == @second_word
				return "These words are palindromes"
			else
				first_word_arry = @first_word.split("")
				second_word_arry = @second_word.split("")
				matching_letter_arr = MatchingLetterArray(first_word_arry, second_word_arry)
				if matching_letter_arr.length == 0
					return "These words have no letter matches and are antigrams"
				elsif (second_word_arry.length == matching_letter_arr.length) & (first_word_arry.length == matching_letter_arr.length)
				 return "These words are anagrams"
				else
					"These words aren't anagrams but #{matching_letter_arr.length} letters match: #{matching_letter_arr.join(',')}" 
				end
			end
		else
			"You need to input actual words!"
		end
	end
end