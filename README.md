# Bootstrap Modal
This has been created as an example of how the ColdFusion framework launches and utilizes Bootstrap modal windows. This was created by pulling live code for our Bullhorn API OAuth credentials interface and, as such, references to the Bullhorn SaaS API are still present.

This example code set is comprised of the following files:
* mainPage.cfm - this is the main page that you would launch for the demo - all referred to as the calling page.
* recMenu.cfm - this is a menu that is imported into the mainPage with a link to the modal.
* inc/footer.cfm - footer file - imported by mainPage.cfm
* inc/header.cfm - header file - imported by mainPage.cfm
* inc/html_header.cfm - header file with JS and CSS file imports, including bootstrap - imported by mainPage.cfm
* inc/modals/updateBullhorn.cfm - this is the modal windows content that is imported by and launched from mainPage.cfm
* inc/handlers/bullhornUpdate.cfm - this is the file called by the jQuery post() in mainPage.cfm when the form in the modal window is submitted.

The basic logic flow is that mainPage.cfm loads all of the necessary elements needed, including files with the Bootstrap and jQuery libraries, as well as the modal window. The modal window is loaded via a cfinclude, making it part of the page content for mainPage.cfm, with the outer wrapping div layer hidden by default so it isn't visible on load.

Because the modal window is part of the mainPage content, any form fields, div elements, etc. should use unique names and id attributes to prevent conflicts with other modals or mainPage content when present.

The modal window presents a simple form for collecting a user's OAuth API credentials and provides three action buttons:
* Delete - this is to delete the credentials and, as such, clears any data in the form fields, turns off form validation (as all fields are typically required), removes the Submit button (to avoid confusion for the user), and submits the form.
* Submit - this is a standard form submit button
* Cancel - This closes the modal and is renamed "Close" when either the Delete or Submit button is used to make the UI more intuitive.

When the form is submitted by either the Submit or Delete button, a jQuery listener is triggered on mainPage that invokes a post() method that serializes the form data, posts the data to the modal's handler file (bullhornUpdate.cfm), and establishes a callback function for the response.

The handler, bullhornUpdate.cfm passes the form structure (which contains all of the submitted modal's data as a result of the jQuery post call) to a CFC ("bullhorn") method ("putRecApiCredentials") that is local to the file system. The CFC method call will return a ColdFusion structure, which is then serialized into a JSON object and written to the screen output. Since this handler wasn't called by a user but rather a jQoery Post(), the written output is passed back into the callback function defined by the post().

The callback function parses the JSON response from the handler and displays messages in the modal to indicate the success/failure of the form submission. If debugging is activated, the specific error message thrown by ColdFusion (if any) can be outputted to the modal window as well.
