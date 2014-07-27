<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <h1>Contact Us</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <div class="col-lg-6">
		<h3>impress.me</h3>
		<p><span class="icon icon-home"></span> 1600 Ortigas Center, Pasig City<br/>
			<i class="fa fa-phone"></i> +639666696969 <br/>
			<i class="fa fa-mobile-phone"></i> +639156984578<br/>
			<i class="fa fa-mail"></i> impress.me@gmail.com</a> <br/>
			<i class="fa fa-facebook"></i> <a href="#"> @impress.me </a> <br/>
			<i class="fa fa-twitter"></i> <a href="#"> @impress.me </a> <br/>
		</p>
                
    </div>
            
    <div class="col-lg-6">
        <h2>Any Other Queries?</h2>
        <form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="inputEmail1" class="col-lg-4 control-label"></label>
				<div class="col-lg-10">
					<input type="email" class="form-control" id="inputEmail1" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="text1" class="col-lg-4 control-label"></label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="text1" placeholder="Your Name">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10">
					<button type="submit" class="btn btn-success">Sign in</button>
				</div>
			</div>
		</form>
    </div>
</asp:Content>

