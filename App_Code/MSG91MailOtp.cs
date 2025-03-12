using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MSG91MailOtp
/// </summary>
public class MSG91MailOtp
{
    public MSG91MailOtp()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public class Froms
    {
        public string email { get; set; }
    }

    public class Recipients
    {
        public List<To> to { get; set; }
    }

    public class MSG91OTPMail
    {
        public List<Recipients> recipients { get; set; }
        public Froms from { get; set; }
        public string domain { get; set; }
        public string template_id { get; set; }
    }

    public class Tos
    {
        public string email { get; set; }
        public string otp { get; set; }
    }
}