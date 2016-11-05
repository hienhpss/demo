class Category < ApplicationRecord
	def change
	 	create_table :categories do |t|
		 	t.string :name
		 	t.integer :position
		 	t.timestamps
 		end
 		add_column :events, :category_id, :integer
 		add_index :events, :category_id
	end
	has_many :events	
end