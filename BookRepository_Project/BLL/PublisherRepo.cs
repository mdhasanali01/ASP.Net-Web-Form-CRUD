using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BookRepository_Project.BLL
{
    public class PublisherRepo : IPublisherRepo,IDisposable
    {
        SqlConnection con;
        public PublisherRepo()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public void Delete(PublisherDTO dto)
        {
            throw new NotImplementedException();
        }

      

        public PublisherDTO Get(int id)
        {
            throw new NotImplementedException();
        }

        public ICollection<PublisherDTO> GetAll()
        {
            List<PublisherDTO> publishers = new List<PublisherDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Publishers", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    publishers.Add(new PublisherDTO
                    {
                        PublisherId = r.Field<int>("PublisherId"),
                        PublisherName = r.Field<string>("publisherName"),
                        Address = r.Field<string>("Address"),
                        Email = r.Field<string>("Email")
                    });
                }
                return publishers;

            }
        }

        public void Insert(PublisherDTO dto)
        {
            string sql = @"INSERT INTO [Publishers]
                           ([PublisherName]
                           ,[Address]
                           ,[Email])
                            VALUES
                           (@PublisherName
                           ,@Address
                           ,@Email)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@PublisherName", dto.PublisherName);
                cmd.Parameters.AddWithValue("@Address", dto.Address);
                cmd.Parameters.AddWithValue("@Email", dto.Email);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }

        public int PublisherCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Publishers", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }

        public void Update(PublisherDTO dto)
        {
            {
                string CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string updateQuery = "Update Publishers SET PublisherName = @PublisherName,  " +
                        " Address = @Address,Email= @Email WHERE publisherid = @publisherid";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);

                    SqlParameter parampublisherid = new SqlParameter("@publisherid", dto.PublisherId);
                    cmd.Parameters.Add(parampublisherid);
                    SqlParameter publishername = new SqlParameter("@publishername", dto.PublisherName);
                    cmd.Parameters.Add(publishername);
                    SqlParameter paramName = new SqlParameter("@address", dto.Address);
                    cmd.Parameters.Add(paramName);

                    SqlParameter paramemail = new SqlParameter("@email", dto.Email);
                    cmd.Parameters.Add(paramemail);

                    con.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw ex.InnerException;
                    }
                    this.con.Close();
                }
            }
        }
        public void Dispose()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}