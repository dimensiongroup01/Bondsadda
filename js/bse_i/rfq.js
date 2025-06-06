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

// RFQ


// Show receipt modal and populate fields from response data
function showReceipt(responseData) {
    document.getElementById("bidrfqordernumber").textContent = responseData.bidrfqordernumber;
    document.getElementById("isinnumber").textContent = responseData.isinnumber;
    document.getElementById("bidprice").textContent = responseData.bidprice.toFixed(2);
    document.getElementById("bidquantity").textContent = responseData.bidquantity;
    document.getElementById("bidvalue").textContent = responseData.bidvalue.toFixed(2);
    document.getElementById("bidyield").textContent = responseData.bidyield.toFixed(2);
    document.getElementById("settlementdate").textContent = responseData.settlementdate;
    document.getElementById("orderstatus").textContent = responseData.orderstatus;
    document.getElementById("message").textContent = responseData.message;

    // Show the Bootstrap modal
    const receiptModal = new bootstrap.Modal(document.getElementById('receiptModal'));
    receiptModal.show();
}

// Download the receipt content as PDF using html2pdf
function downloadReceipt() {
    const receiptModal = document.getElementById("receiptModal");
    const receiptContent = receiptModal.querySelector(".modal-content").cloneNode(true);

    // Remove close button from cloned content
    const closeBtn = receiptContent.querySelector(".btn-close");
    if (closeBtn) closeBtn.remove();

    // Create printable container with logo and title
    const printableArea = document.createElement("div");
    printableArea.style.padding = "20px";
    printableArea.style.textAlign = "center";
    printableArea.innerHTML = `
            <div style="text-align: center; margin-bottom: 10px;">
                <img src="/img/logo.png" alt="Company Logo" style="width: 350px; height: 60px; border-radius: 50%;">
                <h2 style="color: #007bff; margin-top: 10px;">Transaction Receipt</h2>
            </div>
        `;
    printableArea.appendChild(receiptContent);

    html2pdf()
        .from(printableArea)
        .set({
            margin: 10,
            filename: 'Transaction_Receipt.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
        })
        .save();
}

// Utility: Get elements by multiple IDs, filtering out missing elements
function getElements(ids) {
    return ids.map(id => document.getElementById(id)).filter(el => el);
}

// Enable or disable a list of fields and optionally clear their values
function setFieldsState(fields, enable) {
    fields.forEach(el => {
        if (el) {
            el.disabled = !enable;
            if (!enable) el.value = "";
        }
    });
}

// Toggle input fields based on selected Quote Type (BID/OFFER)
function toggleFields() {
    const ddlQuoteType = document.getElementById('ddlQuoteType');
    if (!ddlQuoteType) return;

    const quoteType = ddlQuoteType.options[ddlQuoteType.selectedIndex].text.trim();
    const bidFields = getElements(['txtBidValue', 'txtBidMinValue', 'ddlBidYieldType', 'txtBidYieldValue', 'txtBidPrice']);
    const offerFields = getElements(['txtOfferValue', 'txtOfferMinValue', 'ddlOfferYieldType', 'txtOfferYieldValue', 'txtOfferPrice']);

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

// Toggle Deal Time dropdowns based on GFD checkbox
function toggleDealTime() {
    const chkGFD = document.getElementById('chkGFD');
    const hoursDropdown = document.getElementById('ddlDealTimeHours');
    const minutesDropdown = document.getElementById('ddlDealTimeMinutes');

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

// Populate a dropdown with options from start to end with given step (e.g., 0-23 for hours)
function populateDropdown(selector, start, end, step) {
    const dropdown = document.getElementById(selector);
    if (!dropdown) return;

    dropdown.innerHTML = "";
    for (let i = start; i <= end; i += step) {
        const value = i.toString().padStart(2, "0");
        const option = document.createElement("option");
        option.value = value;
        option.text = value;
        dropdown.appendChild(option);
    }
}

// Update SettleType dropdown based on Product selection
function updateSettleType() {
    const ddlProduct = document.getElementById('ddlProduct');
    const ddlSettleType = document.getElementById('ddlSettleType');

    if (!ddlProduct || !ddlSettleType) return;

    if (ddlProduct.value === "GSEC") {
        ddlSettleType.value = "T+1";
    }
}

// Show or hide Broker Name container based on User Type selection
function toggleBrokerName() {
    const ddlUserType = document.getElementById('ddlUserType');
    const brokerNameContainer = document.getElementById("brokerNameContainer");

    if (!ddlUserType || !brokerNameContainer) return;

    brokerNameContainer.style.display = (ddlUserType.value === "BROKERED") ? "block" : "none";
}

// Initialize on DOM ready
document.addEventListener("DOMContentLoaded", function () {
    toggleFields();
    toggleDealTime();
    populateDropdown('ddlDealTimeHours', 0, 23, 1);
    populateDropdown('ddlDealTimeMinutes', 0, 59, 1);
    updateSettleType();
    toggleBrokerName();

    // Attach event listeners
    const ddlQuoteType = document.getElementById('ddlQuoteType');
    const chkGFD = document.getElementById('chkGFD');
    const ddlProduct = document.getElementById('ddlProduct');
    const ddlUserType = document.getElementById('ddlUserType');

    if (ddlQuoteType) ddlQuoteType.addEventListener('change', toggleFields);
    if (chkGFD) chkGFD.addEventListener('change', toggleDealTime);
    if (ddlProduct) ddlProduct.addEventListener('change', updateSettleType);
    if (ddlUserType) ddlUserType.addEventListener('change', toggleBrokerName);
});

// Support for ASP.NET partial postbacks (UpdatePanel)
if (typeof Sys !== "undefined" && Sys.WebForms) {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        toggleFields();
        toggleDealTime();
        updateSettleType();
        toggleBrokerName();
    });
}