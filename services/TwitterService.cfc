import com.adobe.coldfusion.result;

component accessors="true" {

	// twitter username
	property screenname;
	// proxy settings
	property proxySettings;

	/**
	 * constructor that sets up the instance with the username and 
	 * any proxy information if needed
	 */
	public TwitterService function init(String screenName,Struct proxy={}){
		setScreenName(arguments.screenname);
		setProxySettings(proxy);
		return this;
	}

	/** 
	 * params count: max number of tweets to return
	 * return http service call result
	 * 
	 * @hint constructs the service url and returns the result
	 */	
	public result function getPublicTimeline(Numeric count){
		var apiURL  = "http://api.twitter.com/1/statuses/user_timeline.json?";
			apiURL &= "screen_name=" & getScreenName();
			apiURL &= "&count=" & arguments.count;
			apiURL &= "&include_rts=true";
		
		return callService(apiURL);
	}
	
	/** 
	 * params serviceURL: the full url containing user & count
	 * return http service call result
	 * 	
	 * @hint calls the http service to retrieve the timeline
	 */
	private result function callService(String serviceURL){
		var http = new Http();
			http.setUrl(arguments.serviceURL);
		
		// if a proxy was passed to the constructor use it	
		if( !structIsEmpty(variables.proxySettings) ){
			http.setProxyServer(variables.proxySettings.server);
			http.setProxyPort(variables.proxySettings.port);
			if( structKeyExists(variables.proxySettings,"username") && structKeyExists(variables.proxySettings,"password")){
				http.setProxyUser(variables.proxySettings.username);
				http.setProxyPassword(variables.proxySettings.password);
			}
		}
				
		return http.send();
	}

}