component accessors="true" {

	property name="attendeeService" inject;
	property name="validationService" inject;
	property name="cffp" inject="id:cfformProtect";	

	public void function index(){
		if(!structKeyExists(rc,"attendee")){
			rc.attendee = attendeeService.new();
		}
	}
	
	public void function save(){
		rc.attendee = attendeeService.new();
		rc.attendee.populate(rc);
		
		if( cffp.testSubmission(rc) ) {
			var result = validationService.validate(rc.attendee);
					
			if( !result.hasErrors() ) {
				attendeeService.save(rc.attendee);
				attendeeService.sendNotification(rc.attendee);
				rc.success = true;
				setNextEvent(event='rsvp',persist="success");
			} else {			
				rc.errors = result.getErrorMessages();
				setNextEvent(event='rsvp',persist="attendee,errors");	
			}
		} else {
			rc.errors = ["Your comments were marked as spam, please try again."];
			setNextEvent(event='rsvp',persist="errors");				
		}	
		
	}
	
}