<div class="row">
	<div class="span12">

		<h1>Photo Gallery</h1>

		<cfoutput>
		<div id="gallery">
		<table>
			<tr>
				<cfloop from="1" to="#arrayLen(rc.galleries)#" index="i">
				<td>
					<div align="center">
						<a href="#event.buildLink(linkto='gallery.view',queryString='collection=#rc.galleries[i].getAlias()#')#">
							#htmlHelper.img(src='includes/images/gallery/#rc.galleries[i].getImage()#')#
							<div class="title">#rc.galleries[i].getTitle()# (#rc.galleries[i].count()#)</div>
						</a>
					</div>
				</td>
				<cfif i MOD 4 EQ 0>
					</tr><tr>
				</cfif>
				</cfloop>
			</tr>
		</table>
		</div>
		</cfoutput>

	</div>
</div>

