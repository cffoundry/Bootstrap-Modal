<cfscript>
	//ensure that url.recID is always pointing to a valid recruiter in case 
	//page was invoked w/o URL parameters
	url.recID = url.recID ?: session.user.recruiterID;


	//let's trim the URL param to limit potential for injection attacks
	url.recID = left(trim(url.recID),50);
	
	recObj = createObject("component","fi.CustomTags.Recruiters2018");
	
	recInfo = recObj.getRecruiterInfo(recruiterID = url.recID, tInclude = 'api');
	if(
			IsUserInRole("Administrator") 
			OR IsUserInRole("SuperAdmin") 
			OR (Trim(session.user.recruiterID) EQ trim(RecInfo.PrimaryContact))
			OR (Trim(session.user.recruiterID) EQ url.recID) 
			){
		rAccess = True;
	} else {
		rAccess = False;
	}
	access = False;
	
</cfscript>

<cfinclude template="/inc/html_header.cfm">
		<script>
			$(document).ready(function(){
				
				<cfoutput>
				$('##bullhornForm').on('submit', function(e) {
					e.preventDefault();
					$.post('inc/handlers/bullhornUpdate.cfm?recID=#url.recID#',$("##bullhornForm").serialize(),function(data,status){ 
						//de-serialize JSON into JS object
						var postResults = JSON.parse(data);
						if(postResults.status == 1) {
							//we successfully forwarded the candidate
							$('##successMessageBullhorn').show(); 
							$('##bullhornCloseBtn').html('Close');
						} else {
							//login failed - post failure and reload login form
							$('##failureMessageBullhorn').show();
							$('##errorDetails').html(postResults.errorMessage);
							$('##errorDetails').show();
							$('##bullhornCloseBtn').html('Abort');
						}
					}); 
					return false;
				});	
				</cfoutput>	
			});
		</script>
  <!--End Page Only Script-->
<cfinclude template="/inc/header.cfm">
	<!--Page Title Bar-->
  <cfoutput>
		
  	<div class="titleBar"><span class="Heading2">This is our title bar area</span></div> 
  <!--End Page Title Bar-->
  	<div id="indent" style="min-height:400px;">
  <!--Begin Page Content-->
		
  	<div class="container">
    	<div class="row">
      	<div class="col-md-10"> <!---main content--->
        	<div class="row">
          	<!--- Body --->
          	<p>This is a simple, streamlined example of how we use Bootstrap modal windows to collect user 
          	input and then act based on the data that is provided by the user.</p>
          	<p>This would typically be our main page content area.</p>
          	</div> 
         <br><hr>			
        </div> <!--end main content-->

        <div class="col-md-2">
	        <cfif rAccess eq true>
	        	<!--- Display recruiter menu --->
	        	<div class="row">
	            <div class="col-md-12">
	              <div class="pull-right"><cfinclude template="recMenu.cfm"></div>
	            </div>
	          </div>
	        </cfif>     
        </div>
      </div>      
    </div>
    
  	<!--- Modal Windows ---> 
    <cfinclude template="inc/modals/updateBullhorn.cfm"/>
    
  </cfoutput>  
  <!--End Page Content-->
		</div>
  <!--Begin Footer-->
  	<br /><br />
  	<cfinclude template="/inc/footer_rec.cfm">  
  <!--End Footer-->