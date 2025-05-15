using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Data.SqlClient;
using System.Web.Http.Routing;
using System.Data;

public partial class BSE_INTEGRATION_UCCManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }


    protected async void btnCreateUCC_Click(object sender, EventArgs e)
    {
        await ManageUCC(1); // 1 = Create UCC
    }

    protected async void btnModifyUCC_Click(object sender, EventArgs e)
    {
        await ManageUCC(2); // 2 = Modify UCC
    }

    protected async void btnDeleteUCC_Click(object sender, EventArgs e)
    {
        await ManageUCC(3); // 3 = Delete UCC
    }


    private async Task ManageUCC(int actionFlag)
    {
        string token = Session["AuthToken"] as string;
        if (string.IsNullOrEmpty(token))
        {
            Response.Redirect("Login.aspx");
            return;
        }

        int accType1;
        if (!int.TryParse(ddlBankAccType1.SelectedValue, out accType1))
        {
            accType1 = 0; // Default value if parsing fails
        }
        int pStateValue;
        if (!int.TryParse(txtState.Text.Trim(), out pStateValue))
        {
            pStateValue = 0; // Default value if parsing fails
        }
        // Prepare Request Body
        var requestBody = new
        {
            UCCKYCDETAILS = new[]
           {
                new
                {
                    recordaudflag = actionFlag,  // 1 for Add, 2 for Modify, 3 for Inactivate
                    clientucc = txtClientUCC.Text.Trim(),
                    category = ddlCategory.Text.Trim(),
                    custodiancode = "", // Optional field
                    dor = "", // Date of Registration, Optional field
                    firstname = txtFirstName.Text.Trim(),
                    middlename = txtMiddleName.Text.Trim(),
                    lastname = txtLastName.Text.Trim(),
                    gender = ddlGender.SelectedValue.ToUpper(),
                    mobileno = txtMobileNo.Text.Trim(),
                    phoneno = txtPhoneNo.Text.Trim(),
                    emailid = txtEmailID.Text.Trim(),
                    dob = txtDOB.Text.Trim(),
                    panno = txtPANNo.Text.Trim(),
                    aadharno = "", // Optional field
                    sebiregno = "", // Optional field
                    communicationaddr = "",
                    paddr1 = txtAddress.Text.Trim(), // Assuming Address Line 1 is the full address
                    paddr2 = "", // Optional field
                    paddr3 = "", // Optional field
                    pcity = txtCity.Text.Trim(),
                    pstate = pStateValue,                    
                    pcountry = txtCountry.Text.Trim(),
                    ppincode = txtPinCode.Text.Trim(),
                    incomerange = 0, // Assuming default income range, update if required
                    contactpersonname = "TEST AK", // Optional field
                    contactpersondesignation = "", // Optional field
                    contactpersonaddr = "", // Optional field
                    autodealconfirm = "N", // Default value, update if needed
                    autodealsettle = "", // Default value, update if needed

                    // Bank Details
                    ifsccode1 = txtBankIFSC1.Text.Trim(),
                    bankaccno1 = txtBankAccNo1.Text.Trim(),
                    bankacctype1 = accType1,
                    defaultbank1 = chkDefaultBank1.Checked ? "T" : "F",
                    bankaccstatus1 = 1, // Assuming Active as default

                    // Placeholder for additional bank details (2-5)
                    ifsccode2 = (string)null,
                    bankaccno2 = (string)null,
                    bankacctype2 = (string)null,
                    defaultbank2 = (string)null,
                    bankaccstatus2 = (string)null,

                    ifsccode3 = (string)null,
                    bankaccno3 = (string)null,
                    bankacctype3 = (string)null,
                    defaultbank3 = (string)null,
                    bankaccstatus3 =(string)null,

                    ifsccode4 = (string)null,
                    bankaccno4 = (string)null,
                    bankacctype4 = (string)null,
                    defaultbank4 = (string)null,
                    bankaccstatus4 = (string)null,

                    ifsccode5 = (string)null,
                    bankaccno5 = (string)null,
                    bankacctype5 = (string)null,
                    defaultbank5 = (string)null,
                    bankaccstatus5 = (string)null,

                    // DP Details
                    dpclientid1 = txtDPClientID1.Text.Trim(), // Example value
                    dptype1 = ddlDPType1.SelectedValue.ToUpper(), // Example value
                    defaultdp1 = chkDefaultDP1.Checked ? "T" : "F",
                    dpstatus1 = 1, // Active by default

                    dpclientid2 = "",
                    dptype2 = "",
                    defaultdp2 = "",
                    dpstatus2 = (string)null,

                    dpclientid3 = (string)null,
                    dptype3 = (string)null,
                    defaultdp3 = (string)null,
                    dpstatus3 = (string)null,

                    dpclientid4 = (string)null,
                    dptype4 = (string)null,
                    defaultdp4 = (string)null,
                    dpstatus4 = (string)null,

                    dpclientid5 = (string)null,
                    dptype5 = (string)null,
                    defaultdp5 = (string)null,
                    dpstatus5 = (string)null,

                    sessionid = "", // Optional field
                    userid = "DFSPLD", // Replace with actual user ID
                    legalentityid = "", // Optional field
                    filler1 = "", // Optional field
                    filler2 ="", // Optional field
                    filler3 = (string)null, // Optional field
                    filler4 = (string)null  // Optional field
                }
            }
        };

        string jsonPayload = Newtonsoft.Json.JsonConvert.SerializeObject(requestBody);
        string checksum = SecurityHelper.GenerateChecksum(jsonPayload);

        string apiEndpoint = actionFlag == 1 ? "ADDICDMuccdetails"
                           : actionFlag == 2 ? "MODIFYICDMuccdetails"
                           : "DELETEICDMuccdetails";

        string result = await SendUCCRequest(token, jsonPayload, apiEndpoint);
        lblMessage.Text = result;

        string checkQuery = "SELECT COUNT(*) FROM UCC_Details WHERE ClientUCC = @ClientUCC";
        Dictionary<string, object> checkParams = new Dictionary<string, object>
    {
        {"@ClientUCC", txtClientUCC.Text.Trim()}
    };

        int count = Convert.ToInt32(SqlDBHelper.ExecuteScalar(checkQuery, checkParams));
        var uccDetails = requestBody.UCCKYCDETAILS[0];

        if (count > 0)
        {
            UpdateUCCData(uccDetails);
        }
        else
        {
            SaveUCCData(uccDetails);
        }
    }
    protected void txtClientUCC_TextChanged(object sender, EventArgs e)
    {
        GetUCCData(txtClientUCC.Text.Trim());
    }
    private bool UCCExists(string clientUCC)
    {
        string query = "SELECT COUNT(*) FROM UCC_Details WHERE ClientUCC = @ClientUCC";
        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        {"@ClientUCC", clientUCC}
    };
        object result = SqlDBHelper.ExecuteScalar(query, parameters);
        int count = (result != null) ? Convert.ToInt32(result) : 0;
        return count > 0;
    }
    private async Task<string> SendUCCRequest(string token, string jsonPayload, string endPoint)
    {
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        using (HttpClient client = new HttpClient())
        {
            client.BaseAddress = new Uri("https://nds.bseindia.com/ICDM_API/ICDMService.svc/");
            client.DefaultRequestHeaders.Add("PARTICIPANTID", "DIMENSIONFSL");
            client.DefaultRequestHeaders.Add("DEALERID", "DIMENSIONFSLD");
            client.DefaultRequestHeaders.Add("PASSWORD", "Ravi#1234");
            client.DefaultRequestHeaders.Add("TOKEN", token);
          //  client.DefaultRequestHeaders.Add("CHECKSUM", checksum);

            HttpContent content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync("ADDICDMuccdetails", content);

            if (response.IsSuccessStatusCode)
            {
                var responseData = await response.Content.ReadAsStringAsync();
                JObject jsonResponse = JObject.Parse(responseData);

                if (jsonResponse["ICDMUCCResponseList"] != null)
                {
                    JArray responseList = jsonResponse["ICDMUCCResponseList"] as JArray;
                    if (responseList != null && responseList.Count > 0)
                    {
                        return "UCC Created Successfully: " + responseList[0]["message"];
                    }
                }
                return "UCC Created Successfully.";
            }

            return "Failed to create UCC.";
        }
    }
    private void SaveUCCData(dynamic uccData)
    {

        if (UCCExists(uccData.clientucc.ToString()))
        {
            // Log or show an error message that Client UCC must be unique.
            throw new Exception("Client UCC already exists.");
        }

        string query = @"
        INSERT INTO UCC_Details 
        (RecordAudFlag, ClientUCC, Category, CustodianCode, DOR, FirstName, MiddleName, LastName, Gender, 
         MobileNo, PhoneNo, EmailID, DOB, PANNo, AadharNo, SEBIRegNo, CommunicationAddr, 
         PAddr1, PAddr2, PAddr3, PCity, PState, PCountry, PPincode, IncomeRange, ContactPersonName, 
         ContactPersonDesignation, ContactPersonAddr, AutoDealConfirm, AutoDealSettle, 
         IFSCCode1, BankAccNo1, BankAccType1, DefaultBank1, BankAccStatus1, 
         IFSCCode2, BankAccNo2, BankAccType2, DefaultBank2, BankAccStatus2, 
         IFSCCode3, BankAccNo3, BankAccType3, DefaultBank3, BankAccStatus3, 
         IFSCCode4, BankAccNo4, BankAccType4, DefaultBank4, BankAccStatus4, 
         IFSCCode5, BankAccNo5, BankAccType5, DefaultBank5, BankAccStatus5, 
         DPClientID1, DPType1, DefaultDP1, DPStatus1, 
         DPClientID2, DPType2, DefaultDP2, DPStatus2, 
         DPClientID3, DPType3, DefaultDP3, DPStatus3, 
         DPClientID4, DPType4, DefaultDP4, DPStatus4, 
         DPClientID5, DPType5, DefaultDP5, DPStatus5, 
         SessionID, UserID, LegalEntityID, Filler1, Filler2, Filler3, Filler4, Timestamp)
        VALUES 
        (@RecordAudFlag, @ClientUCC, @Category, @CustodianCode, @DOR, @FirstName, @MiddleName, @LastName, @Gender, 
         @MobileNo, @PhoneNo, @EmailID, @DOB, @PANNo, @AadharNo, @SEBIRegNo, @CommunicationAddr, 
         @PAddr1, @PAddr2, @PAddr3, @PCity, @PState, @PCountry, @PPincode, @IncomeRange, @ContactPersonName, 
         @ContactPersonDesignation, @ContactPersonAddr, @AutoDealConfirm, @AutoDealSettle, 
         @IFSCCode1, @BankAccNo1, @BankAccType1, @DefaultBank1, @BankAccStatus1, 
         @IFSCCode2, @BankAccNo2, @BankAccType2, @DefaultBank2, @BankAccStatus2, 
         @IFSCCode3, @BankAccNo3, @BankAccType3, @DefaultBank3, @BankAccStatus3, 
         @IFSCCode4, @BankAccNo4, @BankAccType4, @DefaultBank4, @BankAccStatus4, 
         @IFSCCode5, @BankAccNo5, @BankAccType5, @DefaultBank5, @BankAccStatus5, 
         @DPClientID1, @DPType1, @DefaultDP1, @DPStatus1, 
         @DPClientID2, @DPType2, @DefaultDP2, @DPStatus2, 
         @DPClientID3, @DPType3, @DefaultDP3, @DPStatus3, 
         @DPClientID4, @DPType4, @DefaultDP4, @DPStatus4, 
         @DPClientID5, @DPType5, @DefaultDP5, @DPStatus5, 
         @SessionID, @UserID, @LegalEntityID, @Filler1, @Filler2, @Filler3, @Filler4, @Timestamp)";

        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        {"@RecordAudFlag", uccData.recordaudflag},
        {"@ClientUCC", uccData.clientucc},
        {"@Category", uccData.category ?? DBNull.Value},
        {"@CustodianCode", uccData.custodiancode ?? DBNull.Value},
        {"@DOR", uccData.dor ?? DBNull.Value},
        {"@FirstName", uccData.firstname},
        {"@MiddleName", uccData.middlename ?? DBNull.Value},
        {"@LastName", uccData.lastname},
        {"@Gender", uccData.gender},
        {"@MobileNo", uccData.mobileno},
        {"@PhoneNo", uccData.phoneno ?? DBNull.Value},
        {"@EmailID", uccData.emailid},
        {"@DOB", uccData.dob},
        {"@PANNo", uccData.panno},
        {"@AadharNo", uccData.aadharno ?? DBNull.Value},
        {"@SEBIRegNo", uccData.sebiregno ?? DBNull.Value},
        {"@CommunicationAddr", uccData.communicationaddr ?? DBNull.Value},
        {"@PAddr1", uccData.paddr1},
        {"@PAddr2", uccData.paddr2 ?? DBNull.Value},
        {"@PAddr3", uccData.paddr3 ?? DBNull.Value},
        {"@PCity", uccData.pcity},
        {"@PState", uccData.pstate},
        {"@PCountry", uccData.pcountry},
        {"@PPincode", uccData.ppincode},
        {"@IncomeRange", uccData.incomerange},
        {"@ContactPersonName", uccData.contactpersonname ?? DBNull.Value},
        {"@ContactPersonDesignation", uccData.contactpersondesignation ?? DBNull.Value},
        {"@ContactPersonAddr", uccData.contactpersonaddr ?? DBNull.Value},
        {"@AutoDealConfirm", uccData.autodealconfirm},
        {"@AutoDealSettle", uccData.autodealsettle ?? DBNull.Value},

        // Bank details (Ensure no missing parameters)
        {"@IFSCCode1", uccData.ifsccode1 ?? DBNull.Value},
        {"@BankAccNo1", uccData.bankaccno1 ?? DBNull.Value},
        {"@BankAccType1", uccData.bankacctype1 ?? DBNull.Value},
        {"@DefaultBank1", uccData.defaultbank1 ?? DBNull.Value},
        {"@BankAccStatus1", uccData.bankaccstatus1 ?? DBNull.Value},

        {"@IFSCCode2", uccData.ifsccode2 ?? DBNull.Value},
        {"@BankAccNo2", uccData.bankaccno2 ?? DBNull.Value},
        {"@BankAccType2", uccData.bankacctype2 ?? DBNull.Value},
        {"@DefaultBank2", uccData.defaultbank2 ?? DBNull.Value},
        {"@BankAccStatus2", uccData.bankaccstatus2 ?? DBNull.Value},

        {"@IFSCCode3", uccData.ifsccode3 ?? DBNull.Value},
        {"@BankAccNo3", uccData.bankaccno3 ?? DBNull.Value},
        {"@BankAccType3", uccData.bankacctype3 ?? DBNull.Value},
        {"@DefaultBank3", uccData.defaultbank3 ?? DBNull.Value},
        {"@BankAccStatus3", uccData.bankaccstatus3 ?? DBNull.Value},

        {"@IFSCCode4", uccData.ifsccode4 ?? DBNull.Value},
        {"@BankAccNo4", uccData.bankaccno4 ?? DBNull.Value},
        {"@BankAccType4", uccData.bankacctype4 ?? DBNull.Value},
        {"@DefaultBank4", uccData.defaultbank4 ?? DBNull.Value},
        {"@BankAccStatus4", uccData.bankaccstatus4 ?? DBNull.Value},

        {"@IFSCCode5", uccData.ifsccode5 ?? DBNull.Value},
        {"@BankAccNo5", uccData.bankaccno5 ?? DBNull.Value},
        {"@BankAccType5", uccData.bankacctype5 ?? DBNull.Value},
        {"@DefaultBank5", uccData.defaultbank5 ?? DBNull.Value},
        {"@BankAccStatus5", uccData.bankaccstatus5 ?? DBNull.Value},

        // DP Details
        {"@DPClientID1", uccData.dpclientid1 ?? DBNull.Value},
        {"@DPType1", uccData.dptype1 ?? DBNull.Value},
        {"@DefaultDP1", uccData.defaultdp1 ?? DBNull.Value},
        {"@DPStatus1", uccData.dpstatus1 ?? DBNull.Value},

          {"@DPClientID2", uccData.dpclientid2 ?? DBNull.Value},
        {"@DPType2", uccData.dptype2 ?? DBNull.Value},
        {"@DefaultDP2", uccData.defaultdp2 ?? DBNull.Value},
        {"@DPStatus2", uccData.dpstatus2 ?? DBNull.Value},

          {"@DPClientID3", uccData.dpclientid3 ?? DBNull.Value},
        {"@DPType3", uccData.dptype3 ?? DBNull.Value},
        {"@DefaultDP3", uccData.defaultdp3 ?? DBNull.Value},
        {"@DPStatus3", uccData.dpstatus3 ?? DBNull.Value},

          {"@DPClientID4", uccData.dpclientid4 ?? DBNull.Value},
        {"@DPType4", uccData.dptype4 ?? DBNull.Value},
        {"@DefaultDP4", uccData.defaultdp4 ?? DBNull.Value},
        {"@DPStatus4", uccData.dpstatus4 ?? DBNull.Value},

          {"@DPClientID5", uccData.dpclientid5 ?? DBNull.Value},
        {"@DPType5", uccData.dptype5 ?? DBNull.Value},
        {"@DefaultDP5", uccData.defaultdp5 ?? DBNull.Value},
        {"@DPStatus5", uccData.dpstatus5 ?? DBNull.Value},

        {"@SessionID", uccData.sessionid ?? DBNull.Value},
        {"@UserID", uccData.userid},
        {"@LegalEntityID", uccData.legalentityid ?? DBNull.Value},
        {"@Filler1", uccData.filler1 ?? DBNull.Value},
        {"@Filler2", uccData.filler2 ?? DBNull.Value},
        {"@Filler3", uccData.filler3 ?? DBNull.Value},
        {"@Filler4", uccData.filler4 ?? DBNull.Value},
        {"@Timestamp", DateTime.Now }
    };

        // 🔹 Call the database helper function to execute the query
        SqlDBHelper.ExecuteNonQuery(query, parameters);
    }
    private void UpdateUCCData(dynamic uccData)
    {
        string query = @"
        UPDATE UCC_Details SET 
            RecordAudFlag = @RecordAudFlag, 
            Category = @Category, 
            CustodianCode = @CustodianCode, 
            DOR = @DOR, 
            FirstName = @FirstName, 
            MiddleName = @MiddleName, 
            LastName = @LastName, 
            Gender = @Gender, 
            MobileNo = @MobileNo, 
            PhoneNo = @PhoneNo, 
            EmailID = @EmailID, 
            DOB = @DOB, 
            PANNo = @PANNo, 
            AadharNo = @AadharNo, 
            SEBIRegNo = @SEBIRegNo, 
            CommunicationAddr = @CommunicationAddr, 
            PAddr1 = @PAddr1, 
            PAddr2 = @PAddr2, 
            PAddr3 = @PAddr3, 
            PCity = @PCity, 
            PState = @PState, 
            PCountry = @PCountry, 
            PPincode = @PPincode, 
            IncomeRange = @IncomeRange, 
            ContactPersonName = @ContactPersonName, 
            ContactPersonDesignation = @ContactPersonDesignation, 
            ContactPersonAddr = @ContactPersonAddr, 
            AutoDealConfirm = @AutoDealConfirm, 
            AutoDealSettle = @AutoDealSettle, 
            
            -- Bank Details
            IFSCCode1 = @IFSCCode1, 
            BankAccNo1 = @BankAccNo1, 
            BankAccType1 = @BankAccType1, 
            DefaultBank1 = @DefaultBank1, 
            BankAccStatus1 = @BankAccStatus1, 
            IFSCCode2 = @IFSCCode2, 
            BankAccNo2 = @BankAccNo2, 
            BankAccType2 = @BankAccType2, 
            DefaultBank2 = @DefaultBank2, 
            BankAccStatus2 = @BankAccStatus2, 
            IFSCCode3 = @IFSCCode3, 
            BankAccNo3 = @BankAccNo3, 
            BankAccType3 = @BankAccType3, 
            DefaultBank3 = @DefaultBank3, 
            BankAccStatus3 = @BankAccStatus3, 
            IFSCCode4 = @IFSCCode4, 
            BankAccNo4 = @BankAccNo4, 
            BankAccType4 = @BankAccType4, 
            DefaultBank4 = @DefaultBank4, 
            BankAccStatus4 = @BankAccStatus4, 
            IFSCCode5 = @IFSCCode5, 
            BankAccNo5 = @BankAccNo5, 
            BankAccType5 = @BankAccType5, 
            DefaultBank5 = @DefaultBank5, 
            BankAccStatus5 = @BankAccStatus5, 
            
            -- DP Details
            DPClientID1 = @DPClientID1, 
            DPType1 = @DPType1, 
            DefaultDP1 = @DefaultDP1, 
            DPStatus1 = @DPStatus1, 
            DPClientID2 = @DPClientID2, 
            DPType2 = @DPType2, 
            DefaultDP2 = @DefaultDP2, 
            DPStatus2 = @DPStatus2, 
            DPClientID3 = @DPClientID3, 
            DPType3 = @DPType3, 
            DefaultDP3 = @DefaultDP3, 
            DPStatus3 = @DPStatus3, 
            DPClientID4 = @DPClientID4, 
            DPType4 = @DPType4, 
            DefaultDP4 = @DefaultDP4, 
            DPStatus4 = @DPStatus4, 
            DPClientID5 = @DPClientID5, 
            DPType5 = @DPType5, 
            DefaultDP5 = @DefaultDP5, 
            DPStatus5 = @DPStatus5, 
            
            SessionID = @SessionID, 
            UserID = @UserID, 
            LegalEntityID = @LegalEntityID, 
            Filler1 = @Filler1, 
            Filler2 = @Filler2, 
            Filler3 = @Filler3, 
            Filler4 = @Filler4,
           Timestamp = GETDATE()
              
        WHERE ClientUCC = @ClientUCC";

        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        {"@RecordAudFlag", uccData.recordaudflag},
        {"@ClientUCC", uccData.clientucc},
        {"@Category", uccData.category ?? DBNull.Value},
        {"@CustodianCode", uccData.custodiancode ?? DBNull.Value},
        {"@DOR", uccData.dor ?? DBNull.Value},
        {"@FirstName", uccData.firstname},
        {"@MiddleName", uccData.middlename ?? DBNull.Value},
        {"@LastName", uccData.lastname},
        {"@Gender", uccData.gender},
        {"@MobileNo", uccData.mobileno},
        {"@PhoneNo", uccData.phoneno ?? DBNull.Value},
        {"@EmailID", uccData.emailid},
        {"@DOB", uccData.dob},
        {"@PANNo", uccData.panno},
        {"@AadharNo", uccData.aadharno ?? DBNull.Value},
        {"@SEBIRegNo", uccData.sebiregno ?? DBNull.Value},
        {"@CommunicationAddr", uccData.communicationaddr ?? DBNull.Value},
        {"@PAddr1", uccData.paddr1},
        {"@PAddr2", uccData.paddr2 ?? DBNull.Value},
        {"@PAddr3", uccData.paddr3 ?? DBNull.Value},
        {"@PCity", uccData.pcity},
        {"@PState", uccData.pstate},
        {"@PCountry", uccData.pcountry},
        {"@PPincode", uccData.ppincode},
        {"@IncomeRange", uccData.incomerange},
        {"@ContactPersonName", uccData.contactpersonname ?? DBNull.Value},
        {"@ContactPersonDesignation", uccData.contactpersondesignation ?? DBNull.Value},
        {"@ContactPersonAddr", uccData.contactpersonaddr ?? DBNull.Value},
        {"@AutoDealConfirm", uccData.autodealconfirm},
        {"@AutoDealSettle", uccData.autodealsettle ?? DBNull.Value},

        // Bank details (Ensure no missing parameters)
        {"@IFSCCode1", uccData.ifsccode1 ?? DBNull.Value},
        {"@BankAccNo1", uccData.bankaccno1 ?? DBNull.Value},
        {"@BankAccType1", uccData.bankacctype1 ?? DBNull.Value},
        {"@DefaultBank1", uccData.defaultbank1 ?? DBNull.Value},
        {"@BankAccStatus1", uccData.bankaccstatus1 ?? DBNull.Value},

        {"@IFSCCode2", uccData.ifsccode2 ?? DBNull.Value},
        {"@BankAccNo2", uccData.bankaccno2 ?? DBNull.Value},
        {"@BankAccType2", uccData.bankacctype2 ?? DBNull.Value},
        {"@DefaultBank2", uccData.defaultbank2 ?? DBNull.Value},
        {"@BankAccStatus2", uccData.bankaccstatus2 ?? DBNull.Value},

           {"@IFSCCode3", uccData.ifsccode3 ?? DBNull.Value},
        {"@BankAccNo3", uccData.bankaccno3 ?? DBNull.Value},
        {"@BankAccType3", uccData.bankacctype3 ?? DBNull.Value},
        {"@DefaultBank3", uccData.defaultbank3 ?? DBNull.Value},
        {"@BankAccStatus3", uccData.bankaccstatus3 ?? DBNull.Value},

           {"@IFSCCode4", uccData.ifsccode4 ?? DBNull.Value},
        {"@BankAccNo4", uccData.bankaccno4 ?? DBNull.Value},
        {"@BankAccType4", uccData.bankacctype4 ?? DBNull.Value},
        {"@DefaultBank4", uccData.defaultbank4 ?? DBNull.Value},
        {"@BankAccStatus4", uccData.bankaccstatus4 ?? DBNull.Value},

           {"@IFSCCode5", uccData.ifsccode5 ?? DBNull.Value},
        {"@BankAccNo5", uccData.bankaccno5 ?? DBNull.Value},
        {"@BankAccType5", uccData.bankacctype5 ?? DBNull.Value},
        {"@DefaultBank5", uccData.defaultbank5 ?? DBNull.Value},
        {"@BankAccStatus5", uccData.bankaccstatus5 ?? DBNull.Value},

        // DP Details
        {"@DPClientID1", uccData.dpclientid1 ?? DBNull.Value},
        {"@DPType1", uccData.dptype1 ?? DBNull.Value},
        {"@DefaultDP1", uccData.defaultdp1 ?? DBNull.Value},
        {"@DPStatus1", uccData.dpstatus1 ?? DBNull.Value},

          {"@DPClientID2", uccData.dpclientid2 ?? DBNull.Value},
        {"@DPType2", uccData.dptype2 ?? DBNull.Value},
        {"@DefaultDP2", uccData.defaultdp2 ?? DBNull.Value},
        {"@DPStatus2", uccData.dpstatus2 ?? DBNull.Value},

          {"@DPClientID3", uccData.dpclientid3 ?? DBNull.Value},
        {"@DPType3", uccData.dptype3 ?? DBNull.Value},
        {"@DefaultDP3", uccData.defaultdp3 ?? DBNull.Value},
        {"@DPStatus3", uccData.dpstatus3 ?? DBNull.Value},

          {"@DPClientID4", uccData.dpclientid4 ?? DBNull.Value},
        {"@DPType4", uccData.dptype4 ?? DBNull.Value},
        {"@DefaultDP4", uccData.defaultdp4 ?? DBNull.Value},
        {"@DPStatus4", uccData.dpstatus4 ?? DBNull.Value},

          {"@DPClientID5", uccData.dpclientid5 ?? DBNull.Value},
        {"@DPType5", uccData.dptype5 ?? DBNull.Value},
        {"@DefaultDP5", uccData.defaultdp5 ?? DBNull.Value},
        {"@DPStatus5", uccData.dpstatus5 ?? DBNull.Value},

        {"@SessionID", uccData.sessionid ?? DBNull.Value},
        {"@UserID", uccData.userid},
        {"@LegalEntityID", uccData.legalentityid ?? DBNull.Value},
        {"@Filler1", uccData.filler1 ?? DBNull.Value},
        {"@Filler2", uccData.filler2 ?? DBNull.Value},
        {"@Filler3", uccData.filler3 ?? DBNull.Value},
        {"@Filler4", uccData.filler4 ?? DBNull.Value}
    };

        // 🔹 Call the database helper function to execute the query
        SqlDBHelper.ExecuteNonQuery(query, parameters);
    }
    private void GetUCCData(string clientUCC)
    {
        string query = @"SELECT * FROM UCC_Details WHERE ClientUCC = @ClientUCC";
        Dictionary<string, object> parameters = new Dictionary<string, object>
    {
        {"@ClientUCC", clientUCC}
    };

        DataTable dt = SqlDBHelper.ExecuteQuery(query, parameters);
        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.Rows[0];

            // Fill the form fields with fetched data
            ddlCategory.Text = row["Category"].ToString();
            txtFirstName.Text = row["FirstName"].ToString();
            txtMiddleName.Text = row["MiddleName"].ToString();
            txtLastName.Text = row["LastName"].ToString();
            ddlGender.SelectedValue = row["Gender"].ToString();
            txtMobileNo.Text = row["MobileNo"].ToString();
            txtPhoneNo.Text = row["PhoneNo"].ToString();
            txtEmailID.Text = row["EmailID"].ToString();
            txtDOB.Text = Convert.ToDateTime(row["DOB"]).ToString("yyyy-MM-dd");
            txtPANNo.Text = row["PANNo"].ToString();
            txtAddress.Text = row["PAddr1"].ToString();
            txtCity.Text = row["PCity"].ToString();
            txtState.Text = row["PState"].ToString();
            txtCountry.Text = row["PCountry"].ToString();
            txtPinCode.Text = row["PPincode"].ToString();

            // Bank Details
            txtBankIFSC1.Text = row["IFSCCode1"].ToString();
            txtBankAccNo1.Text = row["BankAccNo1"].ToString();
            ddlBankAccType1.SelectedValue = row["BankAccType1"].ToString();
            chkDefaultBank1.Checked = row["DefaultBank1"].ToString() == "T";

            // DP Details
            txtDPClientID1.Text = row["DPClientID1"].ToString();
            ddlDPType1.SelectedValue = row["DPType1"].ToString();
            chkDefaultDP1.Checked = row["DefaultDP1"].ToString() == "T";
        }
        else
        {
            // If no data found, clear the fields
            ClearForm();
        }
    }
    private void ClearForm()
    {
        ddlCategory.Text = "";
        txtFirstName.Text = "";
        txtMiddleName.Text = "";
        txtLastName.Text = "";
        ddlGender.SelectedIndex = 0;
        txtMobileNo.Text = "";
        txtPhoneNo.Text = "";
        txtEmailID.Text = "";
        txtDOB.Text = "";
        txtPANNo.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtCountry.Text = "";
        txtPinCode.Text = "";

        // Bank Details
        txtBankIFSC1.Text = "";
        txtBankAccNo1.Text = "";
        ddlBankAccType1.SelectedIndex = 0;
        chkDefaultBank1.Checked = false;

        // DP Details
        txtDPClientID1.Text = "";
        ddlDPType1.SelectedIndex = 0;
        chkDefaultDP1.Checked = false;
    }


}

