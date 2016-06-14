class AddRelevancetoKeywords < ActiveRecord::Migration
  def change
  	add_column :keywords, :relevance, :float
  end
end
