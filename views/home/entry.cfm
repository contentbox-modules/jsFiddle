<cfoutput>
<div class="modal-dialog modal-lg" role="document" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Insert jsFiddle</h4>
		</div>
		#html.startForm(name="jsFiddleForm",id="jsFiddleForm",class="form-vertical")#
			<div class="modal-body">
				<div class="tabbable tabs-left">
					<!--- Navigation Bar --->
					<ul class="nav nav-tabs">
					    <cfif arrayLen( prc.settings.fiddles )>
						<li><a href="##user_fiddles" data-toggle="tab">User Fiddles</a></li>
						</cfif>
		                <li class="active"><a href="##adhoc_fiddles" data-toggle="tab">Fiddle By URL</a></li>
					</ul>
					<div class="tab-content">
					    <cfif arrayLen( prc.settings.fiddles )>
						<!--- Fiddles By User --->
						<div class="tab-pane" id="user_fiddles">
		    				<fieldset>
		    					<legend><strong>User Fiddles</strong></legend>
		    					<p>Choose a user below</p>
		    					<select name="user" class="form-control" id="userselect">
		    					    <option value="">Select a User</option>
		                            <cfloop array="#prc.settings.fiddles#" index="user">
										<option value="#user.user#">#user.user#</option>
									</cfloop>
		    					</select>
		    				</fieldset>
		                    <fieldset id="userfiddles">
		    					<legend><img src="#event.getModuleRoot('jsFiddle')#/includes/cbjsFiddle/jsfiddle.png" alt="modifiers"/> <strong>Fiddles</strong></legend>
		    					<div id="userfiddle-list"></div>
		    				</fieldset>
						</div>
						</cfif>
						<!--- Manual URL entry for fiddle --->
						<div class="tab-pane active" id="adhoc_fiddles">
							<fieldset>
								<legend><strong>Fiddle By URL</strong></legend>
								<p>Fiddle doesn't belong to one of your configured users? No problem, just enter the URL for the fiddle below!</p>
		                        <div id="fiddlebyurl">
		                            #html.textField(name="url", label="Fiddle URL:", class="form-control", required="required")#
		                            #html.textField(name="title", label="Fiddle Title:", class="form-control", required="required")#
		                            #html.textField(name="height", label="Fiddle Height:", value="#prc.settings.height#", class="form-control", required="required")#
		                            #html.textField(name="width", label="Fiddle Width:", value="#prc.settings.width#", class="form-control", required="required")#
		        					<label>Tabs to Include</label>
		                            <input type="checkbox" name="tabs" value="result" <cfif listContains( prc.settings.tabs, "result" )>checked=true</cfif> /> Result
		                            <input type="checkbox" name="tabs" value="js" <cfif listContains( prc.settings.tabs, "js" )>checked=true</cfif> /> JS
		                            <input type="checkbox" name="tabs" value="resources" <cfif listContains( prc.settings.tabs, "resources" )>checked=true</cfif> /> Resources
		                            <input type="checkbox" name="tabs" value="css" <cfif listContains( prc.settings.tabs, "css" )>checked=true</cfif> /> CSS
		                            <input type="checkbox" name="tabs" value="html" <cfif listContains( prc.settings.tabs, "html" )>checked=true</cfif> /> HTML
		                        </div>
							</fieldset>
						</div>
					</div> <!--- end main_column --->

				</div> <!--- End vertical nav --->
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" onclick="insertFiddleByURL( this );return false;"> Insert Fiddle </button>
			</div>
		#html.endForm()#
		</div>
	</div>
</div>
</cfoutput>