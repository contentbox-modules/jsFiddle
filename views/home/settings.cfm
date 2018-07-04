<cfoutput>
<!--============================Main Column============================-->
<div class="col-md-9">
	<div class="panel panel-primary">
		<!--- Body Header --->
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-cogs"></i> jsFiddle Settings</h3>
		</div>
		<!--- Body --->
		<div class="panel-body">
			#getInstance("MessageBox@cbmessagebox").renderit()#

			<p>
				Below you can modify the settings used by the jsFiddle module. 
			</p>
			<p>
				In your editors you will get a new icon for inserting fiddles from your configured accounts (<img src="#event.getModuleRoot('jsFiddle')#/includes/cbjsFiddle/jsFiddle.png" alt="icon" />).
				You'll need a connection to the internet to use this module since it needs to make API calls to <em>http://jsfiddle.net</em>.
			</p>

			#html.startForm(action="cbadmin.module.jsFiddle.home.saveSettings",name="settingsForm",id="settingsForm",class="form-vertical")#

				<fieldset>
				<legend><strong>Options</strong></legend>
					#html.textField(
						name = "width", 
						label = "Default Fiddle Width:", 
						value ="#prc.settings.width#",
                        class = "form-control",
						wrapper = "div class=controls",
						labelClass = "control-label",
						groupWrapper = "div class=form-group", 
						required = "required", 
						default = "100%"
					)#
					#html.textField(
						name = "height", 
						label = "Default Fiddle Height:", 
						value = "#prc.settings.height#",
						class = "form-control",
						wrapper = "div class = controls",
						labelClass = "control-label",
						groupWrapper = "div class = form-group", 
						default = "300"
					)#
					#html.textField(
						name = "cachetime", 
						label = "Cache Time (Days):",
						value = "#prc.settings.cachetime#",
						class = "form-control",
						wrapper = "div class = controls",
						labelClass = "control-label",
						groupWrapper = "div class = form-group",
						default = "5")#
					<p><b>Tabs to Include</b></p>
                    
                    <div class="checkbox">
                    	<label>
                    		<input type="checkbox" name="tabs" value="result" <cfif listContains( prc.settings.tabs, "result" )>checked = true</cfif> /> Result
                    	</label>
                    </div>
                    <div class="checkbox">
                    	<label>
                    		<input type="checkbox" name="tabs" value="js" <cfif listContains( prc.settings.tabs, "js" )>checked = true</cfif> /> JS
                    	</label>
                    </div>
                    <div class="checkbox">
                    	<label>
                    		<input type="checkbox" name="tabs" value="resources" <cfif listContains( prc.settings.tabs, "resources" )>checked = true</cfif> /> Resources
                    	</label>
                    </div>
                    <div class="checkbox">
                    	<label>
                    		<input type="checkbox" name="tabs" value="css" <cfif listContains( prc.settings.tabs, "css" )>checked = true</cfif> /> CSS
                    	</label>
                    </div>
                    <div class="checkbox">
                    	<label>
                    	<input type="checkbox" name="tabs" value="html" <cfif listContains( prc.settings.tabs, "html" )>checked = true</cfif> /> HTML
                    	</label>
                    </div>                 
					#html.hiddenField(name="users", value="#prc.settings.users#")#
					<div class="row">
						<div class="col-lg-6">
								<label class="control-label">jsFiddle Users:</label>
							<div class="input-group">
					  			<input type="text" class="form-control" name="jsfiddleuser" value="">
								<span class="input-group-btn add_jsfiddleuser">
									<button class="btn btn-success" type="button"><i class="fa fa-plus add_jsfiddleuser"></i></button>
								</span>
							</div><!-- /input-group -->
						</div><!-- /.col-lg-6 -->
					</div><!-- /.row -->
                    <ul class="jsfiddleusers">
                    <cfif listLen( prc.settings.users )>
						<cfloop list="#prc.settings.users#" index="user">
							<li class="jsfiddleuser"><img height="16" src="#event.getModuleRoot('jsFiddle')#/includes/delete.png" class="delete_jsfiddleuser" /><span>#user#</span></li>
						</cfloop>
					</cfif>
					</ul>

				</fieldset>

				<!--- Submit --->
				<div class="form-actions">
					<cfif listLen( prc.settings.users )>
                   		#html.button(value="Update Cached Fiddles",class="btn",id="updatefiddles",title="Update cached fiddles for all users")#
					</cfif>
					#html.submitButton(value="Save Settings",class="btn btn-danger",title="Save the jsFiddle settings")#
				</div>

			#html.endForm()#

		</div>
	</div>
</div>
<!--============================Sidebar============================-->
<div class="col-md-3">

	<!--- Info Box --->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">About This Module</h3>
		</div>
		<div class="panel-body">
			<p>
			    This module is a just a simple, but handy way to insert "fiddles" from the excellent <a href="http://jsfiddle.net">jsfiddle.net</a>.
			</p>
            <p>
                With this module, you can set defaults for the size of iFrames that are embedded, as well as which "resource" tabs to include on each fiddle.
            </p>
            <p>
                Finally, if you have a number of jsfiddle.net accounts that you'd like to track, simply add them here, and then you'll be able to select from those users' fiddles when inserting a fiddle into a page or entry.
            </p>
            <p>Enjoy!</p>
		</div>
	</div>

</div>
<!--End sidebar-->

</cfoutput>