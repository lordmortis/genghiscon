module EventsHelper
	def javascript_classes
		if ENV['RAILS_ENV'] == "production"
			return javascript_include_tag('events.js')
		else
			return javascript_include_tag(
				'events/events.js',
				'events/attendee.js',
				'events/otherui.js'
			)
		end
	end
end
