class Word < ActiveRecord::Base
	before_create :add_letters
    before_save :add_letters
    validates_presence_of :text
    validates_uniqueness_of :text
	
	def add_letters
	characters = self.text.chars
  	alphabetized_characters = characters.sort
  	self.letters = alphabetized_characters.join
  		
	end

	def self.find_anagrams(string)
		combinations = []
		# Convert word to an array of letters
		letters = string.split(//)
		# Create an array to store anagrams
		anagrams = []
		# Loop through each letter in letters
		letters.each do |letter|
			# Select the remaining letters
			remaining = letters.select{ |l| l != letter }
			# Create a new word by combining the letter + remaining letters
			# Add a new word to the anagrams array
			anagrams << letter + remaining.join('')
			# Create a new word by combining the letter + reverse of the remaining letters
			# Add new word to anagrams array
			anagrams << letter + reverse_letters(remaining).join('')
		end

		# Return anagrams array
			anagrams.each do |combo|
				if Word.find_by_text(combo).present?
					combinations << combo
				end
			end

		combinations
	end

	def self.reverse_letters(letters)
			# create a new array of 2 items
			length = letters.length
			reversed_letters = Array.new(length)

			# loop through letters and keep index
			letters.each_with_index do |letter, index|
				reversed_letters[length - index - 1] = letter
			end

			reversed_letters
		end
	
	


 	def self.valid_input?(input)
 		if Word.find_by_text(input).present? 
 			false
 		else
			raise Exception.new("This word cannot be found! You can add it to the dictionary!")
    end
    
end



	



