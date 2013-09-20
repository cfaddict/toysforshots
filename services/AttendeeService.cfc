component extends="coldbox.system.orm.hibernate.VirtualEntityService" {

	public AttendeeService function init(){
		super.init(entityName="Attendee");
		return this;
	}
	
	public void function sendNotification(any attendee){
		var params = {};
		params.to = "danvega@gmail.com";
		params.from = "dan@toysforshots.com";
		params.subject = "RSVP Notification";
		params.type = "HTML";
		
		var body  = "Name: " & attendee.getName() & "<br/>";
			body &= "Email Address: " & attendee.getEmail() & "<br/>";
			body &= "Attending: " & attendee.getAttending() & "<br/>";
			body &= "Total Guests: " & attendee.getGuests() & "<br/>";
			body &= "Comments: " & attendee.getComments() & "<br/>";
		
		params.body = body;
		
		new mail(argumentCollection=params).send();
	}
	
}