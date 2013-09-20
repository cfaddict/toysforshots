<div class="row">
	<div class="span15">
		
	<h1>Gallery Listing: <cfoutput>#rc.gallery.getTitle()#</cfoutput></h1>

	<cfif rc.sortedPhotos.recordCount>
		
		<div align="center">
		<cfoutput query="rc.sortedPhotos">
			<a class="zoom" rel="group" title="#rc.gallery.getTitle()#" href="/includes/images/gallery/#rc.gallery.getAlias()#/large/#name#">
				#htmlHelper.img(src='includes/images/gallery/#rc.gallery.getAlias()#/thumb/#name#',class='gallery-image')#
			</a>
		</cfoutput>
		</div>
	
		<cfsavecontent variable="head">
		<cfoutput>
			<link rel="stylesheet" type="text/css" href="#baseurl#/includes/lib/fancybox/jquery.fancybox-1.2.6.css" media="screen" />
			<script type="text/javascript" src="#baseurl#/includes/lib/fancybox/jquery.fancybox-1.2.6.pack.js"></script>		
		</cfoutput>
		<script type="text/javascript">
			$(document).ready(function() {
				$("a.zoom").fancybox();
	
				$("a.zoom1").fancybox({
					'overlayOpacity'	:	0.7,
					'overlayColor'		:	'#FFF'
				});
	
				$("a.zoom2").fancybox({
					'zoomSpeedIn'		:	500,
					'zoomSpeedOut'		:	500
				});
			});
		</script>
		</cfsavecontent>
		<cfhtmlhead text="#head#">
		
	<cfelse>
		
		There are no photos for this gallery, please check back soon.
		<br/><br/><br/><br/><br/><br/><br/><br/>
	
	</cfif>	
	</div>	
</div>

<div class="row" align="right">
	<a href="<cfoutput>#event.buildLink('gallery')#</cfoutput>" class="btn large primary">Return to Gallery Listing</a>
	<br/><br/>
</div>
	