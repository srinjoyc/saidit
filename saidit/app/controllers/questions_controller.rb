require 'alchemyapi'
class QuestionsController < ApplicationController
	
	def index 
		render "questions/index"
	end 

	def create
		user_input = params[:speech_to_text]
		puts "I GOT SOME USER INPUT:  #{user_input}"
		alchemyapi = AlchemyAPI.new()
		@response = alchemyapi.keywords('text', user_input , { 'sentiment'=>1 })
		render "questions/stats"
	end 
end
