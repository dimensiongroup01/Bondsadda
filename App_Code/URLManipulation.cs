using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for URLManipulation
/// </summary>
public class URLManipulation
{

        public string UpdateQueryStringParameter(string url, string paramName, string newValue)
        {
            var uriBuilder = new UriBuilder(url);
            var query = HttpUtility.ParseQueryString(uriBuilder.Query);
            query[paramName] = newValue;
            uriBuilder.Query = query.ToString();
            return uriBuilder.ToString();
        }

        public string ReplaceNumberWithName(string url, string numberToReplace, string newName)
        {
            // Replace the number with the new name in the URL
            return url.Replace(numberToReplace, newName);
        }
    
}