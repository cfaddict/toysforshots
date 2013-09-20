component accessors="true" {

	property name="contactService" inject;
	property name="validationService" inject;
	property name="cffp" inject="id:cfformProtect";

	public void function index(){
		if(!structKeyExists(rc,"contact")){
			rc.contact = contactService.new();
		}
	}

	public void function save(){
		rc.contact = contactService.new();
		rc.contact.populate(rc);

		if( cffp.testSubmission(rc) ) {
			var result = validationService.validate(rc.contact);

			if( !result.hasErrors() ) {
				contactService.save(rc.contact);
				contactService.sendNotification(rc.contact);
				rc.mailsent = true;
				setNextEvent(event='contact',persist="mailsent");
			} else {
				rc.errors = result.getErrorMessages();
				setNextEvent(event='contact',persist="contact,errors");
			}
		} else {
			rc.errors = ["Your comments were marked as spam, please try again."];
			setNextEvent(event='contact',persist="errors");
		}

	}

}