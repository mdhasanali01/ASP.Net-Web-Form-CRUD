using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRepository_Project.BookRepository
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            var fu = ListView1.InsertItem.FindControl("fu") as FileUpload;
            if (fu.HasFile)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                    fu.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.Values["Picture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var fu = ListView1.EditItem.FindControl("fu") as FileUpload;
            if (fu.HasFile)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                    fu.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.NewValues["Picture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var id = DataBinder.Eval(e.Item.DataItem, "Publisherid").ToString();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand($"SELECT PublisherName FROM Publishers WHERE Publisherid={id}", con))
                    {
                        con.Open();
                        var dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            var l = e.Item.FindControl("PublisheridLabel") as Label;
                            if (l != null)
                                l.Text = dr[0].ToString();
                            con.Close();
                        }
                    }
                }
            }
        }
    }
}