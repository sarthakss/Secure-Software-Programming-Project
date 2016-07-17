<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>


<jsp:include page="header.jsp"></jsp:include>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");

%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>



<div >
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
				
					%>
            	<div >
            	
                	<div >
               
                		<h1>THE RESULTS OF YOUR QUIZ ARE GIVEN BELOW</h1>
                		              		
                		              		
				<%
				String name=(String)session.getAttribute("quizname");
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
					PreparedStatement ps= con.prepareStatement("select * from quizques where quizname='"+name+"'");
					ResultSet rs=ps.executeQuery();
					out.print("<table>");
					while(rs.next()){
					out.print("<tr><td><b>Question:</b></td><td>"+rs.getString(1)+"</td></tr>");
					
					out.print("<tr><td><b>Answer:</b></td><td>"+rs.getString(6)+"</td></tr>");
					out.print("<tr><td><b>Description:</b></td><td>"+rs.getString(9)+"</td></tr>");
					out.println("<tr><td>......................<BR>");
					}
					
					out.print("</table>");
					
				}catch(Exception e){e.printStackTrace();}
				 %>					


                     
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

