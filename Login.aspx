<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <h1>Login & Register</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-4">
            <h3>User Login</h3>
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-social btn-facebook">
                        <i class="fa fa-facebook"></i> Sign in with Facebook
                    </asp:LinkButton>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:LinkButton ID="btnLoginTwitter" runat="server" class="btn btn-social btn-twitter">
                        <i class="fa fa-twitter"></i> Sign in with Twitter
                    </asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="col-lg-offset-2 col-lg-4">
            <h3>Registration</h3>
            <div class="form-group">
                <label class="control-label col-lg-4">First Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFN" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Last Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLN" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtReg_Email" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtReg_Password" runat="server" TextMode="Password" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:Button ID="btnRegister" runat="server" class="btn btn-default" Text="Register" />
                </div>
            </div>
        </div>
    </form>
    
</asp:Content>

