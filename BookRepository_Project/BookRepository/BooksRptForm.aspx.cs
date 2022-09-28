using BookRepository_Project.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRepository_Project.BookRepository
{
    public partial class BooksRptForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Booksi");
                    ds.Tables["Booksi"].Columns.Add(new DataColumn("image", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["Booksi"].Rows.Count; i++)
                    {
                        string f = AppDomain.CurrentDomain.BaseDirectory + @"Uploads\" + ds.Tables["Booksi"].Rows[i]["Picture"].ToString();
                        ds.Tables["Booksi"].Rows[i]["image"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["Booksi"].Rows[i]["Picture"].ToString()));
                    }

                    BooksRpt rpt = new BooksRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}