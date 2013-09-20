<cfset cffp = application.wirebox.getInstance('cfformProtect')/>

<cfparam name="rc.mailsent" default="false">

<div class="row">
	<div class="span8">

		<h1>Contact Us</h1>

		<cfif rc.mailsent>
			<div class="alert alert-success">
	       		<p>Thank you for sending us your feedback. If your comments require a response you will be contacted shortly.</p>
	      	</div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<cfelse>
			<cfoutput>
			<p>Please feel free to use the form below to send us your comments, suggestions or feedback regarding the toys for shots event.</p>

			<cfif structKeyExists(rc,"errors")>
				<div class="alert alert-block alert-error">
					<ul>
					<cfloop array="#rc.errors#" index="error">
							<li>#error#</li>
					</cfloop>
					</ul>
				</div>
			</cfif>

			<form id="frmContact" method="post" action="#event.buildLink('contact.save')#" class="form-horizontal">
				<cfinclude template="/cfformprotect/cffp.cfm" />
				<div class="control-group">
					<label class="control-label" for="name"><span class="required">*</span> Name</label>
					<div class="controls">
						<input type="text" id="name" name="name" class="input-xlarge" value="#rc.contact.getName()#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email"><span class="required">*</span> Email Address</label>
					<div class="controls">
						<input type="text" id="email" name="email" class="input-xlarge" value="#rc.contact.getEmail()#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="phone">Phone</label>
					<div class="controls">
						<input type="text" id="phone" name="phone" class="input-xlarge" value="#rc.contact.getPhone()#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="comments"><span class="required">*</span> Comments</label>
					<div class="controls">
						<textarea class="input-xlarge" id="comments" name="comments" rows="3">#rc.contact.getComments()#</textarea>
						<p class="help-block">We are still searching for donations & volunteers so please let us know if you can help with either.</p>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" name="submit" class="btn btn-primary">Send</button>
				</div>
			</form>
			</cfoutput>

		</cfif>

	</div>

	<div class="span4" align="center">
		<br/>
		<div style="width:195px; text-align:center;" ><iframe  src="http://www.eventbrite.com/countdown-widget?eid=4811891497" frameborder="0" height="333" width="195" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe><div style="font-family:Helvetica, Arial; font-size:10px; padding:5px 0 5px; margin:2px; width:195px; text-align:center;" ><a style="color:##ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com/r/ecount">Event Registration Online</a><span style="color:##ddd;"> for </span><a style="color:##ddd; text-decoration:none;" target="_blank" href="http://http://toysforshots.eventbrite.com?ref=ecount">5th Annual Toys For Shots</a> <span style="color:##ddd;">powered by</span> <a style="color:##ddd; text-decoration:none;" target="_blank" href="http://www.eventbrite.com?ref=ecount">Eventbrite</a></div></div>		
	</div>

</div>