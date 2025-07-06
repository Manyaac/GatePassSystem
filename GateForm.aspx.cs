using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GateePass 
{
    public partial class GateForm : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearForm();

             
            }
        }

        private void ClearForm()
        {
            txtContractorAgency.Text = "";
            txtPersonnelName.Text = "";
            txtIdCardNo.Text = "";
            ddlRequestType.SelectedIndex = 0;
            ddlExpectedToReturn.SelectedIndex = 0;
            txtRequestDate.Text = "";
            txtRequestTime.Text = "";
            txtReason.Text = "";
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GatePassDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO GatePassRequests (ContractorAgency, PersonnelName, IdCardNo, RequestType, ExpectedToReturn, RequestDate, RequestTime, Reason)
                    VALUES (@ContractorAgency, @PersonnelName, @IdCardNo, @RequestType, @ExpectedToReturn, @RequestDate, @RequestTime, @Reason)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ContractorAgency", txtContractorAgency.Text);
                cmd.Parameters.AddWithValue("@PersonnelName", txtPersonnelName.Text);
                cmd.Parameters.AddWithValue("@IdCardNo", txtIdCardNo.Text);
                cmd.Parameters.AddWithValue("@RequestType", ddlRequestType.SelectedValue);
                cmd.Parameters.AddWithValue("@ExpectedToReturn", ddlExpectedToReturn.SelectedValue);
                cmd.Parameters.AddWithValue("@RequestDate", txtRequestDate.Text);
                cmd.Parameters.AddWithValue("@RequestTime", txtRequestTime.Text);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("SupervisorPage.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtContractorAgency.Text = "";
            txtPersonnelName.Text = "";
            txtIdCardNo.Text = "";
            ddlRequestType.SelectedIndex = 0;
            ddlExpectedToReturn.SelectedIndex = 0;
            txtRequestDate.Text = "";
            txtRequestTime.Text = "";
            txtReason.Text = "";
        }


    }
}
