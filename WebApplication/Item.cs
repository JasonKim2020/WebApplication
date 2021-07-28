using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication
{
    public class Item
    {
        public int ItemID;
        public string ItemType;
        public int CategoryID;
        public Decimal Price;   //reduced price.
        public Decimal BeforePrice;
        public string Title;
        public string Desc;
        public string ModelNo;
        public string BrandName;
        public string[] images = new string[4];
        public int stock;
        public string Warranty;

        //check out quantity
        public int quantity;
    }
}