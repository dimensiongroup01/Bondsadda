using System;
using System.Activities;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MSG91MailContent
/// </summary>
public class MSG91MailContent
{
    public MSG91MailContent()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}

public class From
{
    public string email { get; set; }
}

public class Variables
{
    public string company_name { get; set; }
    public string otp { get; set; }
}

public class Recipient
{
    public List<To> to { get; set; }
    public Variables variables { get; set; }
}

public class Recipients
{
    public List<Tos> tos { get; set; }
}

public class MSG91RegistrationMail
{
    public List<Recipient> recipients { get; set; }
    public From from { get; set; }
    public string domain { get; set; }
    public string template_id { get; set; }
}

public class MSG91RegistrationMails
{
    public List<Recipients> recipientss { get; set; }
    public From from { get; set; }
    public string domain { get; set; }
    public string template_id { get; set; }
}

public class To
{
    public string email { get; set; }
    public string name { get; set; }
}

public class Tos
{
    public string email { get; set; }
    public string otp { get; set; }
}