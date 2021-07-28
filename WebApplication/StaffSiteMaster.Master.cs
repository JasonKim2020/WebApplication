using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class StaffSiteMaster : System.Web.UI.MasterPage
    {
        private static string USER_STAFF = "staff";
        private string UserType;
        private string UserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            ChangeLabelBtn();
        }

        protected void ChangeLabelBtn()
        {
            if (Request.Cookies["UserInfo"] != null)
            {   //if logged in
                HttpCookie aUser = Request.Cookies["UserInfo"];
                UserType = aUser.Values["UserType"];
                UserName = aUser.Values["UserName"];

                if (UserType == USER_STAFF)
                {  // if user is staff
                    lbtnUserName.Text = "Role:staff " + UserName;
                }
                else
                {   //if it is customer
                    lbtnUserName.Text = "Enjoy Shopping! " + UserName;
                }

            }
            else
            {   //if not logged in
                lbtnUserName.Text = "Sign In";
            }


        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("default.aspx");
        }


        protected void lbtnUserName_Click(object sender, EventArgs e)
        {
            // it is not proper to click userName to logOut,
            // it should be improved later.

            //Log Out
            HttpCookie aUser = Request.Cookies["UserInfo"];
            if (aUser != null)
            {
                aUser.Expires = DateTime.Now.AddDays(-4);
                aUser.Values["UserName"] = null;
                aUser.Values["UserType"] = null;
                aUser.Values["UserID"] = null;
                Response.Cookies.Add(aUser);
                lbtnUserName.Text = "Sign In";
                ChangeLabelBtn();
                Response.Redirect("default.aspx");
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = "default.aspx?Category=" + category.SelectedValue + "&Search=" + txtSearch.Text;
            Response.Redirect(query);
        }
    }
}