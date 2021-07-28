using System;
using System.Data;


namespace WebApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string strCategoryID;
        private static string strSort;
        private static string strSearch;

        protected void Page_Load(object sender, EventArgs e)
        {
            //When searching is limited by category
            strCategoryID = Request["Category"];

            //Get sorting 
            strSort = Request.QueryString["Sort"];

            //Get search word
            strSearch = Request["Search"];

            if (!IsPostBack)
            {
                if (strSort != null)
                {
                    ddlSort.SelectedValue = strSort;
                }
            }

            DisplayPromotion();
            DisplayItem();
        }

        //DisplayItem
        private void DisplayPromotion()
        {
            DataSet dataSet = DAL.GetItemListDataset(strSearch, "promotion", strCategoryID, strSort);
            DataListPromotion.DataSource = dataSet;
            DataListPromotion.DataBind();

            if (dataSet == null)
            {
                lblPromotion.Visible = false;
                return;
            }

            if (dataSet.Tables[0].Rows.Count < 1)
            {
                lblPromotion.Visible = false;
            }

        }


        //DisplayItem
        private void DisplayItem()
        {
            DataSet dataSet = DAL.GetItemListDataset(strSearch, "product", strCategoryID, strSort);
            DataListItem.DataSource = dataSet;
            DataListItem.DataBind();

            if (dataSet == null)
            {
                ddlSort.Visible = false;
                lblNoData.Text = "No product found.";
                return;
            }

            if (dataSet.Tables[0].Rows.Count < 1)
            {
                ddlSort.Visible = false;
                lblNoData.Text = "No product found.";
            }
        }
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "default.aspx?Sort=" + ddlSort.SelectedValue;
            //Response.Write(ddlSort.Text);
            if (strCategoryID != null)
            {
                query += "&Category=" + strCategoryID;
            }
            if (strSearch != null)
            {
                query += "&Search=" + strSearch;
            }
            //Response.Write(query);
            Response.Redirect(query);
        }
    }
}