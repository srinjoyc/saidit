require 'alchemyapi'
class QuestionsController < ApplicationController
	
	def index
		@question = Question.first; 
		render "questions/index"
	end 

	def create
		@response = {}
		@response["keywords"] = []
		@response["relevance"] = []
		user_input = params[:speech_to_text]
		@question_id = params[:question_id]
		alchemyapi = AlchemyAPI.new()
		api_response = alchemyapi.keywords('text', user_input , { 'sentiment'=>1 })
		api_response['keywords'].each do |keyword|
			@response["keywords"] << keyword['text']
			@response["relevance"] << keyword['relevance']
		end
	
		render "questions/stats"	 
		
	end 
end
