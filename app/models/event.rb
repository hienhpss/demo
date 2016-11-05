class Event < ApplicationRecord
	validates_presence_of :name
	has_many :attendees # plural
	has_many :event_groupships # plural
 	has_many :groups, :through => :event_groupships
 	belongs_to :category, optional: true # singular
 	has_one :location # singular
end
