<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <div class="row">

        <div class="col-md-6">
            <asp:Image ID="imgPost" runat="server" class="img-responsive" />
        </div>

        <div class="col-md-4">
            <h3><asp:Literal ID="ltName" runat="server" /></h3>
            <p><asp:Literal ID="ltDesc" runat="server" /></p>
            <h3>Suggestion Details</h3>
            <ul>
                <li>Budget starts at P <asp:Literal ID="ltBudget" runat="server" /></li>
                <li>Other details here...</li>
                <li>Other details here...</li>
            </ul>
            <div class="alert alert-danger">
                <asp:Literal ID="ltHazards" runat="server" />
            </div>
        </div>

    </div>
    <!-- /.row -->

    <!-- Related Projects Row -->
    <div class="row">

        <div class="col-lg-12">
            <h3 class="page-header">Related Projects</h3>
        </div>

        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

    </div>
</asp:Content>

