class AddQuestiontoKeywords < ActiveRecord::Migration
  def change
  	add_foreign_key :keywords, :question 
  end
end
