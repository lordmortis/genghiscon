class Event < ActiveRecord::Base
	has_many :attendees
	
	def Event.default_data_hash
		return {
			:except => [:created_at],
			:include => {:attendees => Attendee.default_data_hash}
		}
	end
end
