<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
       xmlns:f="http://xmlns.jcp.org/jsf/core"
      >


<h:head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
	<title>Login Form</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</h:head>


<!-- ============================== BODY STARTS ===============================-->


<h:body>
	<div id="main_container">
		<div class="main_content">
			<div id="header"></div>
			<div class="top_center_box"></div>
			<div class="center_box">
				<div id="menu_tab">
					<ul class="menu">
						<li><a href="home.jsp" class="nav">Home</a></li>
						<li class="divider"></li>
						<li><a href="takequiz.jsp" class="nav">Take Quiz</a></li>
						<li class="divider"></li>
						<li><a href="register.jsp" class="nav">Register</a></li>
						<li class="divider"></li>
						<li><a href="makequiz.jsp" class="nav">Make quiz</a></li>
					</ul>
				</div>
				<div class="middle_box">
					<div class="middle_box_text_content">
						<div class="middle_box_title"></div>
						<p class="middle_text"></p>
					</div>
				</div>


				<div>
					<%
						if (request.getAttribute("notlogin_msg") != null) {
							out.print("<font size='2' color='red' m>");
							out.print(request.getAttribute("notlogin_msg"));
							out.print("</font>");
						}
					%>
					<%
						if (request.getAttribute("Error") != null) {
							out.print("<font size='2' color='red' m>");
							out.print(request.getAttribute("Error"));
							out.print("</font>");
						}
					%>
					<div class="calendar_box">
						<div class="calendar_box_content">
							<h1>Please Login to continue</h1>
							<!-- FORM STARTS -->

							<form method="post" action="loginprocess.jsp">
								<table>
									<tr>
										<td style="color: navy;"><B> Login Form</B></td>
									</tr>
									<tr>
										<td><br /></td>
									</tr>
									<tr>
										<td>Category:</td>
										<td><select  name="category" required>
												<option>Select a Category</option>
												<option>Teacher</option>
												<option>Student</option>
										</select></td>
									</tr>
									<tr>
										<td><br /></td>
									</tr>

									<tr>
										<td>User Name:</td>
										<td><input type="text" name="username" maxlength="20" value="Your Name" required/></td>
									
<h:inputText name="username" value="Your Name"  tabindex="1" required="true" 
requiredMessage="first name is required"> 
<f:validateLength minimum="1" maximum="15"/>
<f:validateRegex pattern="[a-zA-Z]+"/>
</h:inputText>
<h:message id="m1" for="fName" style="color:red"/>

</tr>

									<tr>
										<td><br /></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" name="userpass" value="password" required/></td>
									</tr>

									<tr>
										<td><br /></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="submit" value="Sign in" /> <a
											href="register.jsp">Register</a></td>
									</tr>
								</table>
							</form>



						</div>
					</div>


				</div>
				<!--end of left content-->


				<div id="footer"></div>


			</div>
			<!--end of center box-->
		</div>
		<!--end of main content-->
	</div>
	<!--end of main container-->
</h:body>
</html>