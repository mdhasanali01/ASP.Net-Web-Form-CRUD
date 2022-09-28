using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRepository_Project.BookRepository
{
    public partial class AuthorBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvBooks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;

            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["BookId"] =(int) gvBooks.SelectedValue;
        }
    }
}