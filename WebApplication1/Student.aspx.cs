using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebApplication1
{
    public partial class Student : System.Web.UI.Page
    {
        public SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);

        #region Data Access Logic
        protected DataTable DataAccess(string Command = "", string Query = "SELECT * FROM Person", string PersonId = "", string FirstName = "", string LastName = "")
        {
            DataTable dt = new DataTable();

            switch (Command)
            {
                case RadGrid.PerformInsertCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@FirstName", FirstName));
                        command.Parameters.Add(new SqlParameter("@LastName", LastName));
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                    return dt;
                case RadGrid.UpdateCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@PersonId", PersonId));
                        command.Parameters.Add(new SqlParameter("@FirstName", FirstName));
                        command.Parameters.Add(new SqlParameter("@LastName", LastName));
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                    return dt;
                case RadGrid.DeleteCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@PersonId", PersonId));
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                    return dt;
                default:
                    using (SqlDataAdapter data = new SqlDataAdapter(Query, connection))
                    {
                        data.Fill(dt);
                        connection.Close();
                    }
                    return dt;
            }
        }
        #endregion

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editableItem = ((GridEditableItem)e.Item);
            Hashtable values = new Hashtable();
            editableItem.ExtractValues(values);
            string query = "INSERT INTO Person (FirstName, LastName) VALUES (@FirstName, @LastName)";
            DataAccess(Command: RadGrid.PerformInsertCommandName, Query: query, FirstName: values["FirstName"].ToString(), LastName: values["LastName"].ToString());
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = DataAccess();
        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editableItem = ((GridEditableItem)e.Item);
            Hashtable values = new Hashtable();
            editableItem.ExtractValues(values);
            string query = "UPDATE Person SET FirstName=@FirstName, LastName=@LastName WHERE PersonId=@PersonId";
            DataAccess(Command: RadGrid.UpdateCommandName, Query: query, PersonId: values["PersonId"].ToString(), FirstName: values["FirstName"].ToString(), LastName: values["LastName"].ToString());

        }

        protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editableItem = ((GridEditableItem)e.Item);
            Hashtable values = new Hashtable();
            editableItem.ExtractValues(values);
            string query = "DELETE FROM Person WHERE PersonId=@PersonId";
            DataAccess(Command: RadGrid.DeleteCommandName, Query: query, PersonId: values["PersonId"].ToString());
        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                if ((e.Item is GridDataInsertItem) && e.Item.IsInEditMode)
                {
                    Debug.WriteLine("Init Insert Operation Triggered");
                }
                else if ((e.Item is GridEditableItem) && e.Item.IsInEditMode)
                {
                    Debug.WriteLine("Edit Operation Triggered");
                }
            }
            else if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                Debug.WriteLine($"The {dataItem} Item Is In Regular Mode");
            }
        }
    }
}