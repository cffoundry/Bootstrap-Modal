<cfscript>
local.bDebug = false;
local.sResults = {"status"=0,"errorMessage"=""};

if(isDefined('form.tRecruiterID')) {
	local.oRecObj = createObject("component", "fi.CustomTags.recruiters2018");

	//Process local form submission
	local.sUpdate = local.oRecObj.putRecApiCredentials(argumentcollection = form);
	
	if(local.sUpdate.status == true ) {
		local.sResults.status = 1;
	} else if(local.bDebug) {
		local.sResults.errorMessage = local.sUpdate.tErrorMessage;
	}
}
// Serialize CF structure into JSON object for JS callback function
local.tSerializedOutput = serializeJSON(local.sResults);
WriteOutput(local.tSerializedOutput);
</cfscript>