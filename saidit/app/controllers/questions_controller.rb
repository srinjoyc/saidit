require 'alchemyapi'
class QuestionsController < ApplicationController
	
	def index
		@question = Question.first; 
		render "questions/index"
	end 

	def create
		user_input = params[:speech_to_text]
		@question_id = params[:question_id]
		alchemyapi = AlchemyAPI.new()
		@response = alchemyapi.keywords('text', user_input , { 'sentiment'=>1 })
		@response['keywords'].each do |keyword|
			if(Keyword.processKeyword(keyword))	
				newKeyWord = Keyword.create(keyword: keyword['text'])
				if(!newKeyWord.save)
					puts "Error"
				end
			end  
		end 
		render "questions/stats"
	end 
end
