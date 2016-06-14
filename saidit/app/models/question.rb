class Question < ActiveRecord::Base
	has_many :keywords
	def processResponse(response)
		
	end 
end
