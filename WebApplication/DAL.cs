//Data Access Layer. 
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System;


namespace WebApplication
{
    public class DAL
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["dbGoShopConnectionString"].ConnectionString;

        public static Person GetUserByEmailPwd(string email, string pwd)
        {
            Person person = new Person();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string hashPwd = Security.GetHashPassword(email, pwd);

                string query = "Select MemberID, MemberType, FirstName, LastName, Email, Phone, Address from tblMember "
                    + " where Email = '" + email + "' and Password = '" + hashPwd + "'";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    person.MemberID = int.Parse("" + reader[0]);
                    person.MemberType = reader.GetString(1);
                    person.FirstName = reader.GetString(2);
                    person.LastName = reader.GetString(3);
                    person.Email = reader.GetString(4);
                    person.Phone = reader.GetString(5);
                    person.Address = reader.GetString(6);
                    person.Password = pwd;
                }
                connection.Close();
            }
            catch
            {
                return null;
            }
            return person;

        }

        public static Person GetMemberByID(int MemberID)
        {
            Person person = new Person();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string query = "Select MemberID, MemberType, FirstName, LastName, Email, Password, Phone, Address from tblMember "
                    + " where MemberID = " + MemberID;
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    person.MemberID = int.Parse("" + reader[0]);
                    person.MemberType = reader.GetString(1);
                    person.FirstName = reader[2].ToString();
                    person.LastName = reader[3].ToString();
                    person.Email = reader[4].ToString();
                    person.Password = reader[5].ToString();
                    person.Phone = reader[6].ToString();
                    person.Address = reader[7].ToString();
                }
                connection.Close();
            }
            catch
            {
                return null;
            }
            return person;
        }

        public static DataSet GetItemListDataset(string strSearch, string strItemType, string strCategoryID, string strSort)
        {
            DataSet dataSet = new DataSet();
            //try
            //{
            string where = " where itemType = '" + strItemType + "' ";

            //when both categoryId and search are given.
            if (strCategoryID != null && strSearch != null)
            {
                where += " and CategoryID = " + strCategoryID + " and ( Title like '%" + strSearch + "%'" +
                    " or Description like '%" + strSearch + "%')";
            }
            //when only categoryId is given.
            else if (strCategoryID != null && strSearch == null)
            {
                where += " and CategoryID = " + strCategoryID;
            }
            //when only search word is given.
            else if (strCategoryID == null && strSearch != null)
            {
                where += " and (Title like '%" + strSearch + "%'" +
                    " or Description like '%" + strSearch + "%')";
            }

            //select ItemID, SUBSTRING(title, 1, 25) as Summary, image1, Price, BeforePrice, BrandName from tblItem and CategoryID = 1

            string order = "";
            if (strSort != null)
            {
                switch (strSort)
                {
                    case "price":
                        order = " order by Price";
                        break;
                    case "category":
                        order = " order by CategoryID";
                        break;
                    case "name":
                        order = " order by Title";
                        break;
                }
            }

            string sqlQuery = "select ItemID, SUBSTRING(title,1,25) as Summary, image1, Price, BeforePrice, BrandName from tblItem ";

            sqlQuery = sqlQuery + where + order;
            //Response.Write(sqlQuery);
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sqlQuery, connection);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(dataSet);
            //}
            //catch
            //{
            //    return null;
            //}

            return dataSet;
        }


        public static Item GetItemByID(int itemID)
        {
            Item item = new Item();
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string query = "Select " +
                    " ItemID, " +
                    "CategoryID, Price, BeforePrice, Title, ModelNo, " +
                    "BrandName, image1, image2, image3, image4, " +
                    "Stock, Warranty, Description from tblItem "
                    + " where itemID = " + itemID;
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    item.ItemID = reader.GetInt32(0);
                    item.CategoryID = reader.GetInt32(1);
                    item.Price = reader.GetDecimal(2);
                    item.BeforePrice = reader.GetDecimal(3);
                    item.Title = reader.GetString(4);
                    item.ModelNo = reader.GetString(5);
                    item.BrandName = reader.GetString(6);
                    item.images[0] = reader.GetString(7);
                    item.images[1] = reader.GetString(8);
                    item.images[2] = reader.GetString(9);
                    item.images[3] = reader.GetString(10);
                    item.stock = reader.GetInt32(11);
                    item.Warranty = reader.GetString(12);
                    item.Desc = reader.GetString(13);
                }
                connection.Close();
            }
            catch
            {
                return null;
            }

            return item;
        }
        public static string InsertNewVisit(string userId)
        {
            //Insert info into tblVisit that keeps userid and visitdate

            int numberOfRows = 0;
            string query = "";
            try
            {
                //Insert info into tblVisit
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                query = "INSERT INTO tblVisit " +
                    "(MemberID) VALUES ( "
                               + userId + ") ";
                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();
                connection.Close();

                StoreQuery(query);
            }
            catch
            {
                return null;
            }

            return query;
        }
        public static string CheckOut(Deal deal)
        {
            //Insert info into tblDeal
            //Substract quantity from tblItem

            int numberOfRows = 0;
            string query = "";
            try
            {
                //Insert info into tblDeal
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                query = "INSERT INTO tblDeal " +
                    "(ItemID, MemberID, Quantity, Price) VALUES( "
                               + deal.itemID + ", "
                               + deal.userID + ", "
                               + deal.quantity + ", "
                               + deal.price + ") ";
                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();

                //Store query to use later on any purpose.

                StoreQuery(query);

                //Substract quantity from tblItem
                query = "update tblItem set stock = stock - " + deal.quantity
                                + " where itemid = " + deal.itemID;
                command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();

                connection.Close();
            }
            catch
            {
                return null;
            }

            return query;
        }

        public static string SaveItem(Item item)
        {
            int numberOfRows = 0;
            string query = "";
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                query = "INSERT INTO tblItem " +
                    "(ItemType, CategoryID, Price,BeforePrice, Title, Description, ModelNo, BrandName, " +
                    "image1, image2, image3, image4, stock, Warranty) VALUES( "
                               + "'" + item.ItemType + "', "
                               + item.CategoryID + ", "
                               + item.Price + ", "
                               + item.BeforePrice + ", "
                               + "'" + item.Title.Replace("'", "''") + "', "
                               + "'" + item.Desc.Replace("'", "''") + "', "
                               + "'" + item.ModelNo.Replace("'", "''") + "', "
                               + "'" + item.BrandName + "', "
                               + "'" + item.images[0] + "', "
                               + "'" + item.images[1] + "', "
                               + "'" + item.images[2] + "', "
                               + "'" + item.images[3] + "', "
                               + "'" + item.stock + "', "
                               + "'" + item.Warranty.Replace("'", "''") + "')";
                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch
            {
                return null;
            }

            return query;
        }
        public static string StoreQuery(string txtQuery)
        {
            string query;
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                txtQuery = txtQuery.Replace("'", "''");
                query = "Insert into tblQuery values ('" + txtQuery + "')";

                SqlCommand command = new SqlCommand(query, connection);
                int numberOfRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch
            {
                return null;
            }

            return query;
        }


        public static string SignUp(Person user)
        {
            int numberOfRows = 0;
            string query = "";
            string hashPwd = Security.GetHashPassword(user.Email, user.Password);
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                query = "insert into tblMember (MemberType, FirstName, LastName, Email, Password, Phone, Address) " +
                            " values( " +
                            "'" + GLOBAL.USER_CUSTOMER + "'" + //Type  staff, customer
                            ", '" + user.FirstName + "'" +
                            ", '" + user.LastName + "'" +
                            ", '" + user.Email + "'" +
                            ", '" + hashPwd + "'" +
                            ", '" + user.Phone + "'" +
                            ", '" + user.Address + "')";

                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch
            {
                return null;
            }
            //Store query to use later on any purpose.

            StoreQuery(query);

            return query;
        }

        public static int UpdateMemberInfo(int MemberID, string FirstName, string LastName, string Email, string Password, string Phone, string Address)
        {
            int numberOfRows;
            try
            {

                string hashPwd = Security.GetHashPassword(Email, Password);

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string query = "UPDATE tblMember SET " +
                                "FirstName = '" + FirstName + "', LastName = '" + LastName + "' , " +
                                "Email = '" + Email + "', Password = '" + hashPwd + "', " +
                                "Phone = '" + Phone + "', Address = '" + Address + "' " +
                                "Where MemberID = " + MemberID;

                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch
            {
                return 0;
            }
            return numberOfRows;
        }


        public static int UpdateMemberPwdWithEmail(string Email, string Password)
        {
            int numberOfRows;
            string query;
            try
            {
                string hashPwd = Security.GetHashPassword(Email, Password);

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                query = "UPDATE tblMember SET " +
                                " Password = '" + hashPwd + "'" +
                                " Where Email= '" + Email + "'";

                SqlCommand command = new SqlCommand(query, connection);
                numberOfRows = command.ExecuteNonQuery();
                connection.Close();
            }
            catch
            {
                return 0;
            }
            return numberOfRows;
        }

    }

    public class Security
    {
        public static string GetHashPassword(string email, string password)
        {
            return HashPassword(email, password);
        }

        private static string GetSalt(string email, string password)
        {
            string upperEmail = email.ToUpper();
            byte[] byteUserId = ASCIIEncoding.ASCII.GetBytes(upperEmail + upperEmail.Length + "JASON");
            HashAlgorithm algorithm = MD5.Create();
            byte[] byteHashSalt = algorithm.ComputeHash(byteUserId);
            return Convert.ToBase64String(byteUserId);
        }

        private static string HashPassword(string email, string password)
        {
            byte[] bytePassword = ASCIIEncoding.ASCII.GetBytes(password + GetSalt(email, password));

            int algorithmNo = email.Length % 3;

            HashAlgorithm algorithm = null;
            switch (algorithmNo)
            {
                case 0:
                    algorithm = SHA1.Create();
                    break;
                case 1:
                    algorithm = SHA512.Create();
                    break;
                case 2:
                    algorithm = MD5.Create();
                    break;
            }

            byte[] byteHashPassword = algorithm.ComputeHash(bytePassword);
            return Convert.ToBase64String(byteHashPassword);
        }
    }
}