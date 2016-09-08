class Word < ActiveRecord::Base

	def self.find_anagrams(string)
		# Convert word to an array of letters
		letters = string.split(//)

		# Create an array to store our anagrams
		anagrams = []

		# Loop through each letter in letters
		letters.each do |letter|
			# Select the remaining letters
			remaining = letters.select { |l| l != letter}

			# Create a new word by combining the letter + the remaining letters
			# Add a new word to an anagrams array

			anagrams << letter + reverse_letters(remaining).join('')
		end

			# Return anagrams array
			anagrams
		end
	
	def self.reverse_letters(letters)
	# create a new array of two items
		length = letters.length
		reversed_letters = Array.new(length) 

		# loop through letters and keep index
		letters.each_with_index do |letter, index|
			reversed_letters[length - index - 1] = letter
		end

		reversed_letters
	end

	def self.find_anagram(letters)

		find_anagram(letters) # must be 3 letters
    	length=letters.length
   	 	word_array = letters.split(//) # place the characters of the word into an array
    	output_array = word_array.permutation.map{ |i| i.join } # joins the 3 character array with all permutations and inserts each into output array.
        
        return output_array
        
	end

	
end

class CreateWords < ActiveRecord::Migration
	def change
		create_table :words do |t|
			t.string :text
		end
	end
end