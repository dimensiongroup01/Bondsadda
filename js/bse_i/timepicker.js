window.onload = function () {
    var executionTimeInput = document.getElementById("<%= txtExecutionTime.ClientID %>");

    if (executionTimeInput) {
        flatpickr(executionTimeInput, {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr: true,
            minuteIncrement: 5 // Step by 5 minutes
        });
    } else {
        console.error("Execution Time input field not found.");
    }
};
