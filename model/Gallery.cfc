component persistent="true" extends="Entity" {

	property name="title";
	property name="image";
	property name="alias";
	property name="description" ormtype="text";
	property name="views" ormtype="integer";	
	
	public Gallery function init(){
		return this;
	}
	
	public numeric function count(){
		var alias = getAlias();
		var dir = expandPath('./') & "./includes/images/gallery/" & alias & "/thumb";
		var imageCount = 0;
		
		if( isNull(cacheGet(alias & "-imagecount")) ) {
			if(directoryExists(dir)){
				var images = directoryList(dir);
				imageCount = arrayLen(images);
				cachePut(alias & "-imagecount",imageCount);
			}				
		} else {
			imageCount = cacheGet(alias & "-imagecount");
		}
		
		return imageCount;
	}
}