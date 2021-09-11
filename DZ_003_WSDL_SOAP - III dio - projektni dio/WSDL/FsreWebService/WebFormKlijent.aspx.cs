using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FsreWebService
{
    public partial class WebFormKlijent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void ToEur_Click(object sender, EventArgs e)
        {
            Service.WebServis1SoapClient client = new Service.WebServis1SoapClient("WebServis1Soap");
            float value = float.Parse(inputField.Text);
            float response = client.konverzijaBAMToEUR(value);
            ResultLabel.Text = response + " EUR";
        }

        protected void ToBam_Click(object sender, EventArgs e)
        {
            Service.WebServis1SoapClient client = new Service.WebServis1SoapClient("WebServis1Soap");
            float value = float.Parse(inputField.Text);
            float response = client.konverzijaEURToBAM(value);
            ResultLabel.Text = response + " BAM";
        }

        protected void inputField_TextChanged(object sender, EventArgs e)
        {

        }
    }
}