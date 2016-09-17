get '/' do 
	erb :index
end

get '/anagrams/:word' do
    @word = params[:word]
    @anagrams = Word.find_anagrams(@word)
    erb :show
end

post '/' do
	@word = params[:word]
	if valid_input?(@word)
    	redirect "/anagrams/#{@word}"
    else 
    	@error = "Words must have between one and three characters and NOT have duplicate characters!"
		erb :index
	end
end

def three_letters?(input)
	if input.length <= 3 and input.length >= 1
		return true
	else
		return false
	end
end

def distinct_letters?(input)
	letter_array = input.chars
	unique_letters = letter_array.uniq
	if unique_letters.length < letter_array.length
		false
	else
		true
	end
end

def valid_input?(input)
	if three_letters?(input) && distinct_letters?(input)
		true
	else
		false
	end
end
