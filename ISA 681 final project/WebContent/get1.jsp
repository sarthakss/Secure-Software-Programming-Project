<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.cs681.dao.QuizDAO"%>
<%-- <%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>--%>

<%! static int count1=0; %>

<%! static int total=0; %>
<%! int betTot=0; %>

<%
if(session.getAttribute("count")!=null){
String name=(String)session.getAttribute("quizname");
String ans= (String)session.getAttribute("ans");
Integer count=(Integer)session.getAttribute("count");

String bet = request.getParameter("betting");

// String bet= (String)session.getAttribute("bet2");

 int betint = Integer.parseInt(bet.trim());
 int sum= betint+1;
 System.out.println("The value of betint +1 "+sum);




try{
if(count1==0)
{
count1=count-1;
QuizDAO dao = new QuizDAO(); 
Connection con = dao.quizConn();
// Class.forName("oracle.jdbc.driver.OracleDriver");
// Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement ps=con.prepareStatement("select answer from quizques where quizname='"+name+"' and qid='"+count1+"' ");
ResultSet rs=ps.executeQuery();

if(rs.next()){
String ans1=rs.getString(1);


System.out.println("ans1 on c10="+ans1);
System.out.println("ans on get1="+ans);


if(ans1.equals(ans))


{

	total=total+1;
	betTot=betTot+betint;

	System.out.println("=================LOOP1============================");

System.out.println("LOOP1 Total="+total);

System.out.println("LOOP1 bet amount="+betint);
System.out.println("TOTAL bet="+betTot);

System.out.println("=====================LOOP1========================");
}

}

con.close();
}



else{
count1=count-2;
System.out.print("count at get1:"+count);

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement ps=con.prepareStatement("select answer from quizques where quizname='"+name+"' and qid='"+count1+"' ");
ResultSet rs=ps.executeQuery();

if(rs.next()){

	String ans1=rs.getString(1);

	
	System.out.println("ans1="+ans1);

	System.out.println("ans on get1="+ans);
	
	
	if(ans1.equals(ans)){

		total=total+1;
		betTot=betTot+betint;
		System.out.println("=====================LOOP-2========================");
		
		System.out.println("2nd loop-Total="+total);
		
		System.out.println("2nd TOTAL BET="+betTot);
	
		System.out.println("=====================LOOP-2========================");
}

}
con.close();
}
if(count>(Integer)session.getAttribute("max"))
{
	
	
Integer max=(Integer)session.getAttribute("max");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");

PreparedStatement ps=con.prepareStatement("select answer from quizques where quizname='"+name+"' and qid='"+max+"' ");
ResultSet rs=ps.executeQuery();


if(rs.next()){

	String ans1=rs.getString(1);

	System.out.println("ans1 on c1="+ans1);

	String ans2=(String) session.getAttribute("ans");

	System.out.println("ans on get1="+ans2);

	
	if(ans1.equals(ans2)){

		total=total+1;
		betTot=betTot+betint;
		System.out.println("=====================LOOP-3========================");
		
		System.out.println("3rd loop-Total="+total);
		
		System.out.println("3rd TOTAL BET="+betTot);
	
		System.out.println("=====================LOOP-3========================");
		
		

		System.out.println("total="+total);

		System.out.println("NO PRIZE");
}

}

con.close();
request.setAttribute("total",total);
request.setAttribute("betTot",betTot);


total=0;
%>

<jsp:forward page="result.jsp"></jsp:forward>
<% 

 
}

}catch(Exception e){e.printStackTrace();}

}
%>
<jsp:forward page="get.jsp"></jsp:forward>