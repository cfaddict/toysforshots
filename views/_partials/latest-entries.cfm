<div id="blog-sidebar">
	<h2>Latest Blog Entries</h2>
	<cfloop array="#prc.entries#" index="entry">
		<div class="latest-entry">
			<span class="date">#dateFormat(entry.getPostedOn(),"full")#</span><br/>
			<a href="#buildURL(action='blog.show',queryString='alias=#entry.getAlias()#')#">#entry.getTitle()#</a>
		</div>
	</cfloop>
</div>