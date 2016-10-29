
get '/words' do 
	@words = Word.all
	erb :"/words/index"
end
	
get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end
