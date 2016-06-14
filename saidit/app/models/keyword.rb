
class Keyword < ActiveRecord::Base
	belongs_to :Question

	class << self 

		def processKeyword(keyword)
			if(keyword['relevance'].to_f > 0.6)
				puts "************************************************************"
				puts "#{keyword['relevance']}"
				puts "************************************************************"
				return true
			else return false
			end 
		end  

		def getKeywords(question_id)

		end 

	end 
end
