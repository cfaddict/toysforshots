<cfsetting enablecfoutputonly=true>
<cfprocessingdirective pageencoding="utf-8">
<!---
	Name         : layout.cfm
	Author       : Raymond Camden
	Created      : July 4, 2003
	Last Updated : May 18, 2007
	History      : Reset history for version 4.0
				   Added trackback js code, switch to request.rooturl (rkc 9/22/05)
				   Switched to app.rooturl (rkc 10/3/05)
				   frame buster code, use tag cloud (rkc 8/22/06)
				   small white space change (rkc 9/5/06)
				   don't log when doing the getEntry (rkc 2/28/07)
				   use podmanager, by Scott P (rkc 4/13/07)
				   support category as list (rkc 5/18/07)
	Purpose		 : Layout
--->

<cfif thisTag.executionMode is "start">

<cfif isDefined("attributes.title")>
	<cfset additionalTitle = ": " & attributes.title>
<cfelse>
	<cfset additionalTitle = "">
	<cfif isDefined("url.mode") and url.mode is "cat">
		<!--- can be a list --->
		<cfset additionalTitle = "">
		<cfloop index="cat" list="#url.catid#">
		<cftry>
			<cfset additionalTitle = additionalTitle & " : " & application.blog.getCategory(cat).categoryname>
			<cfcatch></cfcatch>
		</cftry>
		</cfloop>

	<cfelseif isDefined("url.mode") and url.mode is "entry">
		<cftry>
			<!---
			Should I add one to views? Only if the user hasn't seen it.
			--->
			<cfset dontLog = false>
			<cfif structKeyExists(session.viewedpages, url.entry)>
				<cfset dontLog = true>
			<cfelse>
				<cfset session.viewedpages[url.entry] = 1>
			</cfif>
			<cfset entry = application.blog.getEntry(url.entry,dontLog)>
			<cfset additionalTitle = ": #entry.title#">
			<cfcatch></cfcatch>
		</cftry>
	</cfif>
</cfif>

<cfset baseURL = "http://" & cgi.http_host>

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns##" xml:lang="en">
<head>
	<title>#htmlEditFormat(application.blog.getProperty("blogTitle"))##additionalTitle#</title>
	<!--- RBB 6/23/05: Push crawlers to follow links, but only index content on individual entry pages --->
	<cfif isDefined("url.mode") and url.mode is "entry">
	<!--- index entry page --->
	<meta name="robots" content="index,follow" />
	<cfelse>
	<!--- don't index other pages --->
	<meta name="robots" content="noindex,follow" />
	</cfif>
	<meta name="title" content="#application.blog.getProperty("blogTitle")##additionalTitle#" />
	<meta name="description" content="#application.blog.getProperty("blogDescription")##additionalTitle#" />
	<meta name="keywords" content="#application.blog.getProperty("blogKeywords")#" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
 	<link rel="alternate" type="application/rss+xml" title="RSS" href="#application.rooturl#/rss.cfm?mode=full" />
    <meta property="og:type" content="blog"/>
	<meta property="og:image" content="#baseurl#/includes/images/toysforshotslogo.jpg" />

	<link href="#baseurl#/blog/includes/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&subset=latin' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="#baseurl#/includes/css/stylesheet.css" type="text/css" media="screen, projection">
	<link rel="stylesheet" href="#baseurl#/includes/css/blog.css" type="text/css" media="screen, projection">

	<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {

		});

		try {
		    var _gaq = _gaq || [];
		 	_gaq.push(['_setAccount', 'UA-11293197-1']);
			_gaq.push(['_setDomainName', '.toysforshots.com' ]);
			_gaq.push(['_setAllowHash', false]);
			_gaq.push(['_setAllowLinker', true]);
		    _gaq.push(['_trackPageview']);
		    _gaq.push(['_trackPageLoadTime']);

			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();

		}
		catch (e) {

		}
		function launchComment(id) {
			cWin = window.open("#application.rooturl#/addcomment.cfm?id="+id,"cWin","width=550,height=700,menubar=yes,personalbar=no,dependent=true,directories=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes");
		}
		function launchCommentSub(id) {
			cWin = window.open("#application.rooturl#/addsub.cfm?id="+id,"cWin","width=550,height=350,menubar=yes,personalbar=no,dependent=true,directories=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes");
		}
		<cfif isDefined("url.mode") and url.mode is "entry"	and application.usetweetbacks and structKeyExists(attributes, "entrymode")>
		$(document).ready(function() {
			//set tweetbacks div to loading...
			$("##tbContent").html("<div class='tweetbackBody'><i>Loading Tweetbacks...</i></div>")
			$("##tbContent").load("#application.rooturl#/loadtweetbacks.cfm?id=#attributes.entryid#")
		})
		</cfif>
	</script>


</head>

<body onload="if(top != self) top.location.replace(self.location.href);">



	<div class="container">

		<div class="content-wrapper">


			<div class="row">
				<div id="header">
					<a href="/"><img src="#baseurl#/includes/images/toysforshotslogo.jpg" width="220" border="0" class="logo"></a>
				</div>
			</div>
			<div class="row">
				<div id="navigation" class="span12">
					<ul>
						<li><a href="#baseurl#">Home</a></li>
						<li><a href="#baseurl#/about">About</a></li>
						<li><a href="#baseurl#/donate">Donations</a></li>
						<li><a href="#baseurl#/raffle">Raffle</a></li>
						<li><a href="#baseurl#/gallery">Gallery</a></li>
						<li><a href="#baseurl#/rsvp">RSVP</a></li>
						<li><a href="#baseurl#/blog" class="current">Blog</a></li>
						<li><a href="#baseurl#/thankyou">Thank You</a></li>
						<li><a href="#baseurl#/contact">Contact Us</a></li>
					</ul>
				</div>
			</div>

</cfoutput>
<cfelse>
<cfoutput>

		</div>

		<div id="footer" class="row">
			Please <a href="#baseurl#/contact">contact us</a> if you have any questions about the site, the event or the owner of this website</a>.
		</div>

	</div>

	<script type="text/javascript">
	/* <![CDATA[ */
	var isIE6 = false; /* <- do not change! */
	var isIE = false;  /* <- do not change! */
	var lightbox = 1;  /* lightbox on/off ? */
	/* ]]> */
	</script>
	<!--[if lte IE 6]> <script type="text/javascript"> isIE6 = true; isIE = true; </script> <![endif]-->
	<!--[if gte IE 7]> <script type="text/javascript"> isIE = true; </script> <![endif]-->

</body>
</html>
</cfoutput>
</cfif>
<cfsetting enablecfoutputonly=false>