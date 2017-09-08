require("anagrams_antigrams")
require("rspec")
require("pry")

describe("Anagrams_Antilog") do
	it("Check if two words are anagrams") do
		anagrams_antigrams_obj = AnagramsAntigrams.new("mom","mom")
		expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words are anagrams"))
	end

	# it("Account for the possibility that words might have different cases but should still be anagrams") do
	# 	anagrams_antigrams_obj = AnagramsAntigrams.new("mom","mom")
	# 	expect(anagrams_antigrams_obj.find_anagrams()).to(eq("These words are anagrams"))
	# end
end