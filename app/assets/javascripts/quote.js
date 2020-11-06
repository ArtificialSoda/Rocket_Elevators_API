/*** AUTHOR: Fabien H. Dimitrov  ***************************************************************/
/*** CONTEXT: Rocket Elevators (Codeboxx) ******************************************************/
/*** DESCRIPTION: Validates the quote request form @ 'quote.html' on the client-side, 
                  and then calculates estimated cost of client's elevator project
                  ADD-ON: Sends the quote to the mySQL database ********************************/



// Prevents code from running before the HTML page is finished loading (ready)
$(document).ready(function() {


    // Fields that are sent to the Quote table in the mySQL database
    var fullName;
    var emailAddress;
    var phoneNumber;
    var buildingType;
    var numApartments;
    var numFloors;
    var numBasements;
    var numCages;
    var numParkingSpaces;
    var numTenantCompanies;
    var numBusinesses;
    var maxOccupantsPerFloor;
    var hoursOfActivity;
    var productGrade;
    var totalElevators = 0;
    var elevatorsCost = 0;
    var installationCost = 0;
    var totalCost = 0;

    var quote;

    /* Do this after client has clicked on the Confirm button ***/
    var confirmBtn = $("#building-confirm-btn");
    confirmBtn.click(function() {

        // Show results section
        var resultsDiv = $("#results");
        resultsDiv.show();

        // Get user info
        fullName = $("#full-name").val();
        emailAddress = $("#email-quote").val();
        phoneNumber = $("#phone-quote").val();

        // Get building type
        var building = $("#building-type").val();
        buildingType = building;

        var inputDivs = []; // Stores the input divs 
        var inputs = []; // Stores the inputs

        // Get six input divs and put them in the inputDivs array
        var q1 = $("#q1");
        var q2 = $("#q2");
        var q3 = $("#q3");
        var q4 = $("#q4");
        var q5 = $("#q5");
        var q6 = $("#q6");

        inputDivs.push(q1, q2, q3, q4, q5, q6);

        // Get six inputs from the 6 input fields and put them in the inputs array
        var input1 = $("#question-1");
        var input2 = $("#question-2");
        var input3 = $("#question-3");
        var input4 = $("#question-4");
        var input5 = $("#question-5");
        var input6 = $("#question-6");

        inputs.push(input1, input2, input3, input4, input5, input6);

        // Reset all input fields when button is pressed, just in case it is pressed more than once
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].val(NaN);
        }

        // Get labels for the six input divs and put them in the divLabels array
        var q1Label = $("#q1-label");
        var q2Label = $("#q2-label");
        var q3Label = $("#q3-label");
        var q4Label = $("#q4-label");
        var q5Label = $("#q5-label");
        var q6Label = $("#q6-label");

        var numDivsToShow = 0; // Change label values based on building type

        if (building === "Residential") {
            numDivsToShow = 3;

            q1Label.text("The number of apartments in the building");
            q2Label.text("The number of floors contained in the building");
            q3Label.text("The number of basements contained in the building");
        } else if (building === "Commercial") {
            numDivsToShow = 5;
            q1Label.text("The number of distinct businesses");
            q2Label.text("The number of floors contained in the building");
            q3Label.text("The number of basements contained in the building");
            q4Label.text("The number of parking space available");
            q5Label.text("The number of elevators cages to be deployed");
        } else if (building === "Corporate") {
            numDivsToShow = 5;
            q1Label.text("The number of separate tenant companies");
            q2Label.text("The number of floors contained in the building");
            q3Label.text("The number of basements contained in the building");
            q4Label.text("The number of parking space available");
            q5Label.text("The maximum number of occupants per floor");
        } else {
            numDivsToShow = 6;
            q1Label.text("The number of distinct businesses");
            q2Label.text("The number of floors contained in the building");
            q3Label.text("The number of basements contained in the building");
            q4Label.text("The number of parking space available");
            q5Label.text("The maximum number of occupants per floor");
            q6Label.text("The number of hours of activity of the building per day");

        }

        // Show/hide input divs based on building type
        for (let i = 0; i < numDivsToShow; i++) {
            inputDivs[i].show();
        }
        for (let i = numDivsToShow; i < inputDivs.length; i++) {
            inputDivs[i].hide();
        }

        // Resets results if 'Confirm' button is pressed again
        $("#num-shafts").val(0);
        $("#elevator-price").val("$0.00");
        $("#installation-price").val("$0.00");
        $("#total-estimate").val("$0.00");

    })

    // Runs every 0.5 seconds
    window.setInterval(function() {
        if (buildingType === "Residential") {
            /* 
            If the type of building is Residential, divide the number of apartments 
            by the number of floors (excluding the number of basements) to obtain 
            an average of apartments per floor. There is 1 elevator for every 6 apartments per floor.
            If the apartment has more than 20 stories, it is necessary to provide an additional
            column of elevators and thus double the number of elevator shafts. 
            A new column is therefore added to each new group of 20 stories.
            */

            numApartments = $("#question-1").val();
            numFloors = $("#question-2").val();
            numBasements = $("#question-3").val();
            numCages = null;
            numParkingSpaces = null;
            numTenantCompanies = null;
            numBusinesses = null;
            maxOccupantsPerFloor = null;
            hoursOfActivity = null;

            var avgApartmentsPerFloor = Math.ceil(numApartments / (numFloors - numBasements));
            var numElevatorsPerFloor = Math.ceil(avgApartmentsPerFloor / 6);
            var numColumns = Math.ceil(numFloors / 20);

            if (numColumns != 0)
                totalElevators = numElevatorsPerFloor * numColumns;
            else
                totalElevators = 0;


        } else if (buildingType === "Commercial") {
            /*
            If the type of building is Commercial, the number of elevator shafts 
            to be deployed is specified and the estimated number of cages is equal to 
            the number required.
            */

            numApartments = null;
            numFloors = $("#question-2").val();
            numBasements = $("#question-3").val();
            numCages = $("#question-5").val();
            numParkingSpaces = $("#question-4").val();
            numTenantCompanies = null;
            numBusinesses = $("#question-1").val();
            maxOccupantsPerFloor = null;
            hoursOfActivity = null;

            totalElevators = numCages;
        } else if (buildingType === "Corporate") {
            /* 
            If the type of building is Corporate or Hybrid, multiply the number of occupants per floor 
            by the number of floors (including the number of basements) to obtain the total number 
            of occupants. The number of elevators required is determined by the number of occupants 
            divided by 1000. The number of stories (including the number of basements) is 
            divided by 20 to obtain the number of elevator columns required. 
            Then divide the number of elevators by the number of columns to get the 
            number of elevators per column. The total number of elevators is determined by 
            the number of elevators per column multiplied by the number of columns.
            */

            numApartments = null;
            numFloors = $("#question-2").val();
            numBasements = $("#question-3").val();
            numCages = null;
            numParkingSpaces = $("#question-4").val();
            numTenantCompanies = $("#question-1").val();
            numBusinesses = null;
            maxOccupantsPerFloor = $("#question-5").val();
            hoursOfActivity = null;

            var totalOccupants = maxOccupantsPerFloor * numFloors;
            var numElevators = Math.ceil(totalOccupants / 1000);
            var numColumns = Math.ceil(numFloors / 20);

            if (numColumns != 0)
                totalElevators = Math.ceil(numElevators / numColumns) * numColumns;
            else
                totalElevators = 0;
        } else if (buildingType === "Hybrid") {
            /* 
            If the type of building is Corporate or Hybrid, multiply the number of occupants per floor 
            by the number of floors (including the number of basements) to obtain the total number 
            of occupants. The number of elevators required is determined by the number of occupants 
            divided by 1000. The number of stories (including the number of basements) is 
            divided by 20 to obtain the number of elevator columns required. 
            Then divide the number of elevators by the number of columns to get the 
            number of elevators per column. The total number of elevators is determined by 
            the number of elevators per column multiplied by the number of columns.
            */

            numApartments = null;
            numFloors = $("#question-2").val();
            numBasements = $("#question-3").val();
            numCages = null;
            numParkingSpaces = $("#question-4").val();
            numTenantCompanies = null;
            numBusinesses = $("#question-1").val();
            maxOccupantsPerFloor = $("#question-5").val();
            hoursOfActivity = $("#question-6").val();

            var totalOccupants = maxOccupantsPerFloor * numFloors;
            var numElevators = Math.ceil(totalOccupants / 1000);
            var numColumns = Math.ceil(numFloors / 20);

            if (numColumns != 0)
                totalElevators = Math.ceil(numElevators / numColumns) * numColumns;
            else
                totalElevators = 0;
        }

        // Prevents NaN errors from displaying on the console when the estimate hasnt been calculated yet
        if (!isNaN(totalElevators))
            $("#num-shafts").val(totalElevators);

        // Get product line choice and calculate cost
        productGrade = $("input[name='product-line']:checked").val();
        if (productGrade === "Standard") {
            elevatorsCost = totalElevators * 7565;
            installationCost = elevatorsCost * 0.1;
        } else if (productGrade === "Premium") {
            elevatorsCost = totalElevators * 12345;
            installationCost = elevatorsCost * 0.13;
        } else if (productGrade === "Excelium") {
            elevatorsCost = totalElevators * 15400;
            installationCost = elevatorsCost * 0.16;
        }

        // Display cost
        $("#elevator-price").val("$" + elevatorsCost.toFixed(2));
        $("#installation-price").val("$" + installationCost.toFixed(2));
        if (!isNaN(elevatorsCost) && !isNaN(installationCost)) {
            totalCost = elevatorsCost + installationCost;
            $("#total-estimate").val("$" + totalCost.toFixed(2));
        }

        // Save Quote object for AJAX
        quote = {

            full_name: fullName,
            email: emailAddress,
            phone: phoneNumber,
            building_type: buildingType,
            no_of_appartments: numApartments,
            no_of_floors: numFloors,
            no_of_basements: numBasements,
            no_of_elevators_cages: numCages,
            no_of_parking_spaces: numParkingSpaces,
            no_of_tenant_companies: numTenantCompanies,
            no_of_distinct_businesses: numBusinesses,
            no_of_daily_hours_of_activity: hoursOfActivity,
            no_of_elevators: totalElevators,
            product_grade: productGrade,
            no_of_elevators: totalElevators,
            elevator_cost: "$" + elevatorsCost.toFixed(2),
            installation_cost: "$" + installationCost.toFixed(2),
            total_cost: "$" + totalCost.toFixed(2)
        }



    }, 500);


    // Send AJAX POST containing quote data to Quotes table in mySQL database
    var submitForm = $("#product-lines-form");
    submitForm.submit((e) => {
        $.ajax({
            type: "POST",
            url: "/quote/create",
            data: quote,
            dataType: 'json',
            success: (data) => {
                alert("Quote successfully sent!");
            }
        })

        console.log("AJAX SENT");
        console.log(quote);
        e.preventDefault();
    })
})