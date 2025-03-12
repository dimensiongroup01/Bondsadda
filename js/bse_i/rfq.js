document.addEventListener("DOMContentLoaded", function () {
    toggleFields();
    toggleDealTime();
    populateDropdown('ddlDealTimeHours', 0, 23, 1);
    populateDropdown('ddlDealTimeMinutes', 0, 59, 1);
    updateSettleType();
    toggleBrokerName();

    // Attach event listeners
    var ddlQuoteType = document.getElementById('ddlQuoteType');
    var chkGFD = document.getElementById('chkGFD');
    var ddlProduct = document.getElementById('ddlProduct');
    var ddlUserType = document.getElementById('ddlUserType');

    if (ddlQuoteType) ddlQuoteType.addEventListener('change', toggleFields);
    if (chkGFD) chkGFD.addEventListener('change', toggleDealTime);
    if (ddlProduct) ddlProduct.addEventListener('change', updateSettleType);
    if (ddlUserType) ddlUserType.addEventListener('change', toggleBrokerName);
});

// ✅ Toggle fields based on Quote Type (BID/OFFER)
function toggleFields() {
    var ddlQuoteType = document.getElementById('ddlQuoteType');
    if (!ddlQuoteType) return;

    var quoteType = ddlQuoteType.options[ddlQuoteType.selectedIndex].text.trim();
    var bidFields = getElements(['txtBidValue', 'txtBidMinValue', 'ddlBidYieldType', 'txtBidYieldValue', 'txtBidPrice']);
    var offerFields = getElements(['txtOfferValue', 'txtOfferMinValue', 'ddlOfferYieldType', 'txtOfferYieldValue', 'txtOfferPrice']);

    if (quoteType === "BID") {
        setFieldsState(bidFields, true);
        setFieldsState(offerFields, false);
    } else if (quoteType === "OFFER") {
        setFieldsState(bidFields, false);
        setFieldsState(offerFields, true);
    } else {
        setFieldsState(bidFields, false);
        setFieldsState(offerFields, false);
    }
}

// ✅ Enable/disable fields
function setFieldsState(fields, enable) {
    fields.forEach(function (element) {
        if (element) {
            element.disabled = !enable;
            if (!enable) element.value = ""; // Clear value when disabled
        }
    });
}

// ✅ Toggle Deal Time fields based on GFD checkbox
function toggleDealTime() {
    var chkGFD = document.getElementById('chkGFD');
    var hoursDropdown = document.getElementById('ddlDealTimeHours');
    var minutesDropdown = document.getElementById('ddlDealTimeMinutes');

    if (!chkGFD || !hoursDropdown || !minutesDropdown) return;

    if (chkGFD.checked) {
        hoursDropdown.disabled = false;
        minutesDropdown.disabled = false;
    } else {
        hoursDropdown.disabled = true;
        minutesDropdown.disabled = true;
        hoursDropdown.value = "";
        minutesDropdown.value = "";
    }
}

// ✅ Populate dropdown with hours/minutes
function populateDropdown(selector, start, end, step) {
    var dropdown = document.getElementById(selector);
    if (!dropdown) return;

    dropdown.innerHTML = "";
    for (var i = start; i <= end; i += step) {
        var value = i.toString().padStart(2, "0");
        var option = document.createElement("option");
        option.value = value;
        option.text = value;
        dropdown.appendChild(option);
    }
}

// ✅ SettleType logic based on Market selection
function updateSettleType() {
    var ddlProduct = document.getElementById('ddlProduct');
    var ddlSettleType = document.getElementById('ddlSettleType');

    if (!ddlProduct || !ddlSettleType) return;

    if (ddlProduct.value === "GSEC") {
        ddlSettleType.value = "T+1"; // Set to T+1 when Market is GSEC
    }
}

// ✅ Toggle Broker Name field based on User Type selection
function toggleBrokerName() {
    var ddlUserType = document.getElementById('ddlUserType');
    var brokerNameContainer = document.getElementById("brokerNameContainer");

    if (!ddlUserType || !brokerNameContainer) return;

    if (ddlUserType.value === "BROKERED") {
        brokerNameContainer.style.display = "block";
    } else {
        brokerNameContainer.style.display = "none";
    }
}

// ✅ Handle partial postbacks in UpdatePanel
if (typeof Sys !== "undefined" && Sys.WebForms) {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        toggleFields();
        toggleDealTime();
        updateSettleType();
        toggleBrokerName();
    });
}

// ✅ Utility: Get multiple elements by IDs
function getElements(ids) {
    return ids.map(id => document.getElementById(id)).filter(el => el);
}

