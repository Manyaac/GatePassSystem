<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupervisorPage.aspx.cs" Inherits="GateePass.SupervisorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supervisor Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }
        .grid-view th, .grid-view td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .grid-view th {
            background-color: #f2f2f2;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .grid-view tr:hover {
            background-color: #f1f1f1;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .action-buttons button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .approve {
            background-color: #28a745;
            color: #fff;
        }
        .reject {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Gate Pass Requests</h2>
            <asp:GridView ID="GridViewRequests" runat="server" AutoGenerateColumns="false" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="RequestId" HeaderText="Request ID" />
                    <asp:BoundField DataField="ContractorAgency" HeaderText="Contractor/Agency" />
                    <asp:BoundField DataField="PersonnelName" HeaderText="Personnel Name" />
                    <asp:BoundField DataField="IdCardNo" HeaderText="ID Card No" />
                    <asp:BoundField DataField="RequestType" HeaderText="Request Type" />
                    <asp:BoundField DataField="ExpectedToReturn" HeaderText="Expected to Return" />
                    <asp:BoundField DataField="RequestDate" HeaderText="Request Date" />
                    <asp:BoundField DataField="RequestTime" HeaderText="Request Time" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="approve" CommandArgument='<%# Eval("RequestId") %>' OnClick="btnApprove_Click" />
                                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="reject" CommandArgument='<%# Eval("RequestId") %>' OnClick="btnReject_Click" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <h3>Approved/Rejected Requests</h3>
                <asp:GridView ID="GridViewStatus" runat="server" AutoGenerateColumns="false" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="RequestId" HeaderText="Request ID" />
                        <asp:BoundField DataField="PersonnelName" HeaderText="Employee Name" />
                        <asp:BoundField DataField="Reason" HeaderText="Purpose" />
                        <asp:BoundField DataField="SupervisorApproval" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
        </div>
    </form>
</body>
</html>
