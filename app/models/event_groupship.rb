class EventGroupship < ApplicationRecord
	belongs_to :event # singular
 	belongs_to :group # singular
end
