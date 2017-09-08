require("anagrams_antigrams")
require("rspec")
require("pry")

describe("Anagrams_Antilog") do
	it("Check if two words are anagrams") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("tea","eat")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words are anagrams"))
	end

	it("Account for the possibility that words might have different cases but should still be anagrams") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("Tea","Eat")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words are anagrams"))
	end

	it("If a word or phrase is an anagram, check if it's also a palindrome") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("Racecar","Racecar")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words are palindromes"))
	end

	it("Check if the inputs are words") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("Rcr","Racecar")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("You need to input actual words!"))

		anagrams_antigrams_obj = AnagramsAntigrams.new("Racecar","Rcr")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("You need to input actual words!"))
	end
end