<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Suggest.aspx.cs" Inherits="Suggest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <h1>Suggested Activities</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <form runat="server">
        <div class="col-lg-3">
            <h3>Location</h3>
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:DropDownList ID="ddlRegions" runat="server" class="form-control" AutoPostBack="true"
                        onselectedindexchanged="ddlRegions_SelectedIndexChanged" />
                    <asp:DropDownList ID="ddlCities" runat="server" class="form-control" />
                </div>
            </div>
            <h3>Budget</h3>
            <div class="col-lg-12">
                <div class="form-inline">
                    <div class="form-group">
                        <div class="col-lg-12">
                            <asp:TextBox ID="txtMin" runat="server" type="number" class="form-control" min="0.00" step="0.01" text="1" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12">
                            <asp:TextBox ID="txtMax" runat="server" type="number" class="form-control" min="50.00" step="0.01" Text="100" />
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <asp:Button ID="btnSearch" runat="server" class="btn btn-block" text="Search" />
        </div>
        <div class="col-lg-9">
            <div class="row">
                <div class="col-md-7">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                    </a>
                </div>
                <div class="col-md-5">
                    <h3>Project One</h3>
                    <h4>Subheading</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                    <a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>
        
            <br /><br />
            <div class="row">
                <asp:ListView ID="lvSuggests" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 portfolio-item">
                            <a href="#">
                                <img class="img-responsive" src='<%# string.Concat("assets/posts/", Eval("Image")) %>' alt="">
                            </a>
                            &nbsp;<h3>
                                <a href="#"><%# Eval("PostName") %></a>
                            </h3>
                            <h4>Starts at P<%# Eval("Budget", "{0: #,###.00}") %></h4>
                            <p><%# Eval("Description") %></p>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
            </div>
            <!-- /.row -->

            <!-- Projects Row -->
            <div class="row">
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
            </div>

            <!-- Projects Row -->
            <div class="row">
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
                <div class="col-md-4 portfolio-item">
                    <a href="#">
                        <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                    </a>
                    <h3>
                        <a href="#">Project Name</a>
                    </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
    </form>
    
</asp:Content>

