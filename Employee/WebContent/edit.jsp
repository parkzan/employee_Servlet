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
		int idEm = Integer.parseInt(request.getParameter("id"));
		session.setAttribute("id_edit", idEm);
		ResultSet result_Id_em = ConnectDB.SearchByID(idEm);
		while(result_Id_em.next()){
			request.setAttribute("name_edit", result_Id_em.getString("Name"));
			request.setAttribute("email_edit", result_Id_em.getString("Email"));
			request.setAttribute("type_edit", result_Id_em.getString("Type"));
			request.setAttribute("team_edit", result_Id_em.getString("idTeam"));
		}
		%>
		<div class="form-gruop mx-md-3" style="width:500px;">
			<h1>Edit Employee</h1>
			<form action="./Controller" method="post">
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">Name</span>
			 </div>
				<input type="input" name="name_edit" class="form-control" placeholder="Name" value="<%=request.getAttribute("name_edit")%>">
			</div>
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">E-mail</span>
			 </div>
				<input type="input" name="email_edit" class="form-control" placeholder="Email" value="<%=request.getAttribute("email_edit")%>">
			</div>
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">Type</span>
			 </div>
				<select class="custom-select" name="type_edit" required>
					<option value="<%=request.getAttribute("type_edit")%>"><%=request.getAttribute("type_edit")%></option>
					<option value="1">1 (พนักงาน)</option>
					<option value="2">2 (หัวหน้า)</option>
					<option value="3">3 (ผู้บริหาร)</option>
				</select>
			</div>
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">Team</span>
			 </div>
				<select class="custom-select" name="team_edit" required>
					<option value="<%=request.getAttribute("team_edit")%>"><%=request.getAttribute("team_edit")%></option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
			</div>
			<input type="submit" class="btn btn-info" value="Update">
			</form>
		</div>
		
</body>
</html>