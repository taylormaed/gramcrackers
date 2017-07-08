
get '/words' do
	@words = Word.all
	erb :"/words/index"
end

get '/words/new' do
    @word = Word.new
    erb :"words/new"
end

post '/words' do
	@word = Word.create(text: params[:text])
	if @word.valid?
		@word.save
		redirect "/words/#{@word.id}"
	else
		@errors = "If your word is not in the dictionary, please add it."
	end
end

get '/words/:id/edit' do
	@word = Word.find(params[:id])
	erb :"/words/edit"
end

put '/words/:id' do
	@word = Word.find(params[:id])
	@word.text = params[:text]
	if @word.valid?
		@word.save
		redirect "/words/#{@word.id}"
	else 
		@errors = "Please be sure you have entered a word."
	end
	erb :"/words/show"
end

get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end
