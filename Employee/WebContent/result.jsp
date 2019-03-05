<%@page import="Controller.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
</head>
<body>
	<%
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
			try{
				ResultSet rec = (ResultSet)request.getAttribute("result_staff");
				out.println("<h1>รายละเอียด พนักงงาน</h1>");
				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>");
				out.println("Name");
				out.println("</th>");
				out.println("<th>");
				out.println("E-mail");
				out.println("</th>");
				out.println("<th>");
				out.println("Status");
				out.println("</th>");
				out.println("<th>");
				out.println("Team");
				out.println("</th>");
				out.println("</tr>");
				while(rec.next()){
					out.print("<tr>");
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
					out.print("</tr>");
				}
				out.print("</table>");
			}catch(Exception e){
				e.printStackTrace();
			}
			try {
				String name_search = (String)request.getAttribute("input_search");
				ResultSet rec = ConnectDB.getStaff(name_search);
				out.println("<h1>เพื่อนร่วมทีม</h1>");
				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>");
				out.println("Name");
				out.println("</th>");
				out.println("<th>");
				out.println("E-mail");
				out.println("</th>");
				out.println("<th>");
				out.println("Status");
				out.println("</th>");
				out.println("<th>");
				out.println("Team");
				out.println("</th>");
				out.println("</tr>");
				while(rec.next()){
					if(rec.getString("Type").equals("1")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("1") && not_input == false){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
					if(rec.getString("Type").equals("2")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("2") && not_input == false){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
					if(rec.getString("Type").equals("3")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("3") && not_input == false){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
					
				}		
				out.println("</table>");
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				String name_search = (String)request.getAttribute("input_search");
				ResultSet rec = ConnectDB.getStaff(name_search);
				out.println("<h1>หัวหน้า</h1>");
				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>");
				out.println("Name");
				out.println("</th>");
				out.println("<th>");
				out.println("E-mail");
				out.println("</th>");
				out.println("<th>");
				out.println("Status");
				out.println("</th>");
				out.println("<th>");
				out.println("Team");
				out.println("</th>");
				out.println("</tr>");
				while(rec.next()){
					if(rec.getString("Type").equals("1")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("2")){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
					if(rec.getString("Type").equals("2")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("3")){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
				
					
				}		
				out.println("</table>");
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String name_search = (String)request.getAttribute("input_search");
				ResultSet rec = ConnectDB.getStaff(name_search);
				out.println("<h1>ลูกน้อง</h1>");
				out.println("<table border='1'>");
				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>");
				out.println("Name");
				out.println("</th>");
				out.println("<th>");
				out.println("E-mail");
				out.println("</th>");
				out.println("<th>");
				out.println("Status");
				out.println("</th>");
				out.println("<th>");
				out.println("Team");
				out.println("</th>");
				out.println("</tr>");
				while(rec.next()){
					if(rec.getString("Type").equals("2")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("1")){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
					if(rec.getString("Type").equals("3")){
						String idteam = rec.getString("idTeam");
						ResultSet result_team = ConnectDB.getManager(idteam);
						while(result_team.next()){
							ResultSet result_type = ConnectDB.getType(result_team.getString("IdEmployee"));
							while(result_type.next()){
								boolean not_input = result_type.getString("ID").equals(rec.getString("ID"));
								if(result_type.getString("Type").equals("2")){
									out.print("<tr>");
									out.print("<td>");
									out.print(result_type.getString("Name"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Email"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("Type"));
									out.print("</td>");
									out.print("<td>");
									out.print(result_type.getString("idTeam"));
									out.print("</td>");
									out.print("</tr>");
								}
								
							}
						}
					}
				
					
				}		
				out.println("</table>");
			} catch (Exception e) {
				// TODO: handle exception
			}
		%>
</body>
</html>