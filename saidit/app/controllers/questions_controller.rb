class QuestionsController < ApplicationController
	
	def index
		@question = Question.first
		render "questions/index"
	end 

	def create
		user_input = params[:speech_to_text]
		@question_id = params[:question_id]
		@validKeywords = Keyword.getValidKeywords(@question_id, user_input)
		@emotions = Emotion.getValidEmotions(@question_id, user_input)
		render "questions/stats"
	end 
end
