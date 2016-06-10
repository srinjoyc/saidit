class Question < ActiveRecord::Base

	def getAPIkey
	creds =	{
		        "url": "https://gateway-a.watsonplatform.net/calls",
		        "note": "It may take up to 5 minutes for this key to become active",
		        "apikey": "5bd8749a23183b78cd741f75f69c63831efb275f"
					}
	end 
end
