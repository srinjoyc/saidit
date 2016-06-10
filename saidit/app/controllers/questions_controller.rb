class QuestionsController < ApplicationController
	
	def index(var = nil) 
		if(var)
			render :test
		end 
	end 

	def create
		@input = params[:firstname]
		@response = AlchemyAPI.keywords(text,@input)
		flash[:notice] = "success"
		redirect '/index'
	end 
end
