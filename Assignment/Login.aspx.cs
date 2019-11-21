using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Equals("TAB"))
            {
                if (txtPassword.Text.Equals("123456"))
                {
                    Response.Write("<script language=javascript>alert('Welcome TAN AH BENG!')</script>");
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Wrong password.')</script>");
                }
            }
            else if (txtName.Text.Equals("StellaYu"))
            {
                if (txtPassword.Text.Equals("901222"))
                {
                    Response.Write("<script language=javascript>alert('Welcome Stella!')</script>");
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Wrong password.')</script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('Wrong username.')</script>");
            }
        }
    }
}