import toysforshots.model.Gallery;

component extends="coldbox.system.orm.hibernate.VirtualEntityService" {

	public GalleryService function init(){
		super.init(entityName="Gallery");
		return this;
	}
	
	public Query function listByDirectory(String directory,Gallery gallery){
	
		var photos = queryNew("gallery,name,width");
		var dir = arguments.directory;
		
		if( directoryExists(dir) ){
			var thumbs = directoryList(dir,false);				
			
			for(img in thumbs) {
				
				// read the file and get the width so we can sort by width
				// this way we will have all the wider ones first
				try {
					var _image = imageRead(img);
					queryAddRow(photos,1);
					querySetCell(photos,"gallery",arguments.gallery.getTitle());
					querySetCell(photos,"name",listLast(img,"\"));
					querySetCell(photos,"width",_image.width);
				} catch(any e){
					queryAddRow(photos,1);
					querySetCell(photos,"gallery",arguments.gallery.getTitle());
					querySetCell(photos,"name",listLast(img,"\"));
					querySetCell(photos,"width",0);	
				}								
			}
			
			var qoq = new Query(); 
			qoq.setAttributes(resultSet = photos);
		    qoq.SetDBType("query"); 
				
			var queryString = "select gallery,name,width from resultSet order by width desc";
		    var qoqResult = qoq.execute(sql= queryString);   
			
			return qoqResult.getResult();
		}
		
		return photos;
	}

}