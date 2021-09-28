using System;
using System.Data.SqlClient;
using System.IO;

namespace OnlineRegisterClassLibrary
{
    public class DbTools
    {
        private string ConnectionString;

        public DbTools(string connStr)
        {

        }
        public void ExecuteSqlScript(string sqlStringPath)
        {
            string scriptContent = File.ReadAllText(sqlStringPath);
        }
        public string GetTableList(string tableName)
        {
            string stOut = "";
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\data\onlineregister\register.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection dbConn = new SqlConnection(connStr))
            {
                using (SqlCommand dbCmd = new SqlCommand("SELECT * FROM " +tableName, dbConn))
                {
                    dbConn.Open();
                    using (SqlDataReader dbReader = dbCmd.ExecuteReader())
                    {
                        while (dbReader.Read())
                        {
                            stOut+=dbReader.GetString(1) + " - " + dbReader.GetString(2)+"\n";
                        }
                    }
                }
            }
            return stOut;
        }
    }
}
