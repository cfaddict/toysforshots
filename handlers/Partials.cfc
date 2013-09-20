component accessors="true" {

	property name="twitterService" inject;
	property name="cache" inject="cachebox:default";

	public any function latestTweets(){
		var cacheKey = 'q-recent-tweets';
		var timeline = twitterService.getPublicTimeline(3);
		prc.tweets = [];
		
		if( cache.lookup(cacheKey) ){
			prc.tweets = cache.get(cacheKey);
		} else {
			if (isJSON(timeline.getPrefix().filecontent.toString())){
				prc.tweets = deserializeJSON( timeline.getPrefix().filecontent.toString() );
			}	
			cache.set(cacheKey, prc.tweets, 60, 30);
		}

		return renderView("_partials/latest-tweets");
	}

	public any function latestEntries(){
		prc.entries = [];
		return renderView("_partials/latest-entries");
	}
	
	public any function sponsors(){
		return renderView("_partials/sponsors");
	}

}