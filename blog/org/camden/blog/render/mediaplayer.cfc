<cfcomponent extends="render" instructions="To include a file, use <cfinclude template=""xxx"" where xxx is relative to the blog CFC or specified with a ColdFusion Mapping.">

<cffunction name="display">
	<cfargument name="source" type="string" required="false" default="">
	<cfargument name="width" type="numeric" required="false" default="625">
	<cfset var buffer = "">

	<cfif len(arguments.source)>
		<cfsavecontent variable="buffer">
		<cfmediaplayer source="#arguments.source#" hidetitle="true" width="#arguments.width#">
		</cfsavecontent>
		<cfreturn buffer>
	</cfif>

	<cfreturn "">

</cffunction>

</cfcomponent>