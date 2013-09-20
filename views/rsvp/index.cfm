<div class="row">
	<div class="span12">
		<h1>Event Registration</h1>
		<p>By registering for the event you will receive 1 free raffle ticket to our Chinese auction.</p>
		<hr/>
		<p>This event is now sold out. If you would like to be put on the waiting list and notified if any tickets become available please send an email to danvega@gmail.com.
	</div>
</div>

<div class="row-fluid">
	<div class="span12">
		<div style="width:100%; text-align:left;" ><iframe  src="http://www.eventbrite.com/tickets-external?eid=4811891497&ref=etckt&v=2" frameborder="0" height="300" width="100%" vspace="0" hspace="0" marginheight="5" marginwidth="5" scrolling="auto" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:100%; text-align:left;" ><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/etckt">Event Registration Online</a><span style="color:#ddd;"> for </span><a style="color:#ddd; text-decoration:none;" target="_blank" href="http://http://toysforshots.eventbrite.com?ref=etckt">5th Annual Toys For Shots</a> <span style="color:#ddd;">powered by</span> <a style="color:#ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=etckt">Eventbrite</a></div></div>
	</div>
</div>


<!---
<div class="row">
	<div class="span12">
		<h2>RSVP on our facebook event page</h2>
		<a href="http://www.facebook.com/events/279580932144744/" target="_blank">
			<br/>
			<cfoutput>
				#htmlHelper.img(src='includes/images/facebook_event_2011.png',width='325')#
			</cfoutput><br/>
			(Click here to register on facebook)
		</a>
	</div>
</div>
--->

<!--- <div class="row">
	<div class="span12">
		<h1>Event Registration</h1>
		<p>Event registration is not open yet, please check back soon.</p>
	</div>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
 --->
<!---
<cfset cffp = application.wirebox.getInstance('cfformProtect')/>

<div class="row">
	<div class="span15">
		<h1>Event Registration</h1>
		<p>By registering for the event you will receive 1 free raffle ticket to our Chinese auction. This year we have 2 ways for you to register for the event. The first and preferred method is by registering on our facebook event page. You can click on the image on the left to visit our facebook event page and register for the event. We realize that not everyone has facebook so we have provided a 2nd method to register for the event by filling out the form on the right. Please remember that you do not need to register on both. The registration will give us a better idea of attendance as we get closer to the event. When you check in at the event just give us your name and we will give you your free raffle ticket. Thank you and I can't wait to see all of you there! If you need directions to the event please <a href="<cfoutput>#event.buildLink('about')#</cfoutput>">visit our about page</a>.</p>
		<hr/>
	</div>
</div>

<cfoutput>
<div class="row">

	<cfif structKeyExists(rc,"success")>
	<div class="span15">
		<div class="alert-message success">
       		<p>Thank you for registering for Toys For Shots. Please redeem your free raffle ticket at the door.</p>
      	</div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</div>
	<cfelse>

		<div class="span8 columns">

			<h2>RSVP here If you don't have facebook</h2>

			<cfif structKeyExists(rc,"errors")>
				<div class="alert-message block-message error">
					<ul>
					<cfloop array="#rc.errors#" index="error">
							<li>#error#</li>
					</cfloop>
					</ul>
				</div>
			</cfif>

			<form method="post" action="#event.buildLink('rsvp.save')#">
				<cfinclude template="/cfformprotect/cffp.cfm" />
				<input type="hidden" name="year" value="#year(now())#">
				<div class="clearfix">
					<label for="name">Your Name <span class="required"> *</span></label>
					<div class="input">
						<input type="text" id="name" name="name" value="#rc.attendee.getName()#" class="xlarge">
					</div>
				</div>
				<div class="clearfix">
					<label for="email">Email Address <span class="required"> *</span></label>
					<div class="input">
						<input type="text" id="email" name="email" value="#rc.attendee.getEmail()#" class="xlarge">
					</div>
				</div>
				<div class="clearfix">
					<label id="optionsRadio">Will you attend <span class="required"> *</span></label>
					<div class="input">
						<ul class="inputs-list">
							<li>
								<label>
									<input type="radio" name="attending" value="yes" <cfif rc.attendee.getAttending() EQ 'yes'>checked</cfif>>
									<span>Yes</span>
								</label>
							</li>
							<li>
								<label>
									<input type="radio" name="attending" value="no" <cfif rc.attendee.getAttending() EQ 'no'>checked</cfif>>
									<span>No</span>
								</label>
							</li>
							<li>
								<label>
									<input type="radio" name="attending" value="maybe" <cfif rc.attendee.getAttending() EQ 'maybe'>checked</cfif>>
									<span>Maybe</span>
								</label>
							</li>
						</ul>
					</div>
				</div>
				<div class="clearfix">
					<label for="guests">Total Guests  <span class="required"> *</span></label>
					<div class="input">
						<select class="medium" name="guests" id="guests">
							<cfloop from="1" to="10" index="i">
								<option value="#i#" <cfif rc.attendee.getGuests() EQ i>selected</cfif>>#i#</option>
							</cfloop>
						</select>
						(including you)
					</div>
				</div>
				<div class="clearfix">
					<label for="comments">Comments (optional)</label>
					<div class="input">
						<textarea class="xlarge" id="comments" name="comments">#rc.attendee.getComments()#</textarea>
					</div>
				</div>
				<div class="actions" align="right">
					<input type="submit" name="submit" class="btn primary" value="RSVP">
				</div>
			</form>
		</div>

		<div class="span7 columns" align="center">
			<h2>RSVP on our facebook event page</h2>
			<a href="http://www.facebook.com/event.php?eid=193192557417024" target="_blank">
				<br/>
				#htmlHelper.img(src='includes/images/facebook_event_2011.png',width='325')#<br/>
				(Click here to register on facebook)
			</a>
		</div>

	</cfif>

