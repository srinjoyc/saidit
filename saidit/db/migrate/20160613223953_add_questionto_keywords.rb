class AddQuestiontoKeywords < ActiveRecord::Migration
  def change
  	add_reference :keywords, :question 
  end
end
