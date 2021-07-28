using System;
using System.Web;
using System.Globalization;

namespace WebApplication
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strItemID = Request.QueryString["itemID"];
            if (strItemID != null)
            {
                Item item = DAL.GetItemByID(int.Parse(strItemID));
                if (item == null) Response.Redirect("error.html");
                ShowItem(item);
            }
        }

        private void ShowItem(Item item)
        {

            //Set Images
            if (item.images[0] != "")
            {
                objImage1.ImageUrl = GLOBAL.IMAGE_FOLDER + item.images[0];
                expandedImg.ImageUrl = GLOBAL.IMAGE_FOLDER + item.images[0];
            }
            if (item.images[1] != "")
                objImage2.ImageUrl = GLOBAL.IMAGE_FOLDER + item.images[1];
            if (item.images[2] != "")
                objImage3.ImageUrl = GLOBAL.IMAGE_FOLDER + item.images[2];
            if (item.images[3] != "")
                objImage4.ImageUrl = GLOBAL.IMAGE_FOLDER + item.images[3];

            lblID.Text = "" + item.ItemID;
            lblBrand.Text = item.BrandName;
            lblTitle.Text = item.Title;
            lblPriceNormal.Text = "" + item.BeforePrice.ToString("C2", CultureInfo.CreateSpecificCulture("en-US"));
            lblPriceReduced.Text = "" + item.Price.ToString("C2", CultureInfo.CreateSpecificCulture("en-US"));
            lblDesc.Text = item.Desc;
            lblModelNo.Text = item.ModelNo;
            lblBrandName.Text = item.BrandName;
            lblWarranty.Text = item.Warranty;
        }

         

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            Timer1.Enabled = false;
        }
    }
}