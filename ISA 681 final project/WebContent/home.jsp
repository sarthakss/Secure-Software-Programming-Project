<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>


<jsp:include page="header.jsp"></jsp:include>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry, Please Login with valid Uid and Password");

%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>



<div class="left_content">
             <% 
					if(request.getAttribute("notlogin_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("notlogin_msg"));
					out.print("</font>");
					}
					%>
				<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' >");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
					%>
					<%
					if(request.getAttribute("finished")!=null){
					   out.print("<font size='2' color='navy'>");
                   out.print("<B>");
					out.print(request.getAttribute("finished"));
					  out.print("<B>");
   						out.print("</font>");
					}
				if(request.getAttribute("category")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("category"));
					out.print("</font>");
					}
				
					%>
            	<div class="calendar_box">
            	
                	<div class="calendar_box_content">
               
                		<h1>HOMEPAGE</h1>
                		              		
                	<p>
                	<font style="color: navy;">
                	
                	<b>INSTRUCTIONS: </b>
                	
                	Please click on <b>' TAKE QUIZ' </b> to take the quiz
                	Typein 
                	Now Teacher and Student can work together<br> 
                							online.Tutors are most welcomed to my site <br>
                							   they can create Quiz simply by clicking Make<br>  
                							    Quiz link.And Students can appear in quiz based on various
                							   subject. 
                							   
                							   
                							   </font>
                	</p>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/>


                     
                	</div>
                </div>
                
                     
            </div>
            <!--end of left content-->

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->


</body></html>

