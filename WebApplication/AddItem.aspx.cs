using System.Drawing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace WebApplication
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private static string[] imageNames = new string[4];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (imageNames[0] != null)
                objImage1.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[0];
            if (imageNames[1] != null)
                objImage2.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[1];
            if (imageNames[2] != null)
                objImage3.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[2];
            if (imageNames[3] != null)
                objImage4.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[3];
        }

        // Upload Images
        // 1. Save images in temp folder
        // 2. Insert image names in DB
        protected void btnUploadImages_Click(object sender, EventArgs e)
        {
            //lblAlert.Text = "btnUploadImages_Click  " + fuImages.PostedFiles.Count;
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie == null)
            {
                lblAlert.Text = "Please login as staff";
                return;
            }

            //get UserId to set imageName
            string userID = cookie.Values["UserID"];

            //hold image files in temp folder until registration completed.
            string strTempFolder = Server.MapPath(GLOBAL.TEMP_IMAGE_FOLDER);

            // Create the folder if it does not exist.
            if (!Directory.Exists(strTempFolder))
            {
                Directory.CreateDirectory(strTempFolder);
            }

            //the number of already uploaded images before
            int imgCnt = 0;
            foreach (string img in imageNames)
            {
                if (img != null) imgCnt++;
            }
            //listofuploadedfiles.Text = "imgCnt " + imgCnt;
            //if FileUplod Object has files
            if (fuImages.HasFiles)
            {
                //if the number of images is bigger than 4, exit.
                if (fuImages.PostedFiles.Count > (4 - imgCnt))
                {
                    listofuploadedfiles.Text = "Up to 4 images are available.";
                    return;
                }

                foreach (HttpPostedFile uploadedFile in fuImages.PostedFiles)
                {
                    string extension = Path.GetExtension(uploadedFile.FileName);
                    string fileName = userID + "_" + DateTime.Now.ToString("MM/dd/yyyy/hhmmss/fff") + "_" + imgCnt + extension;
                    imageNames[imgCnt] = fileName;
                    //hold image files in temp folder until registration completed.
                    uploadedFile.SaveAs(System.IO.Path.Combine(strTempFolder, fileName));
                    Response.Write(strTempFolder + "<br>");
                    Response.Write(fileName+ "<br>");
                    imgCnt++;
                }
                if (imageNames[0] != null)
                    objImage1.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[0];

                if (imageNames[1] != null)
                    objImage2.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[1];

                if (imageNames[2] != null)
                    objImage3.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[2];

                if (imageNames[3] != null)
                    objImage4.ImageUrl = GLOBAL.TEMP_IMAGE_FOLDER + imageNames[3];
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //At least one image should be uploaded.
            int imgCnt = 0;
            foreach (string imageName in imageNames)
            {
                if (imageName != null)
                {
                    imgCnt++;
                }
            }
            if (imgCnt < 1)
            {
                listofuploadedfiles.Text = "* Please upload at least one image.";
                return;
            }
            else
            {
                listofuploadedfiles.Text = "";
            }


            Item item = new Item();
            item.CategoryID = int.Parse(ddlCategoryID.SelectedValue);
            item.ItemType = ddlItemPromotion.SelectedValue;
            item.Price = Decimal.Parse(txtPrice_Current.Text);
            item.BeforePrice = Decimal.Parse(txtPrice_Before.Text);
            item.Title = txtItemTitle.Text;
            item.Desc = txtDesc.Text;
            item.ModelNo = txtModelNo.Text;
            item.BrandName = txtBrandName.Text;
            item.images = imageNames;
            item.stock = int.Parse(txtStock.Text);
            item.Warranty = txtWarranty.Text;

            string query = DAL.SaveItem(item);
            if (query == null) Response.Redirect("error.html");

            //txtBrandName.Text = query;

            MoveImagesFromTempToFolder(item);

            DAL.StoreQuery(query);

            imageNames = new string[4];
            Response.Redirect("default.aspx");
        }

        private void MoveImagesFromTempToFolder(Item item)
        {
            string sourcePath = Server.MapPath(GLOBAL.TEMP_IMAGE_FOLDER);
            string targetPath = Server.MapPath(GLOBAL.IMAGE_FOLDER);
            //string targetPath = @"C:\Users\Public\TestFolder\SubDir";

            // If the directory already exists, this method does not create a new directory.
            System.IO.Directory.CreateDirectory(targetPath);

            foreach (string image in item.images)
            {
                if (image != null)
                {
                    string fileName = image;

                    // Use Path class to manipulate file and directory paths.
                    string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
                    string destFile = System.IO.Path.Combine(targetPath, fileName);

                    // To move a file or folder to a new location:
                    System.IO.File.Move(sourceFile, destFile);
                }
            }
        }
    }
}