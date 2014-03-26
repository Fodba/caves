using System;
using System.Collections.Generic;
using System.Text;
using umbraco.cms.businesslogic.web;
using umbraco.cms.businesslogic;
using umbraco.BusinessLogic;


namespace vipperod_events
{
    public class jesperEasyValues : umbraco.BusinessLogic.ApplicationBase
    {
        public jesperEasyValues()
        {

            Document.New += new Document.NewEventHandler(Document_New);
    	    Document.BeforePublish += new Document.PublishEventHandler(Document_BeforePublish);


        }

		// Syncs a field named "umbName" with name of node.
		// this allows you to have a field on the content tab and update the name without navigating to properties tab
		
        void Document_BeforePublish(Document sender, umbraco.cms.businesslogic.PublishEventArgs e)
        {

            try
            {

                sender.Text = (string) sender.getProperty("umbName").Value;


            }
            catch
            {
            }

        }


		// Default the umbDate field with current date
		// This is mandatory in all my solutions. I use it as a logical posting date that can be changed by user. (createdDate/updatedDate is not an option)
		
        void Document_New(Document sender, NewEventArgs e)
        {

            try
            {

                sender.getProperty("umbDate").Value = DateTime.Now;


            }
            catch
            {
            }



			// Default umbName to node name (see 'Syncs a field named "umbName"')

            try
            {

                sender.getProperty("umbName").Value = sender.Text;


            }
            catch
            {
            }

			// Default umbHeadline to node name 
			// This allows you to have a headline on content tab that takes the value from nodeName (but is not synched). Ideal to allow for headline changes without changing page address.

            try
            {

                sender.getProperty("umbHeadline").Value = sender.Text;


            }
            catch
            {
            }



		


        }

    }
}
