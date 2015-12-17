<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wall.aspx.cs" Inherits="Wall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Wall of Fame
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head_cph" Runat="Server">
    <style>
        .alum_table_style {
            width:90%;
            margin:20px;
            padding:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
        <div class="container" style="margin-bottom:51px; width:100%;">
              <div class="row" style="margin-left:auto; margin-right:auto; width: 100%; margin-top: 20px;margin-bottom: 20px;">
                <fieldset style="width:100%;">
                    <legend style="font-weight:700; color:#532db4">Contact the MIT Alumni</legend>
                </fieldset>
                  <br />
                   <div  style="width:100%;">
                    <div style="margin-left:auto; margin-right:auto; width:90%;">
                        <div class="form-group" style="margin-left:auto; margin-right:auto; width:100%;">
                          <div class="col-sm-3">
                            <asp:Label ID="Label7" class="control-label" runat="server">Year of Passing&nbsp;</asp:Label>
                            <asp:DropDownList ID="ddl_batch" runat="server"></asp:DropDownList>
                          </div>    
                          <div class="col-sm-3">
                            <asp:Label ID="Label1" class="control-label" runat="server">Course &nbsp;</asp:Label>
                            <asp:DropDownList class="" ID="ddl_course" runat="server">
                                <asp:ListItem runat="server" Text="B.Tech"></asp:ListItem>
                                <asp:ListItem runat="server" Text="M.Tech"></asp:ListItem>
                                <asp:ListItem runat="server" Text="PhD"></asp:ListItem>
                                <asp:ListItem runat="server" Text="Others"></asp:ListItem> 
                            </asp:DropDownList>
                          </div>
                          <div class="col-sm-4">
                            <asp:Label ID="Label8" class="control-label" runat="server">Branch &nbsp;</asp:Label>
                            <asp:DropDownList class="" ID="ddl_branch" runat="server"></asp:DropDownList>
                          </div>
                          <div class="col-sm-2">
                              <asp:Button ID="alum_search" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="alum_search_Click"/>
                          </div>
                        </div>
                        <br />
                        <br />
                        <asp:Label runat="server" ID="result_label" />
                        <asp:Table runat="server" ID="alum_table" CssClass="alum_table_style"></asp:Table>                        
                        <%--                        
                        <asp:SqlDataSource ID="ds1_wall" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" 
                            SelectCommand="select * from user_details inner join achievements_details on user_details.reg_no=achievements_details.achiever_id where user_details.course=@course and user_details.branch = @branch and user_details.batch=@year">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_course" Name="course" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddl_branch" Name="branch" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddl_batch" Name="year" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="gv_wall" runat="server" DataSourceID="ds1_wall" Visible="false"></asp:GridView>
                        --%>
                    </div>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
    </div><!--/.container -->
</asp:Content>

