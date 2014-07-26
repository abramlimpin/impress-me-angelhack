<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>impress.me - Get That Next Date </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href="css/custom.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="login">
    <div class="splash">
      <div class="container">

        <div class="row">
          <div class="col-lg-offset-4 col-lg-4">
            <form class="landing" runat="server" style="margin-top: 50px;">
                <div class="col-lg-12">
                </div>
                <h1 class="text-center text-info">I am a</h1>
                <div class="form-group">
                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                        <asp:ListItem>Guy</asp:ListItem>
                        <asp:ListItem>Girl</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <h1 class="text-center text-info">dating a </h1>
                <div class="form-group">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                        <asp:ListItem>Chick</asp:ListItem>
                        <asp:ListItem>Dude</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:LinkButton id="btnSubmit" runat="server" 
                        class="btn btn-info btn-lg btn-block" onclick="btnSubmit_Click">
                        Impress Me&nbsp;&nbsp;<span class="text-danger"><i class="fa fa-heart"></i></span>
                    </asp:LinkButton>
                </div>
                <hr />
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title text-center">
                                <a data-toggle="collapse" data-parent="#accordion" href="#advanced">
                                    <small>Display Advanced Search</small>
                                </a>
                            </h4>
                        </div>
                        <div id="advanced" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group text-center">
                            <label>Mood</label><br />
                            <div class="col-lg-offset-3 col-lg-6">
                                <asp:DropDownList ID="ddlMoods" runat="server" class="form-control">
                                    <asp:ListItem>Happy</asp:ListItem>
                                    <asp:ListItem>Sad</asp:ListItem>
                                    <asp:ListItem>Angry</asp:ListItem>
                                    <asp:ListItem>Disappointed</asp:ListItem>
                                    <asp:ListItem>Sentimetal</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br /><br />
                        <div class="form-group text-center">
                            <label>Budget</label><br />
                            <div class="form-inline">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="txtMin" runat="server" class="form-control" type="number" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
                </div>
            </form>
          </div>
      <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
