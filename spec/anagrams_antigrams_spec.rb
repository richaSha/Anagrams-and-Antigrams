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

	it("Check If phrases aren't anagrams, the method should check whether they are actually antigrams") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("Apple","kiwi")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words have no letter matches and are antigrams"))
	end

	it("Check account for multiple words being anagrams or antigrams") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("!!_A p_ple@#{$*}","!! kiw_i")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words have no letter matches and are antigrams"))
	end

	it("Check if words aren't anagrams, return how many letters from the argument are actual matches with the receiver") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("cat","batty")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words aren't anagrams but 2 letters match: a,t"))
	end

	it("Check if same letter three consecutive times in words") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("caaat","batty")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("You need to input actual words!"))
	end
end