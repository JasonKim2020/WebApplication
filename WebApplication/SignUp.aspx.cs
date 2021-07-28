using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {

            Person user = new Person();

            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Email = txtUserEmail.Text;
            user.Password = txtUserPwd.Text;
            user.Phone = txtPhoneNumber.Text;
            user.Address = txtAddress.Text;

            string resultQuery = DAL.SignUp(user);
            if (resultQuery == null)
            {
                Response.Redirect("error/error.html");
            }
            else
            {
                Response.Write(resultQuery);
            }
            Response.Redirect("signin.aspx");
        }

        protected void btnSignUp1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}