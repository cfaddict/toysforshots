component extends="coldbox.system.orm.hibernate.VirtualEntityService" {

	property name="mailService" inject="coldbox:plugin:MailService";
	property name="renderer" inject="coldbox:plugin:Renderer";

	public ContactService function init(){
		super.init(entityName="Contact");
		return this;
	}

	public void function sendNotification(contact){
		var params = {};
		params.to = "danvega@gmail.com";
		params.from = "dan@toysforshots.com";
		params.subject = "Contact Form Notification";
		params.type = "HTML";
		
		var body  = "Name: " & arguments.contact.getName() & "<br/>";
			body &= "Email: " & arguments.contact.getEmail() & "<br/>";
			body &= "Phone: " & arguments.contact.getPhone() & "<br/>";
			body &= "Comments: " & arguments.contact.getComments() & "<br/>";
		
		params.body = body;
		
		new mail(argumentCollection=params).send();
	}
	
}