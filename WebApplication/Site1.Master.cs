using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private string UserType;
        private string UserName;
        private string UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //When searching is limited by category
                string strCategoryID = Request.QueryString["Category"];

                //Get search word
                string strSearch = Request.QueryString["Search"];

                category.SelectedValue = strCategoryID;
                txtSearch.Text = strSearch;
            }
            ChangeLabelBtn();
            ManageNumberofVisit();
        }

        // The visit after two hours from the last visit is considered as a new visit.
        protected void ManageNumberofVisit()
        {
            if (UserType == GLOBAL.USER_CUSTOMER)
            {
                //If the visit cookie is still alive after the last visit
                //it is not a new visit.                
                if (Request.Cookies["Visit"] != null)
                {
                    //Response.Write("it has a visit cookie");
                    return;
                }

                //if there is no cookie
                //it is a new visit
                //Adding a cookie and inserting a new row on the tblVisit.
                //Response.Write("it does not have a visit cookie");
                HttpCookie NoOfVisit = new HttpCookie("Visit");
                NoOfVisit.Expires = DateTime.Now.AddHours(2);
                Response.Cookies.Add(NoOfVisit);
                string query;
                query = DAL.InsertNewVisit(UserId);
                //Response.Write(query);
            }
        }
        public void RemoveVisitCookie()
        {
            HttpCookie visitCookie = new HttpCookie("Visit");
            visitCookie.Expires = DateTime.Now.AddDays(-9);
            Response.Cookies.Add(visitCookie);
        }



        protected void ChangeLabelBtn()
        {
            if (Request.Cookies["UserInfo"] != null)
            {   //if logged in
                HttpCookie aUser = Request.Cookies["UserInfo"];
                UserType = aUser.Values["UserType"];
                UserName = aUser.Values["UserName"];
                UserId = aUser.Values["UserID"];

                if (UserType == GLOBAL.USER_STAFF)
                {  // if user is staff
                    lbtnUserName.Text = "Role:staff " + UserName;
                    lbtnMenu.Text = "MANAGE";
                }
                else if (UserType == GLOBAL.USER_CUSTOMER)
                {   //if it is customer
                    lbtnUserName.Text = "Enjoy Shopping! " + UserName;
                    lbtnMenu.Text = "My Account";
                }
                else
                {
                    //if not logged in
                    lbtnUserName.Text = "Sign In";
                    lbtnMenu.Text = "Register";
                }

            }
            else
            {   //if not logged in
                lbtnUserName.Text = "Sign In";
                lbtnMenu.Text = "Register";
            }
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            RemoveVisitCookie();
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
                signOut();
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
        private void signOut()
        {
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
            }
            Response.Redirect("default.aspx");
        }

        protected void lbtnMenu_Click(object sender, EventArgs e)
        {
            if (UserType == GLOBAL.USER_STAFF)
            {
                Response.Redirect("AddItem.aspx");
            }
            else if (UserType == GLOBAL.USER_CUSTOMER)
            {
                //Change account information.
                Response.Redirect("MyAccount.aspx");
            }
            else
            {
                //Register
                Response.Redirect("SignUp.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = "default.aspx?Category=" + category.SelectedValue + "&Search=" + txtSearch.Text;
            Response.Redirect(query);
        }

        protected void linkSignOut_Click(object sender, EventArgs e)
        {
            signOut();
        }
    }
}