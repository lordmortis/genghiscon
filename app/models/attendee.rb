class Attendee < ActiveRecord::Base
	belongs_to :event

	def Attendee.default_data_hash
		return {
			:except => [:created_at, :user_id]
		}
	end
end
