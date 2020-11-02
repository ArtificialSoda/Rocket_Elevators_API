/*** AUTHOR: Fabien H. Dimitrov  ***************************************************************/
/*** CONTEXT: Rocket Elevators (Codeboxx) ******************************************************/
/*** DESCRIPTION: Validates the contact request form @ 'index.html' on the client-side, 
                  and then sends the data (lead) to the mySQL database *************************/

// Prevents code from running before the HTML page is finished loading (ready)
$(document).ready(function(){

	// Data fields to send to Leads table of mySQL database
	var contactFullName;
	var companyName;
	var email;
	var phone;
	var projectName;
	var projectDescription;
	var department;
	var message;
	var attachedFile;

	var lead; 

	// Runs every 0.5 seconds
	windows.setInterval(() => {

		// Listen for input changes in the fields
		contactFullName 	= $("#contact-name").val();
		companyName 		= $("#contact-business").val();
		email 				= $("#contact-email").val();
		phone 				= $("#contact-phone").val();
		projectName 		= $("#contact-project-name").val();
		projectDescription 	= $("#contact-description").val();
		department 			= $("#contact-department").val();
		message 			= $("#contact-message").val();
		attachedFile 		= $("#attached-file").val();

		// Save Leads object for AJAX
		lead = {

			contact_full_name: contactFullName,
			company_name: companyName,
			email: email, 
			phone: phone,
			project_name: projectName,
			project_description: projectDescription,
			department: department,
			message: message,
			attached_file: attachedFile
		}
		console.log(lead);
	}, 500);

	// Send AJAX POST containing lead data to Leads table in mySQL database
    // var submitForm = $("#contact-form"); // Contact form to be submitted
    // submitForm.submit((e) => {
    //     $.ajax({
    //         type: "POST",
    //         url: "/contact/create",
    //         data: {leads: lead},
    //         dataType: 'json',            
    //         success: (data) => { 
    //             alert("Contact form successfully sent!");
    //         }
    //     })

    //     console.log("AJAX SENT");
    //     console.log(lead);
    //     e.preventDefault();
    // })


})

