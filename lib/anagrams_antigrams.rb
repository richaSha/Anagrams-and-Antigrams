module AnagramsAntigramsMethod
	def MatchingLetterArray(first_word, second_word)
		first_word_array = first_word.split("")
		second_word_array = second_word.split("")
		matching_letter_array = []
		first_word_array.each do |letter|
			if (second_word_array.include?(letter))
				matching_letter_array.push(letter)
			end
		end
		matching_letter_array	
	end

	def is_actual_word?(word)
		(word.match(/[aieouy]/)) && (!word.match(/([a-zA-Z0-9])\1{2,}/))
	end

	def is_antigrams?(matching_array)
		matching_array.length == 0
	end

	def is_anagrams?(matching_array, first_array, second_array)
		(first_array.length == matching_array.length) & (second_array.length == matching_array.length)
	end

end

class AnagramsAntigrams
	attr_accessor(:first_word, :second_word)
	include AnagramsAntigramsMethod

	def initialize(first_word, second_word)
		@first_word = first_word.downcase()
		@second_word = second_word.downcase()
	end
	

	def find_anagrams 
		@first_word.gsub!(/[^A-Za-z0-9]/,"")
		@second_word.gsub(/[^A-Za-z0-9]/,"")
		
		if (is_actual_word?(@first_word)) && (is_actual_word?(@second_word))
			if @first_word == @second_word
				return "These words are palindromes"
			else
				matching_array = MatchingLetterArray(@first_word, @second_word)
				if is_antigrams?(matching_array)
					return "These words have no letter matches and are antigrams"
				elsif is_anagrams?(matching_array, @first_word, @second_word)
				 return "These words are anagrams"
				else
					"These words aren't anagrams but #{matching_array.length} letters match: #{matching_array.join(',')}" 
				end
			end
		else
			"You need to input actual words!"
		end
	end
end