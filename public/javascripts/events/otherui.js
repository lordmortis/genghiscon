function displaybusy() {
	if (outstanding > 0)
		$("#loading").removeClass("hidden");
	else
		$("#loading").addClass("hidden");
}

function redrawAttendees() {
	$("#total_attendees").html(aevent.attendees.length);
	$("#attending_attendees").html(aevent.attending);
	list = $("#event_attendees")
	list.find(".attendee").remove();
	for (var i = 0; i < aevent.attendees.length; i++) {
		var attendee = aevent.attendees[i];
		list.append(attendee.uiLine(true));
	}
}

function setCalcValue(value) {
	$("#calc_money").val(value);
	updateCalc();
}

function addCalcValue(value) {
	var money = parseFloat($("#calc_money").val());
	$("#calc_money").val(money + value);
	updateCalc();
}


function updateCalc() {
	var money = parseFloat($("#calc_money").val());
	var tickets = parseFloat($("#calc_ticketnum").val());
	var price = parseFloat($("#calc_ticketprice").val());
	var change = 0.0;
	
	change = money - (tickets * price);
	$("#calc_change").html(change);
}

function spawnAdd() {
	$("#add_button").addClass("hidden")
	box = $("#event_attendees");
	var attendee = new Attendee();
	newadd = $("#attendeeadd").clone();
	attendee.aform = newadd;
	attendee.event_id = event_id;
	newadd.removeClass("hidden");
	newadd.attr("id", "attendee_form_0");
	newadd.find("#submit").click(jQuery.proxy(attendee.updateFromForm, attendee));
	attendee.updateForm(newadd);
	box.prepend(newadd);
}

$(document).ready(function() {
	aevent.id = event_id;
	setInterval("displaybusy()", 100);
	aevent.retrieve(null);
});