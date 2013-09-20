component persistent="true" extends="Entity" {

	/**
	 * @blank false
	 */ 
	property name="name";
	
	/**
	 * @email
	 */
	property name="email";
	
	property name="phone";
	
	/**
	 * @blank false
	 */
	property name="comments" ormtype="text";

	public Contact function init(){
		return this;
	}

}