
class Keyword < ActiveRecord::Base
	belongs_to :Question

	class << self 

		def processKeyword(keyword)
			if(keyword['relevance'].to_i > 0.9)
				binding.pry
				return true;
			else return false;
			end 
		end  

		def getKeywords(question_id)

		end 

	end 
end
