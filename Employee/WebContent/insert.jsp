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
		if(session.getAttribute("status_insert") != null){
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			out.print("<div class='alert alert-primary' role='alert'>Insert Succes</div>");
			session.removeAttribute("status_insert");
		}
		%>
		<div class="form-group mx-md-3">
		<h1>Insert User</h1>
			<form action="./Controller" method="post">	
					<input type="input" class="form-control" name="Name_insert" placeholder="Name" style="width:300px;" required><br>
					<input type="input" class="form-control" name="Email_insert" placeholder="E-mail" style="width:300px;" required><br>
					<div class="input-group mb-3" style="width:300px;" >
						  <select class="custom-select" name="Type_insert" required>
						    <option value="">TypeEmployee</option>
						    <option value="1">1 (พนักงาน)</option>
						    <option value="2">2 (หัวหน้า)</option>
						    <option value="3">3 (ผู้บริหาร)</option>
						  </select>
					</div>
					<div class="input-group mb-3" style="width:300px;"  >
						  <select class="custom-select" name="Team_insert" required>
						    <option value="">Team</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						  </select>
					</div>
					<input type="submit" name="insert" class="btn btn-success" value="Insert">
					<a href='index.jsp'class='btn btn-success'> Back to Search</a>
			</form>
		</div>
</body>
</html>