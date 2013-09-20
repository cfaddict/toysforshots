component persistent="true" extends="Entity" {
	
	/**
	 * @blank false
	 */ 
	property name="name";
	
	/** 
	 * @Email
	 */
	property name="email";
	
	property name="attending";
	property name="year" ormtype="int";
	property name="guests" ormtype="int";
	property name="comments" ormtype="text";
	
	public Attendee function init(){
		setAttending('yes');
		return this;
	}
	
}