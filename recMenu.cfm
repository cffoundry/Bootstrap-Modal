<div class="dropdown">
  <button class="btn btn-default dropdown-toggle submit_button" style="width:160px; margin-bottom:-1px;" type="button" id="dropdownMenu1" data-toggle="dropdown">
    <span class="glyphicon glyphicon-cog"></span> Recruiter Options
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="recruiterInfoEdit.cfm">Edit Profile</a></li>
    <li><a href="##loginModal" data-toggle="modal">Edit Login</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="##settingsModal" data-toggle="modal">Manage My Settings</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="##newPhotosModal" data-toggle="modal">Add a New Picture</a></li>
    <li><a href="##setPhotosModal" data-toggle="modal">Manage Pictures</a></li>
    <li><a href="##groupsModal" data-toggle="modal">Manage Email Groups</a></li>
    <li role="separator" class="divider"></li>
    <!--- NOTE: we add the onclick event to show the submit button in case it was hidden by JS from a 
      previous modal window launch (e.g. the delete button was used) --->
    <li><a href="##bullhornModal" data-toggle="modal" onclick="$('#bullhornSubmitBtn').show();">Manage Bullhorn API Credentials</a></li>
  </ul>
</div>