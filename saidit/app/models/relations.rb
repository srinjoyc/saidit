class Relations
	class << self
		
		def getAPI
			@@alchemyapi = AlchemyAPI.new()
		end  

		def getRelations(url,entity='Trump')
			getAPI()
			@sentences = {}
			response = @@alchemyapi.relations('url', url , { 'sentiment'=>1 })
			response['relations'].each_with_index do |relation,idx|
				if(!@sentences.has_value?(relation['sentence']))
					 regex = /.*#{entity}.*/
					if(relation['sentence'].match(regex))
						@sentences[idx] = relation['sentence']
					end 
					if(relation['subject']['text'].match(regex))
						@sentences[idx] = relation['sentence']
					end 
				end 
				# puts '******************8'
				# puts "#{relation['sentence']}"
				# puts "#{relation['subject']['text']}"
				# puts "#{relation['object']['text']}"
				# puts "#{relation['object']['sentiment']['type']}"
				# puts "#{relation['object']['sentiment']['score']}"
				#@ret.push(retlation[idx]['sentence'])
			end 
			return @sentences
		end

		def getKeywords(matchedRelations)
			all_keywords = []
			matchedRelations.each do |sentence|
				all_keywords << Keyword.getValidKeywords(1,sentence)
			end 
			return all_keywords
		end 

		def storeKeywords(article, urls = [], entity)
			getAPI()
			keywords = []
			urls.each do |url|
				matchedRelations = getRelations(url,entity)
				keywords+=getKeywords(matchedRelations)
			end 
		end 

	end 
end 