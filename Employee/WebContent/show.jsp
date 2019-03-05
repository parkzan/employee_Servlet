<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.sun.jdi.Location"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">

</script>
<body>
		<%
		   ResultSet rec =  (ResultSet)request.getAttribute("Show_Data"); 
			out.print("<table class='table text-center table-striped'>");
			out.print("<tr class='table-info'>");
			out.print("<th>ID");
			out.print("</th>");
			out.print("<th>Name");
			out.print("</th>");
			out.print("<th>E-mail");
			out.print("</th>");
			out.print("<th>Type");
			out.print("</th>");
			out.print("<th>Team");
			out.print("</th>");
			out.print("</th>");
			out.print("<th>Edit");
			out.print("</th>");
			out.print("</th>");
			out.print("<th>Delete");
			out.print("</th>");
			out.print("</tr>");
			try{
				while(rec.next()){
					int id = Integer.parseInt(rec.getString("ID"));
					out.print("<tr>");
					out.print("<td>");
					out.print(rec.getString("ID"));
					out.print("</td>");
					out.print("<td>");
					out.print(rec.getString("Name"));
					out.print("</td>");
					out.print("<td>");
					out.print(rec.getString("Email"));
					out.print("</td>");
					out.print("<td>");
					out.print(rec.getString("Type"));
					out.print("</td>");
					out.print("<td>");
					out.print(rec.getString("idTeam"));
					out.print("</td>");
					out.print("<td>");
					out.print("<a href='edit.jsp?id="+id+"'><img src='https://img.icons8.com/color/48/000000/edit-file.png'></a>");
					out.print("</td>");
					out.print("<td>");
					out.print("<a href='delete.jsp?id_delete="+id+"'><img src='https://img.icons8.com/color/48/000000/delete-forever.png'></a>");
					out.print("</td>");
					out.print("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			out.print("</table>");
			
			
		
		%>
</body>
</html>