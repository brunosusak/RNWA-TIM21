using MySqlConnector;
using System.Data;
using System.Web.Services;

namespace FsreWebService
{
    /// <summary>
    /// Summary description for WebServis1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServis1 : System.Web.Services.WebService
    {

        public static DataTable SendQuerry(string querry)
        {
            string connString = "SERVER=localhost" + ";" +
                "DATABASE=clinic;" +
                "UID=root;" +
                "PASSWORD=;";

            MySqlConnection cnMySQL = new MySqlConnection(connString);

            MySqlCommand cmdMySQL = cnMySQL.CreateCommand();

            MySqlDataReader reader;

            cmdMySQL.CommandText = querry;

            cnMySQL.Open();

            reader = cmdMySQL.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(reader);


            cnMySQL.Close();

            return dt;

        }

        [System.Web.Services.WebMethod]
        public float konverzijaBAMToEUR(float bam)
        { 
            return (float)(bam * 1.96);
        }
        
        [System.Web.Services.WebMethod]
        public float konverzijaEURToBAM(float eur)
        { 
            return (float)(eur * 0.51);
        }
   
        [System.Web.Services.WebMethod]
        public DataTable getUserByUserNumber(string userNumber)
        {
            string querry = "select * from users where userNumber=" + userNumber;
            return SendQuerry(querry);
        }

        [System.Web.Services.WebMethod]
        public DataTable getPatientByPatientNumber(string patientNumber)
        {
            string querry = "select * from patients where patientNumber=" + patientNumber;
            return SendQuerry(querry);
        }


    }
}
