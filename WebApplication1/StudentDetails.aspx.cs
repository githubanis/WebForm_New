using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        private string d1;
        private int d2;
        public void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["user"] != null)
                {
                    //Response.Write(Request.QueryString["user"]);
                    var data = Request.QueryString["user"];
                    var data2 = Request.QueryString["id"];
                    SetData(data, Convert.ToInt32(data2));
                    GetData();
                }
            }
        }

        private void SetData(string data, int data2)
        {
            d1 = data;
            d2 = data2;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
            
        }

        public void GetData()
        {
            string query = $"SELECT * FROM Student Where Id={d2}";

            String ConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand cmdd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmdd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            foreach (DataRow drr in ds.Tables[0].Rows)
            {
                Label1.Text += drr["Name"];
                Label2.Text += drr["Department"];
                Label3.Text += drr["Age"].ToString();
                Label4.Text += drr["Gender"];
                Label5.Text += drr["DateOfBirth"].ToString();
            }
            //return myDataTable;
        }
    }
}