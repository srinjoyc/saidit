require 'alchemyapi'
class Keyword < ActiveRecord::Base
	belongs_to :Question

	class << self

		def getValidKeywords(question_id, user_input)
			alchemyapi = AlchemyAPI.new()
			@response = alchemyapi.keywords('text', user_input , { 'sentiment'=>1 })
			@validKeywords = []
			@response['keywords'].each do |keyword|
				if(Keyword.processKeyword(keyword))	
					newKeyWord = Keyword.create(keyword: keyword['text'], relevance: keyword['relevance'], question_id: question_id)
					@validKeywords.push(newKeyWord)
					if(!newKeyWord.save)
						puts "Error"
					end
				end  
			end
			return @validKeywords 
		end

		def processKeyword(keyword)
			if(keyword['relevance'].to_f > 0.6)
				return true
			else return false
			end 
		end   

	end 
end
