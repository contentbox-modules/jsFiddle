<cfscript>
	event.paramValue( "url", "" );
	event.paramValue( "title", "" );
	event.paramValue( "height", prc.settings.height );
	event.paramValue( "width", prc.settings.width );
	event.paramValue( "css", false );
	event.paramValue( "js", false );
	event.paramValue( "html", false );
	event.paramValue( "resources", false );
	event.paramValue( "result", false );
</cfscript>
<cfoutput>
<div class="modal-dialog modal-lg" role="document" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Edit jsFiddle</h4>
		</div>
		#html.startForm(name="jsFiddleForm",id="jsFiddleForm",class="form-vertical")#
			<div class="modal-body">
				<!-- Content area that wil show the form and stuff -->
				<fieldset style="margin: 0 10px;">
					<legend><strong>Fiddle Details</strong></legend>
			        <div id="fiddlebyurl">
			            #html.textField(name="url", label="Fiddle URL:", class="form-control", required="required", value="#event.getValue( 'url' )#")#
			            #html.textField(name="title", label="Fiddle Title:", class="form-control", required="required", value="#event.getValue( 'title' )#")#
			            #html.textField(name="height", label="Fiddle Height:", value="#event.getValue( 'height' )#", class="form-control", required="required")#
			            #html.textField(name="width", label="Fiddle Width:", value="#event.getValue( 'width' )#", class="form-control", required="required")#
						<label>Tabs to Include</label>
			            <input type="checkbox" name="tabs" value="result" <cfif event.getValue( "result" )>checked=true</cfif> /> Result
			            <input type="checkbox" name="tabs" value="js" <cfif event.getValue( "js" )>checked=true</cfif> /> JS
			            <input type="checkbox" name="tabs" value="resources" <cfif event.getValue( "resources" )>checked=true</cfif> /> Resources
			            <input type="checkbox" name="tabs" value="css" <cfif event.getValue( "css" )>checked=true</cfif> /> CSS
			            <input type="checkbox" name="tabs" value="html" <cfif event.getValue( "html" )>checked=true</cfif> /> HTML
			        </div>
				</fieldset>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="button" onclick="updateFiddle( this );return false;"> Update Fiddle </button>
			</div>
		#html.endForm()#
	</div>
</div>
</cfoutput>