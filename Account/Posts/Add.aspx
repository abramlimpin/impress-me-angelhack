<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Account_Posts_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <h3>Add a Suggestion</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-5">
            <div class="form-group">
                <label class="control-label col-lg-4">Type</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlTypes" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Suggestion</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSuggestion" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Description</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine" />
                </div>
            </div>
            <hr />
            <div class="form-group">
                <label class="control-label col-lg-4">Hazards</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtHazards" runat="server" class="form-control" TextMode="MultiLine" />
                </div>
            </div>
            <hr />
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-default btn-block">
                        Add Suggestion
                    </asp:LinkButton>
                </div>
            </div>
    </form>
</asp:Content>

