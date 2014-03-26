<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Installer.ascx.cs" Inherits="Umbraco.InstallStatistics.ui.Installer" %>

<h3>
    Thank you so much, for your contribution to making the Umbraco core even better!
</h3>

<p>
 As you read this, most of the statistics on your site has already been collected and dispatched to the our server. 
 As we collected the information, we ensured that any domain/IP/UserName was hashed or removed so we cannot ever find out where this data is coming from. 
 </p>
 
 <p><strong>
 It is very important to emphasize that all data is logged without any trace of the person/site/domain or IP it comes from. This is NOT data for marketing, it is for developing the future of Umbraco.
 </strong>
 </p>

 <p>
Currently we collect the following data from umbraco installations: 
</p>
<ul>
<li>Number of document types and  properties, as well as how they are arranged on tabs</li>	
<li>Templates and template structure (not template markup)</li>
<li>Macros and macro types (no macro code)</li>	
<li>Datatypes and installed types</li>	
<li>Installed Packages</li>	
<li>Number of users and user types</li>	
<li>Amount of content and depth of documents</li>
</ul>

<p>
    If you want to see the data collected, this is available in /app_data/installstat/website
</p>

<p>
    If you want to see the code behind the statistics collector, you can find it on our bitbucket account <a href="https://bitbucket.org/UmbracoHQ/umbraco.installationstats" target="_blank">here</a>
</p>