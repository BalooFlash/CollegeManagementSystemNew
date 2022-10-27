using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CollegeMangementSystemNew.Models
{
    public class CommonFn
    {
        public class Commonfnx
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CollegeCS"].ConnectionString);
            //ConfigurationManager.ConnectionStrings["CollegeCS"].ConnectionString

            public void Query(String query)
            {
                if(con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query,con);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            public DataTable Fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;

            }
        }
    }
}