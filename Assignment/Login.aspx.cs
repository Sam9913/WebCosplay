using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control ctlLogin; 
            if(Session["forPass"] != null)
            {
                ctlLogin = LoadControl("ForgetPassControl.ascx");
            }
            else
                ctlLogin = LoadControl("LoginControl.ascx");
            phdLogin.Controls.Add(ctlLogin);
        }
        
        
    }
}