</div>
</cfoutput>


	<!---
	<cfif structKeyExists(rc,"success")>

		<div class="success">
			Thank you! You have successfully registered for the Toys for Shots event. If you have any questions about the event please feel free to <a href="<cfoutput>#buildURL('contact')#</cfoutput>">contact us</a>.
		</div>

	<cfelse>

	<h2>Register on our Facebook Event Page</h2>
	<cfoutput>
		<div align="center">
			Click on the image below to visit our facebook event page
			<a href="http://www.facebook.com/event.php?eid=163131857033654" target="_blank">
				<img src="#linkToAsset('images/facebook_event_page.jpg')#" border="0">
			</a>
		</div>
	</cfoutput>

	<br/><br/>

	<h2>Register here If you don't have facebook</h2>

	<cfparam name="rc.name" default="">
	<cfparam name="rc.email" default="">
	<cfparam name="rc.attending" default="yes">
	<cfparam name="rc.guests" default="1">
	<cfparam name="rc.comments" default="">

	<cfoutput>
	<div id="rsvp">

	<cfif structKeyExists(rc,"errors")>
		<div class="error">
			<cfloop array="#rc.errors#" index="error">
				<cfoutput>#error.getMessage()#</cfoutput><br/>
			</cfloop>
		</div>
	</cfif>

	<form method="post" action="#buildURL('rsvp.save')#">
		<input type="hidden" name="year" value="#year(now())#">
		<p>
			<label for="name">Your Name</label><br/>
			<input type="text" name="name" class="text" value="#rc.name#">
		</p>
		<p>
			<label for="email">Email Address</label><br/>
			<input type="text" name="email" class="text" value="#rc.email#">
		</p>
		<p>
			<label for="attending">Will you attend</label><br/>
			<input type="radio" name="attending" value="yes" <cfif rc.attending EQ "yes">checked</cfif>> Yes
			<input type="radio" name="attending" value="no" <cfif rc.attending EQ "no">checked</cfif>> No
			<input type="radio" name="attending" value="maybe" <cfif rc.attending EQ "maybe">checked</cfif>> Maybe
		</p>
		<p>
			<label for="guests">Total Guests (including you)</label><br/>
			<select name="guests">
				<cfloop from="1" to="10" index="i">
					<option value="#i#" <cfif rc.guests EQ i>selected</cfif>>#i#</option>
				</cfloop>
			</select>
		</p>
		<p>
			<label for="comments">Add a comment (optional)</label><br/>
			<textarea name="comments" class="comments">#rc.comments#</textarea>
		</p>
		<p align="right">
			<input type="submit" id="btnRSVP" name="submit" value="RSVP Now" onSubmit="this.disabled=true">
		</p>

	</form>
	</div>
	</cfoutput>

	</cfif>
	--->

	<!---
	<cfset token = 'AAACEdEose0cBALz4kk9VDQrLMWxr4Wv8oqqegy1aMFPrZAArdzVIHxvgpVhBPAPZAXFR5ADqCxiQZBJkmNfpVIczjv3BVwxzNsTzoDlOgZDZD'>

	<cfhttp url="https://graph.facebook.com/193192557417024/attending" result="event">
		<cfhttpparam type="url" name="access_token" value="#token#">
	</cfhttp>

	<cfdump var="#event#">
	--->

--->