class Group < ApplicationRecord
	has_many :event_groupships # plural
 	has_many :events, :through => :event_groupships
end
