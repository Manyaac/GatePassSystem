<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GateForm.aspx.cs" Inherits="GateePass.GateForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gate Pass Request</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px 25px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 420px;
        }

        h2 {
            text-align: center;
            margin-bottom: 24px;
            font-weight: 600;
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #444;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea,
        select,
        .aspNetTextBox {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        .error {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 4px;
            display: block;
        }

        .form-buttons {
            margin-top: 10px;
        }

        .form-buttons input[type="submit"],
        .form-buttons input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-buttons input[type="button"] {
            background-color: #aaa;
        }

        .form-buttons input:hover {
            background-color: #3e8e41;
        }

        .form-buttons input[type="button"]:hover {
            background-color: #888;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Gate Pass Request</h2>

            <div class="form-group">
                <label for="txtContractorAgency">Contractor/Agency Name</label>
                <asp:TextBox ID="txtContractorAgency" runat="server" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvContractorAgency" runat="server"
                    ControlToValidate="txtContractorAgency"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtPersonnelName">Personnel Name</label>
                <asp:TextBox ID="txtPersonnelName" runat="server" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvPersonnelName" runat="server"
                    ControlToValidate="txtPersonnelName"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtIdCardNo">ID Card No</label>
                <asp:TextBox ID="txtIdCardNo" runat="server" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvIdCardNo" runat="server"
                    ControlToValidate="txtIdCardNo"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="ddlRequestType">Type of Request</label>
                <asp:DropDownList ID="ddlRequestType" runat="server" CssClass="aspNetTextBox">
                    <asp:ListItem Text="-- Select --" Value="" />
                    <asp:ListItem Text="Temporary" Value="Temporary" />
                    <asp:ListItem Text="Permanent" Value="Permanent" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvRequestType" runat="server"
                    ControlToValidate="ddlRequestType"
                    InitialValue=""
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="ddlExpectedToReturn">Expected to Return</label>
                <asp:DropDownList ID="ddlExpectedToReturn" runat="server" CssClass="aspNetTextBox">
                    <asp:ListItem Text="-- Select --" Value="" />
                    <asp:ListItem Text="YES" Value="1" />
                    <asp:ListItem Text="NO" Value="0" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvExpectedToReturn" runat="server"
                    ControlToValidate="ddlExpectedToReturn"
                    InitialValue=""
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtRequestDate">Request Date</label>
                <asp:TextBox ID="txtRequestDate" runat="server" TextMode="Date" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvRequestDate" runat="server"
                    ControlToValidate="txtRequestDate"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtRequestTime">Request Time</label>
                <asp:TextBox ID="txtRequestTime" runat="server" TextMode="Time" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvRequestTime" runat="server"
                    ControlToValidate="txtRequestTime"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtReason">Reason</label>
                <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="4" CssClass="aspNetTextBox" />
                <asp:RequiredFieldValidator ID="rfvReason" runat="server"
                    ControlToValidate="txtReason"
                    ErrorMessage="Required"
                    CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-buttons">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>
    </form>
</body>
</html>
