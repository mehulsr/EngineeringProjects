<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Forum
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="head_cph" Runat="Server">
    .forum-class
    {
        color:#000000;
    }

</asp:Content>--%>


<!--<asp:Content ID="content4" ContentPlaceHolderID="head_cph" runat="server">-->
    <head>
        <style>
            .gridview_styling {
                padding:5px;
            }
            .gridview_header_styling {
                padding:5px;
                text-align:center;
            }
            .gridview_buttons {
                margin:5px;
            }
        </style>
    
        <script type="text/javascript">
            function RadioCheck(rb) {
                var gv = document.getElementById("<%= gv_forum.ClientID %>");
                var rbs = gv.getElementsByTagName("input");
                var row = rb.parentNode.parentNode;
                for (var i = 0; i < rbs.length; i++) {
                    if (rbs[i].type == "radio" && rbs[i].checked && rbs[i] != rb) {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        </script>
    </head>
<!--</asp:Content>-->

<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <div class="container" style="margin-bottom:51px; width:100%;">
        <div class="row" style="margin-left:auto; margin-right:auto; width: 100%; margin-top: 20px;margin-bottom: 20px;">
            <fieldset style="width:100%;">
                <legend style="font-weight:700; color:#532db4">Alumni Forum</legend>
            </fieldset>
            <br />
            <div class="col-md-6" style="width:100%; margin-left:auto; margin-right:auto;">
                <asp:Wizard ID="Wizard1" runat="server" BorderColor="Black" Width="90%" style="margin-left:auto; margin-right:auto; margin-bottom:20px;" NavigationButtonStyle-CssClass="btn btn-primary gridview_buttons" DisplaySideBar="false" HeaderStyle-BorderStyle="Dashed" CancelButtonText="Cancel" DisplayCancelButton="true" FinishDestinationPageUrl="~/Submissions.aspx">
                    <WizardSteps>

                        <asp:WizardStep ID="step1" runat="server" Title="Search for Topic">
                            <fieldset style="margin-left:auto; margin-top:20px;">
                                <legend style="font-size:larger; color:#000000">Step 1: Search for a Topic</legend>
                                <div class="form-group" style="margin:20px;">
                                    <div class="col-sm-1">
                                        <asp:Label ID="Label2" class="control-label" runat="server">Search&nbsp;&nbsp;</asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="search_query" runat="server" TextMode="SingleLine" placeholder="" class="form-control"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <asp:Label ID="Label7" class="control-label" runat="server">Topics &nbsp;</asp:Label>
                                        <asp:DropDownList class="" ID="ddl_topic" runat="server">
                                            <asp:ListItem runat="server" Text="Academics"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="Hostels"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="Industry"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="Higher Studies"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="Others"></asp:ListItem> 
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <br />  
                            </fieldset>
                        </asp:WizardStep>

                        <asp:WizardStep ID="step2" runat="server" Title="Choose a Topic"  StepType="Step">
                             <fieldset style="margin-left:auto; margin:30px;">
                                <legend style="font-size:larger; color:#000000">Step 2: Choose a Topic</legend>

                                <asp:SqlDataSource ID="ds1_forum" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" 
                                    SelectCommand="select discussion_id, topic_name, topic_description, keywords from discussion_details 
                                    where topic_name like '%'+@search+'%' or topic_description like '%'+@search+'%' or keywords like '%'+@topic+'%'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="search_query" Name="search" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_topic" Name="topic" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:GridView ID="gv_forum" runat="server" DataSourceID="ds1_forum" Visible="true" AutoGenerateColumns="false" Width="100%" DataKeyNames="discussion_id" GridLines="Both">
                                    <Columns>
                                        <asp:BoundField HeaderText="Name" DataField="topic_name" ItemStyle-CssClass="gridview_styling"/>
                                        <asp:BoundField HeaderText="Description" DataField="topic_description" ItemStyle-CssClass="gridview_styling"/>
                                        <asp:BoundField HeaderText="Keywords" DataField="keywords" ItemStyle-CssClass="gridview_styling"/>
                                        <asp:TemplateField ItemStyle-CssClass="gridview_styling">
                                            <ItemTemplate>
                                                <asp:RadioButton ID="row_selector" runat="server" GroupName="row_selector_group" onclick="RadioCheck(this);" OnCheckedChanged="row_selector_CheckedChanged"/>
                                                <asp:HiddenField ID="row_hidden" runat="server" Value='<% #Eval("discussion_id") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:CommandField ShowSelectButton="true"  ItemStyle-CssClass="gridview_styling"/>--%>                                         
                                    </Columns>
                                </asp:GridView>                                 
                                <br />
                                <br />   
                            </fieldset>
                        </asp:WizardStep>

                        <asp:WizardStep ID="step3" runat="server" Title="Cast Your Vote">
                             <fieldset style="margin-left:auto; margin:30px;">
                                <legend style="font-size:larger; color:#000000">Step 3: Check Details</legend>
                                <br />
                                <br /> 
<%--                            <asp:SqlDataSource ID="ds2_forum" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" 
                                    SelectCommand="select * from discussion_details where discussion_id=@discussion_id">
                                    <asp:SelectParameters>
                                        <asp:ControlParameter ControlID="gv_forum" PropertyName="SelectedDataKey.Value" Name="discussion_id" />
                                        <asp:Parameter Name="discussion_id" Type="Int32" DefaultValue='<%# row_selected_id %>' />
                                    </asp:SelectParameters>
                                </asp:SqlDataSource>--%>
                                 <asp:Label runat="server" ID="helloL"></asp:Label>
                                 <%--<p id="helloP">Hello World <%# Session["discussion_select"] %></p>--%>
                                <asp:DetailsView ID="dv_forum" runat="server" Height="50px" Width="100%" AutoGenerateRows="true"/>                                 
                                <div class="form-group" style="margin:20px;">
                                    <asp:Button ID="generate_file" runat="server" CssClass="btn btn-primary" Text="Print Statistics" OnClick="generate_file_Click"/>
                                    <asp:Label ID="print_result" runat="server" />
                                </div>  
                            </fieldset>
                        </asp:WizardStep>
                    </WizardSteps>

<%--                    <StepNavigationTemplate>
                        <asp:Button ID="btn"
                    </StepNavigationTemplate>--%>

                </asp:Wizard>
            </div><!-- /.col-lg-12 -->
        </div><!-- /.row -->
    </div><!--/.container -->
</asp:Content>

