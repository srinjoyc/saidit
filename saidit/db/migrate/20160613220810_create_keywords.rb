class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
    	add_foreign_key :questions
    	t.string :keyword
    end
  end
end
