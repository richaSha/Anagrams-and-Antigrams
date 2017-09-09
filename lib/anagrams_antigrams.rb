module AnagramsAntigramsMethod
	def find_anagram_antigram(first_word, second_word)
		second_word_array = second_word.split("")
		matching_array = []
		first_word.split("").each do |letter|
			if (second_word_array.include?(letter))
				second_word_array.delete_at(second_word_array.index(letter))
				matching_array.push(letter)
			end
		end
		if matching_array.length == 0
			return 'These words have no letter matches and are antigrams'
		elsif second_word_array.length == 0 
			if is_palindromes?(first_word, second_word)
				return "These words are palindromes"
			else
				return "These words are anagrams"
			end
		else
			"These words aren't anagrams but #{matching_array.length} letters match: #{matching_array.join(',')}" 
		end
	end

	def is_actual_word?(word)
		(word.match(/[aieouy]/)) && (!word.match(/([a-zA-Z])\1{2,}/)) && (!word.match(/[0-9]/))
	end

	def is_palindromes?(first_word, second_word)
		(first_word == first_word.reverse) && (second_word == second_word.reverse)
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
			return find_anagram_antigram(@first_word, @second_word)
		else
			"You need to input actual words!"
		end
	end
end