<cfsetting enablecfoutputonly=true>
<cfprocessingdirective pageencoding="utf-8">
<cfmodule template="../../tags/scopecache.cfm" cachename="#application.applicationname#_br" scope="application" timeout="#application.timeout#">
	<cfmodule template="../../tags/podlayout.cfm" title="Blog Roll">
		<ul id="blogroll" class="list">
			<li><a href="http://www.cfsilence.com">Todd Sharp</a></li>
			<li><a href="http://www.forta.com/blog">Ben Forta</a></li>
			<li><a href="http://www.coldfusionjedi.com">Ray Camden</a></li>
			<li><a href="http://www.remotesynthesis.com/blog">Brian Rinaldi</a></li>
			<li><a href="http://www.compoundtheory.com">Mark Mandel</a></li>
			<li><a href="http://www.12robots.com">Jason Dean</a></li>
			<li><a href="http://www.mattaster.com">Matt Aster</a></li>
			<li><a href="http://weslynwhitehead.com">Weslyn Whitehead</a></li>
			<li><a href="http://www.andywolf.com/blog">Andy Wolf</a></li>
		</ul>
	</cfmodule>
</cfmodule>