component accessors="true" {

	property name="galleryService" inject;
	property name="cache" inject="cachebox:default";

	public void function index(event,rc,prc){
		setNextEvent("gallery.list");
	}

	public void function list(event,rc,prc){
		var albums = cacheGet('gallery-list');

		if( isNull(albums) ){
			rc.galleries = galleryService.list(asQuery=false);
			cachePut('gallery-list',rc.galleries);
		} else {
			rc.galleries = albums;
		}

	}

	public void function view(){
		var alias = htmlEditFormat(rc.collection);
		var cacheKey = 'gallery-collection-' & alias;
		rc.gallery = galleryService.findWhere({alias=alias});

		if( isNull(rc.gallery) ){
			variables.fw.redirect('gallery');
		} else {

			if( cache.lookup(cacheKey) ){
				rc.sortedPhotos = cache.get(cacheKey);
			} else {
				var dir = expandPath('./includes/images/gallery/#alias#/thumb');
				rc.sortedPhotos = galleryService.listByDirectory(dir,rc.gallery);
				cache.set(cacheKey, rc.sortedPhotos, 60, 30);
			}
		}

	}

}