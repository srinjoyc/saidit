require 'alchemyapi'
class Emotion < ActiveRecord::Base
	belongs_to :Question

	class << self

		def getValidEmotions(question_id, user_input)
			alchemyapi = AlchemyAPI.new()
			@response = alchemyapi.emotional_assesment('text', user_input)
			@emotions = @response["docEmotions"]
		end 

	end 
end