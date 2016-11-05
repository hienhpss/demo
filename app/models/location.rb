class Location < ApplicationRecord
	def change
 		create_table :locations do |t|
 		t.string :name
 		t.integer :event_id
 		t.timestamps
 		end
 	end
 	belongs_to :event # singular
end
