<div id="twitter-sidebar"> 
	<h2>Twitter Feed</h2> 
	<ul id="twitter_update_list">
		<cfloop array="#prc.tweets#" index="tweet">
			<li><cfoutput><a href="http://www.twitter.com/toysforshots/status/#tweet.id#" target="_blank">#tweet.text#</a> <br/><span class="date">#ReReplace(tweet.created_at,"(\d\d:\d\d:\d\d [+-]\d{4}) (\d{4})$","\2 \1")#</span></cfoutput></li>
		</cfloop>
	</ul>
</div>

<div align="center">
	<a href="http://twitter.com/toysforshots" target="_blank"><img src="includes/images/twitter_followme.png" border="0"></a> 
</div>