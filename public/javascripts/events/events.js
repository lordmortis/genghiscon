var aevent = new Event();

function Event() {
	this.id = 0;
	this.updated_at = new Date(0);
	this.name = null;
	this.attending = 0;
	this.attendees = new Array();
	
	this.parseJSON = function parseJSON(data) {
		this.id = data.id;
		this.updated_at = new Date(data.updated_at);
		this.name = data.name;
		this.attending = 0;
		this.attendees = new Array();
		for (var i = 0; i < data.attendees.length; i++) {
			var temp = new Attendee();
			temp.parseJSON(data.attendees[i]);
			temp.event = this;
			if (temp.attended)
				this.attending += 1;
			this.attendees.push(temp);
		}
	}
	
	this.sortAttendees = function sortAttendees() {
		var temp = new Array();
		for (var i = 0; i < this.attendees.length; i++) {
			var attendee = this.attendees[i];
			if (attendee.attended)
				temp.push(attendee);
		}
		for (var i = 0; i < this.attendees.length; i++) {
			var attendee = this.attendees[i];
			if (!attendee.attended)
				temp.push(attendee);
		}
		
		this.attendees = temp;
	}
		
	this.updateFinished = function updateFinished(object, data, textStatus, XMLHttpRequest) {
		outstanding -= 1;
		if (data.event != null) {
			object.parseJSON(data.event);
		}
	}
	
	this.removeAttendee = function removeAttendee(attendee) {
		for (var i = 0; i < this.attendees.length; i++) {
			if (this.attendees[i].id == attendee.id) {
				this.attendees.splice(i,1);
				return;
			}
		}
	}
	
	this.update = function update(callback) {
		outstanding += 1;
		var callbackobj = new Callback(callback, this.updateFinished, this);
		var url;
		var type;

		if (this.id == 0) {
			url = '/events.json';
			type = 'POST';
		} else {
			url = '/events/' + this.id + '.json'
			type = 'PUT';		
		}

		$.ajax({
			data: {
					authenticity_token: AUTH_TOKEN,
					'event[name]': this.name
				},
			dataType: "json",
			type: type,
			success: jQuery.proxy(callbackobj.retrieveSuccess, callbackobj),
			error: jQuery.proxy(callbackobj.retrieveError, callbackobj),			
			url: url
		});
	}	
	
	this.retrieveFinished = function retrieveFinished(object, data, textStatus, XMLHttpRequest) {
		outstanding -= 1;
		object.parseJSON(data.event);
		$("#event_name").html(object.name);
		redrawAttendees();
	}	
	
	this.retrieve = function retrieve(callback) {
		var callbackobj = new Callback(callback, this.retrieveFinished, this);
		outstanding += 1;
		$.ajax({
			data: {authenticity_token: AUTH_TOKEN},
			type: 'GET',
			dataType: "json",
			success: jQuery.proxy(callbackobj.retrieveSuccess, callbackobj),
			error: jQuery.proxy(callbackobj.retrieveError, callbackobj),			
			url: '/events/' + this.id + '.json'
		});
	}

	this.destroyFinished = function destroyFinished(object, data, textStatus, XMLHttpRequest) {
		outstanding -= 1;
		
	}
	
	this.destroy = function destroy(callback) {
		outstanding += 1;
		var callbackobj = new Callback(callback, this.destroyFinished, this);
		$.ajax({
			data: {authenticity_token: AUTH_TOKEN},
			type: 'DELETE',
			dataType: "json",
			success: jQuery.proxy(callbackobj.retrieveSuccess, callbackobj),
			error: jQuery.proxy(callbackobj.retrieveError, callbackobj),			
			url: '/events/' + this.id + '.json'
		});
	}	
}