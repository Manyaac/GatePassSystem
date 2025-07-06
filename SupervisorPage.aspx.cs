using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GateePass
{
    public partial class SupervisorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindStatusGridView();
            }
        }

        private void BindGridView()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GatePassDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM GatePassRequests WHERE SupervisorApproval IS NULL";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);


                GridViewRequests.DataSource = dt;
                GridViewRequests.DataBind();
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32((sender as Button).CommandArgument);
            UpdateRequestStatus(requestId, true);
            BindGridView();
            BindStatusGridView();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32((sender as Button).CommandArgument);
            UpdateRequestStatus(requestId, false);
            BindGridView();
            BindStatusGridView();
        }

        private void UpdateRequestStatus(int requestId, bool isApproved)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GatePassDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string status = isApproved ? "approved" : "rejected";
                string query = "UPDATE GatePassRequests SET SupervisorApproval = @SupervisorApproval WHERE RequestId = @RequestId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SupervisorApproval", status);
                cmd.Parameters.AddWithValue("@RequestId", requestId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        private void BindStatusGridView()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GatePassDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT RequestId, PersonnelName, Reason, SupervisorApproval FROM GatePassRequests WHERE SupervisorApproval IS NOT NULL";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);


                GridViewStatus.DataSource = dt;
                GridViewStatus.DataBind();
            }
        }
    }
}
