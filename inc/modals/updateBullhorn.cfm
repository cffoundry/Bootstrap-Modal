<cfoutput>
<div id="bullhornModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Bullhorn API Credentials</h4>
      </div>
      <div class="row">
        <div class="col-md-12" style="margin-left:10px;" align="left">To synch candidates and jobs you have on Bullhorn with First Interview, you will need to submit a ticket to Bullhorn Support to request API credentials/access. You will need to include in the ticket that "authorization will be done programmatically" and as such: 1) Redirect URI(s) will not be used and 2) there will be no terms of service. Once they have granted you API access, they will provide you with access information that needs to be entered and submitted below. All fields are required.</div>
      </div>
      <div class="modal-body">
        <div id="failureMessageBullhorn" style="display: none">
          <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">ERROR:</span>
            We were unable to update your settings as requested. Please try later or contact First Interview support.
            <div id="errorDetails" style="display: none; text-align: left;"><br></div>
          </div>
        </div>
        <div id="successMessageBullhorn" style="display: none">
          <div class="alert alert-success" role="alert">
            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
            <span class="sr-only">DONE:</span>
            Your API credentials were successfully updated.
          </div>
        </div>
        <form name="bullhornForm" id="bullhornForm" method="post" action="#CGI.SCRIPT_NAME#">	
        	<input type="hidden" name="tRecruiterID" value="#url.recID#">
          <input type="hidden" name="tApiCompany" value="Bullhorn">
          <input type="hidden" name="tAction" id="tAction" value="">
          <div class="form-group row" style="padding-top:5px;padding-bottom:5px;">
            <label for="userName" class="col-md-4 col-form-label">Client ID:</label>
            <div class="col-md-8">
              <input type="text" name="tClientID" value="#recInfo.tClientID#" class="form-control" id="tClientID" required>
            </div>
          </div>
          <div class="form-group row" style="padding-top:5px;padding-bottom:5px;">
            <label for="userName" class="col-md-4 col-form-label">Client Username:</label>
            <div class="col-md-8">
              <input type="text" name="tUsername" value="#recInfo.tUsername#" class="form-control" id="tUsername" required>
            </div>
          </div>
          <div class="form-group row" style="padding-top:5px;padding-bottom:5px;">
            <label for="userName" class="col-md-4 col-form-label">Client Secret/Password:</label>
            <div class="col-md-8">
              <input type="text" name="tPassword" value="#recInfo.tPassword#" class="form-control" id="tPassword" required>
            </div>
          </div>
          <!--- Footer --->
          <div class="modal-footer">
              <button type="button" 
                name="action" 
                value="delete" 
                class="submit-button-delete pull-left" 
                id="bullhornDeleteBtn"  
                formnovalidate >Delete</button>
              <button type="submit" 
                name="action"  
                value="update"
                class="submit_button" 
                id="bullhornSubmitBtn" 
                tabindex="6">Submit</button>
              <button type="button" 
                class="submit_button" 
                id="bullhornCloseBtn" 
                data-dismiss="modal">Cancel</button>
          </div>
      	</form>
      </div>
    </div>
  </div>
</div>
</cfoutput>
<!--- local JS event listeners --->
<script>
  // clear any displayed status messages in case modal is re-launched in same session
  $('#bullhornCloseBtn').click(function(){
    $('#successMessageBullhorn').hide();
    $('#failureMessageBullhorn').hide();
    $('#errorDetails').hide();
  });
  $('#bullhornSubmitBtn').click(function() {
    $('#tAction').val('Submit');
  });
  // clear form fields on delete
  $('#bullhornDeleteBtn').click(function() {
    var result = confirm('Do you really want to delete your Bullhorn credentials?');
    if(result) {
      $('#tAction').val('Delete');
      $('#tClientID').val('');
      $('#tUsername').val('');
      $('#tPassword').val('');
      $('#bullhornSubmitBtn').hide();
      $('#bullhornCloseBtn').html('Close');
      $('#bullhornForm').submit();
    }
  });

</script>