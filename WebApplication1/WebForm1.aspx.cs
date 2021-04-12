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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        #region Data Access Logic
        protected DataTable DataAccess(string Command = "", string Query = "SELECT * FROM Student", string Id  = "", string Name = "", string Department = "", int Age = 0, string Gender = "", DateTime DateOfBirth = new DateTime())
        {
            DataTable dt = new DataTable();

            switch (Command)
            {
                case RadGrid.PerformInsertCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Name", Name));
                        command.Parameters.Add(new SqlParameter("@Department", Department));
                        command.Parameters.Add(new SqlParameter("@Age", Age));
                        command.Parameters.Add(new SqlParameter("@Gender", Gender));
                        command.Parameters.Add(new SqlParameter("@DateOfBirth", DateOfBirth));
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                    return dt;
                case RadGrid.UpdateCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Id", Id));
                        command.Parameters.Add(new SqlParameter("@Name", Name));
                        command.Parameters.Add(new SqlParameter("@Department", Department));
                        command.Parameters.Add(new SqlParameter("@Age", Age));
                        command.Parameters.Add(new SqlParameter("@Gender", Gender));
                        command.Parameters.Add(new SqlParameter("@DateOfBirth", DateOfBirth));
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                    }
                    return dt;
                case RadGrid.DeleteCommandName:
                    using (SqlCommand command = new SqlCommand(Query, connection))
                    {
                        command.Parameters.Add(new SqlParameter("@Id", Id));
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
            string query = "INSERT INTO Student (Name, Department, Age, Gender, DateOfBirth) VALUES (@Name, @Department, @Age, @Gender, @DateOfBirth)";
            DataAccess(Command: RadGrid.PerformInsertCommandName, Query: query, Name: values["Name"].ToString(), Department: values["Department"].ToString(), Age: Convert.ToInt32(values["Age"]), Gender: values["Gender"].ToString(), DateOfBirth: Convert.ToDateTime(values["DateOfBirth"]));
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
            string query = "UPDATE Student SET Name=@Name, Department=@Department, Age=@Age, Gender=@Gender, DateOfBirth=@DateOfBirth WHERE Id=@Id";
            DataAccess(Command: RadGrid.UpdateCommandName, Query: query, Id: values["Id"].ToString(), Name: values["Name"].ToString(), Department: values["Department"].ToString(), Age: Convert.ToInt32(values["Age"]), Gender: values["Gender"].ToString(), DateOfBirth: Convert.ToDateTime(values["DateOfBirth"]));

        }

        protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editableItem = ((GridEditableItem)e.Item);
            Hashtable values = new Hashtable();
            editableItem.ExtractValues(values);
            string query = "DELETE FROM Student WHERE Id=@Id";
            DataAccess(Command: RadGrid.DeleteCommandName, Query: query, Id: values["Id"].ToString());
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


        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "date")
            {
                GridDataItem item = e.Item as GridDataItem;
                int ID = Convert.ToInt32(item.GetDataKeyValue("Id"));
                Response.Redirect(String.Format("~/StudentDetails.aspx?user={0}&id={1}", "Hello", ID));
            }

        }

        //private void RadGrid2_ItemCreated(object sender, GridItemEventArgs e)
        //{
        //    if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        //    {
        //        //the item is in edit mode    
        //        GridEditableItem editedItem = e.Item as GridEditableItem;
        //        //do something here 
        //    }
        //    else if (e.Item is GridDataItem)
        //    {
        //        //the item is in regular mode
        //        GridDataItem dataItem = e.Item as GridDataItem;
        //        //do something here 
        //    }
        //}
    }
}       