function Attendee() {
	this.id = 0;
	this.updated_at = new Date(0);
	this.name = null;
	this.notes = null;
	this.attended = false;
	this.norsvp = true;
	this.event_id = null;
	this.event = null;
	this.aform = null;
	this.uiline = null;
	
	this.parseJSON = function parseJSON(data) {
		this.id = data.id;
		this.updated_at = new Date(data.updated_at);
		this.name = data.name;
		this.notes = data.notes;
		this.attended = data.attended;
		this.event_id = data.event_id;		
		this.norsvp = data.norsvp;
	}
	
	this.updateAttended = function updateAttended() {
		var string = "";
		if (this.attended) {
			this.event.attending -= 1;
			string = "Not Attending";
		} else {
			this.event.attending += 1;
			string = "Attending";
		}
		if (confirm(this.name + " is now " + string + " ?")) {
			this.attended = !this.attended;
			this.uiLine();
			this.update(null);
			$("#attending_attendees").html(this.event.attending);
		}
	}
	
	this.updateDelete = function updateDelete() {
		if (confirm("Delete Attendee: " + this.name)) {
			this.destroy();
		}
	}
	
	this.uiLine = function uiLine(removeoldline) {
		if (removeoldline)
			this.uiline = null;
		if (this.uiline == null) {
			this.uiline = $("#attendee_line").clone();
			this.uiline.removeClass("hidden");
			this.uiline.attr("id", this.id);
			this.uiline.find("#attended").click(jQuery.proxy(this.updateAttended, this))
			this.uiline.find("#delete").click(jQuery.proxy(this.updateDelete, this))
		}
		this.uiline.find("#name").html(this.name);
		if (this.attended)
			this.uiline.find("#attended").html("Not Attending")
		else
			this.uiline.find("#attended").html("Attending")
		return this.uiline;
	}
		
	this.updateFromForm = function updateFromForm() {
		this.name = this.aform.find("#name").val();
		this.notes = this.aform.find("#notes").val();		
		this.norsvp = !(this.aform.find("#norsvp").attr("checked"));
		this.update(redrawAttendees);
	}
	
	this.updateForm = function updateForm(jqueryobj) {
		jqueryobj.find("#name").val(this.name);
		jqueryobj.find("#notes").val(this.notes);
		jqueryobj.find("#norsvp").attr("checked", !(this.norsvp));
	}
	
	this.updateFinished = function updateFinished(object, data, textStatus, XMLHttpRequest) {
		outstanding -= 1;
		if (object.id == 0) {
			object.parseJSON(data.attendee);
		}
		if (object.aform != null) {
			if (object.aform.attr("id") == "attendee_form_0") {
				$("#add_button").removeClass("hidden");
				aevent.attendees.push(object);
			}
			object.aform.remove();
			object.aform = null;
		}
	}
	
	this.update = function update(callback) {
		outstanding += 1;
		var callbackobj = new Callback(callback, this.updateFinished, this);
		var url;
		var type;

		if (this.id == 0) {
			url = '/events/' + this.event_id + '/attendees.json';
			type = 'POST';
		} else {
			url = '/events/' + this.event_id + '/attendees/' + this.id + '.json'
			type = 'PUT';		
		}

		$.ajax({
			data: {
					authenticity_token: AUTH_TOKEN,
					'attendee[name]': this.name,
					'attendee[notes]': this.notes,
					'attendee[attended]': this.attended,
					'attendee[norsvp]': this.norsvp
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
	}	
	
	this.retrieve = function retrieve(callback) {
		outstanding += 1;
		var callbackobj = new Callback(callback, this.retrieveFinished, this);
		$.ajax({
			data: {authenticity_token: AUTH_TOKEN},
			type: 'GET',
			dataType: "json",
			success: jQuery.proxy(callbackobj.retrieveSuccess, callbackobj),
			error: jQuery.proxy(callbackobj.retrieveError, callbackobj),			
			url: '/events/' + this.event_id + '/attendees/' + this.id + '.json'
		});
	}

	this.destroyFinished = function destroyFinished(object, data, textStatus, XMLHttpRequest) {
		outstanding -= 1;
		if (object.uiline != null)
			object.uiline.remove();
		aevent.removeAttendee(object);		
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
			url: '/events/' + this.event_id + '/attendees/' + this.id + '.json'
		});
	}	
}