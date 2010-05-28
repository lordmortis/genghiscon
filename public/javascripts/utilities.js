function Callback(callbackfunction, objectcallback, anobject) {
	this.requestorcallback = callbackfunction;
	this.objectcallback = objectcallback;
	this.anobject = anobject;
	
	this.retrieveSuccess = function retrieveSuccess(data, textStatus, XMLHttpRequest) {
		this.objectcallback(this.anobject, data, textStatus, XMLHttpRequest);
		if (this.requestorcallback != null)
			this.requestorcallback(true, this.anobject);
	}

	this.retrieveFailure = function retrieveFailure(XMLHttpRequest, textStatus, errorThrown) {
		if (this.requestorcallback != null)
			this.requestorcallback(false, this.anobject, textStatus);
	}

}

Date.prototype.dayAsString = function dayAsString() {
	var time_text = "";
	if (this.getDate() < 10)
		time_text += "0"
	time_text += this.getDate() + "/";
	if ((this.getMonth() + 1) < 10)
		time_text += "0"
	time_text += (this.getMonth() + 1)+ "/" + this.getFullYear();
	return time_text;
}

Date.prototype.railsString = function railsString() {
	astring = "";
	astring += this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate();
	astring += " " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
	
	return astring;
}

Date.dateFromString = function dateFromString(datetext) {
	split = datetext.split(' ');
	datetext = split[0];
	dateparts = datetext.split('/');
	if (split.length > 1) {
		timetext = split[1];
		timeparts = timetext.split(':');
		return new Date(dateparts[2], dateparts[1] -1, dateparts[0], timeparts[0], timeparts[1], 0, 0);
	} else 
		return new Date(dateparts[2], dateparts[1] -1, dateparts[0], 0, 0, 0, 0);
}