using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAlert.Visible = false;
            }
            else
            {



                lblAlert.Visible = true;
            }

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Person person = DAL.GetUserByEmailPwd(txtUserEmail.Text, txtUserPwd.Text);

            if (person == null)
            {
                Response.Redirect("error.html");
            }

            if (person.MemberID == 0)
            {
                lblAlert.Text = "Invalid email address or password";
                return;
            }

            HttpCookie aUser = new HttpCookie("UserInfo");
            aUser.Values["UserName"] = person.FirstName;
            aUser.Values["UserID"] = "" + person.MemberID;
            aUser.Values["UserType"] = person.MemberType;
            btnSignUp.Text = person.FirstName;
            aUser.Expires = DateTime.Now.AddDays(7);
            Response.Cookies.Add(aUser);
            Response.Redirect("default.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}