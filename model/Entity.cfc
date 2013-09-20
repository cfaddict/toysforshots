component mappedsuperclass="true" {

	property name="id" fieldtype="id" generator="native";
	property name="dateCreated" ormtype="timestamp";
	property name="dateUpdated" ormtype="timestamp";
	
	public void function preInsert(){
		setDateCreated(now());
		setDateUpdated(now());
	}
	
	public void function preUpdate(){
		setDateUpdated(now());
	}
	
	public void function save(boolean flush=false){
		entitySave(this);
		
		if(arguments.flush){
			ormFlush();
		}
	}

	public void function delete(boolean flush=false){
		entityDelete(this);
		
		if(arguments.flush){
			ormFlush();
		}
	}
	
	public any function populate(Struct data,Array propList=arrayNew(1)){
		var properties = getMetaData(this).properties;
		
		for( var i=1; i <= arrayLen(properties); i++ ) {
			
			var property = properties[i];
			
			// if a property list was passed in use it to filter
			if( !arrayLen(arguments.propList) || arrayContains(arguments.propList,property.name) ){
				
				if( !structKeyExists(property,"fieldtype") || property.fieldType == "column" ) {
					// do columns
					if( structKeyExists(arguments.data,property.name) ){
						local.varValue = arguments.data[property.name];
						local.varValue = cleanse(local.varValue);
						setProperty(property.name,local.varValue);
					}
				} else {
					// do many-to-one
					
				}
				
			}
		}
		
		
	}
	
	private void function setProperty(name,value){
		var theMethod = this["set" & arguments.name];
		if( isNull(arguments.value) ){
			theMethod(javacast('NULL',''));
		} else {
			theMethod(arguments.value);
		}
	}
	
	private any function cleanse(data){
		return htmlEditFormat(arguments.data);
	}

}