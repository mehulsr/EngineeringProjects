<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="Content/font-awesome.min.css" rel="stylesheet" />--%>
    <%--<link href="Content/Style.css" rel="stylesheet" />--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <%--<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>--%>
<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
    
    <style>
        body{
            /*background: url(http://mymaplist.com/img/parallax/back.png);*/
            background: url("Images/colourful.jpg");
            background-size: cover;
            background-repeat: no-repeat;
	        background-color: #444;
            font-family:Roboto;
            /*background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url("Images/colourful.jpg");*/    
        }

        .vertical-offset-100{
            padding-top:100px;
        }
    </style>

</head>
<body>
<%--    <form id="form2" runat="server">
    <div>
        <asp:Panel ID="panel_reg" runat="server">
            <asp:Label Text="Registration Number" runat="server" ID="label_reg" />
            <br />
            <asp:TextBox ID="text_reg" runat="server" />
            <br />
            <asp:Label Text="Date of Birth" runat="server" ID="label_dob" />
            <br />
            <asp:TextBox ID="text_dob" runat="server" />
            <br />
            <asp:ImageButton ID="but_dob" runat="server" />
            <br />
            <asp:Calendar ID="cal_dob" runat="server" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged"/>
            <br />
            <asp:Button ID="but_login" runat="server" Text="Login" />
        </asp:Panel>
    </div>
    </form>--%>
    <%--<form accept-charset="UTF-8" role="form" id="form2" runat="server">--%>
    <div class="container">
        <div class="row vertical-offset-100">
    	    <div class="col-md-4 col-md-offset-4">
    		    <div class="panel panel-default">
			  	    <div class="panel-heading">
			    	    <h3 class="panel-title"  style="font-size:28px;">Please sign in</h3>
			 	    </div>
			  	    <div class="panel-body">
			    	    <form accept-charset="UTF-8" role="form" id="form1" runat="server">
                        <fieldset>
			    	  	    <div class="form-group">
                                <asp:TextBox CssClass="form-control" placeholder="Reg. No." ID="reg" runat="server" />
                                   <asp:RequiredFieldValidator ID="v1" runat="server" ErrorMessage="*Please Enter Registration Number" ControlToValidate="reg" style="font-size:11px;"></asp:RequiredFieldValidator>
			    		    </div>
			    		    <div class="form-group">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dob" PopupButtonID="Image1"/>
                                <asp:ImageButton ID="calendar_image" runat="server" ImageUrl="Images/calendar.png" Width="10%" style="float:left;" CausesValidation="false"/>  <%--OnClick="calendar_image_Click"--%> 
                                <asp:TextBox CssClass="form-control" placeholder="DOB" ID="dob" runat="server" Width="90%" style="text-align:right;"/>
                                <%--<asp:Calendar ID="birthday_cal" runat="server" Visible="false" Width="100%" OnSelectionChanged="birthday_cal_SelectionChanged"/>--%>
                                <asp:RequiredFieldValidator ID="v2" runat="server" ErrorMessage="*Please Enter Date of Birth" ControlToValidate="dob" style="font-size:11px;"></asp:RequiredFieldValidator>			    	    
                            </div>
<%--			    		<div class="checkbox">
			    	    	    <label>
			    	    		    <input name="remember" type="checkbox" value="Remember Me"> Remember Me
			    	    	    </label>
			    	        </div>--%>
                            <asp:Label ID="result_label" runat="server" />
                            <asp:Button CssClass="btn btn-lg btn-success btn-block" Text="Login" runat="server" ID="submit" OnClick="submit_Click"/>
                          </fieldset>
			      	    </form>
			        </div>
			    </div>
		    </div>
	    </div>
    </div>
    <%--</form>--%>

    <script>
        $(document).ready(function () {
            $(document).mousemove(function (e) {
                TweenLite.to($('body'),
                   .5,
                   {
                       css:
                         {
                             backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px"
                         }
                   });
            });
        });
    </script>

</body>
</html>
