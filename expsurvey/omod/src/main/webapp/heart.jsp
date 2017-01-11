<%@ include file="/WEB-INF/template/include.jsp"%>
<!--%@ include file="/WEB-INF/template/header.jsp"% -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
	<title>Heart Survey</title>	
	<STYLE TYPE="text/css"> 
		h3 {
			color:#009384;
			background-color:white;
			font-family:Arial;
			font-size: 18px;
			padding-left: 1cm; 
		   }
	 	p{
	 		color:#000000;
	 		background-color:white; 
	 		font-family:Arial;
			font-size: 14px;
			padding-left: 2cm; 
	 		} 
	 	#qestiontext { 
	 		color:#363463;;
	 		background-color:white; 
	 		font-family:Arial;  
	 		font-size: 16px;
	 		padding-left: 1cm; 
	 		}
	 		
	</STYLE>
	
</head>

<body>


<!--  GET THE DB-CONNECTIO READY -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://127.0.0.1:3316/openmrs"  
     user="${username}"  password="${password}"/>
 
 
 
 
 



<form action="http://localhost:8081/openmrs-standalone/module/expsurvey/manage.form?patientId=${thePatient.patientId}"  target="_self">
<input type="hidden" name="patientId" value=${thePatient.patientId}>
<input type="hidden" name="surveyName" value="Heart">


<div>
<h3>Question 1</h3>
<div id="qestiontext"> When was the last time you had your blood pressure checked?</div>
<p><input name="answer1" value="Within the past year (anytime less than 12 months ago)" type="radio"   > Within the past year (anytime less than 12 months ago</p>
<p><input name="answer1" value="Within the past 2 years (more than 1 year ago but less than 2 years ago)" type="radio"   > Within the past 2 years (more than 1 year ago but less than 2 years ago) </p>
<p><input name="answer1" value="Within the past 5 years (more than 2 years ago but less than 5 years ago)" type="radio"   > Within the past 5 years (more than 2 years ago but less than 5 years ago) </p>
<p><input name="answer1" value="Five or more years ago" type="radio"   > Five or more years ago </p>
<p><input name="answer1" value="Do not Know" type="radio"   > Do not Know</p>
<p><input name="answer1" value=" Never had it checked" type="radio"   > Never had it checked </p>
	<br>
</div>

<div>
	<h3>Question 2</h3>
	<div id="qestiontext">The last time you had your blood pressure checked, was it normal or high?</div>
	<p><input name="answer2" value="Normal" type="radio" > Normal </input></p>
	<p><input name="answer2" value="High" type="radio"  > High </input></p>
	<p><input name="answer2" value="Do not Know/Not Sure" type="radio"   > Do not Know/Not Sure</input></p>
	<br>
</div>

<div>
	<h3>Question 3</h3>
	<div id="qestiontext">Have you ever been told by a doctor, nurse, or other health professional that you have high blood pressure?</div>
	<p><input name="answer3" value="Yes" type="radio"   > Yes</input></p>
	<p><input name="answer3" value="No" type="radio"   > No</input></p>
	<p><input name="answer3" value="Do not Know/Not Sure" type="radio"   > Do not Know/Not Sure</input></p>
	<br>
</div>

<div>
	<h3>Question 4</h3>
	<div id="qestiontext">Are you currently taking medicine for your high blood pressure?</div>
	<p><input name="answer4" value="Yes" type="radio"   > Yes</input></p>
	<p><input name="answer4" value="No" type="radio"   > No</input></p>
	<p><input name="answer4" value="Do not Know/Not Sure" type="radio"   > Do not Know/Not Sure </input></p>
	<br>
</div>

<div>
	<h3>Question 5</h3>
	<div id="qestiontext">Are you changing your eating habits to help lower or control your blood pressure?</div>
	<p><input name="answer5" value="Yes" type="radio"   > Yes</input></p>
	<p><input name="answer5" value="No" type="radio"   > No</input></p>
	<p><input name="answer5" value="Do not know / Not sure" type="radio"   > Do not know / Not sure</input></p>
	<br>
</div>

<div>
	<h3>Question 6</h3>
	<div id="qestiontext">Are you cutting down on salt to help lower or control your blood pressure?</div>
	<p><input name="answer6" value="Yes" type="radio"   > Yes</input></p>
	<p><input name="answer6" value="No" type="radio"   > No</input></p>
	<p><input name="answer6" value="Do Not Use Salt" type="radio"   > Do Not Use Salt</input></p>
	<p><input name="answer6" value="Do not Know/Not Sure" type="radio"   > Do not Know/Not Sure</input></p>
	<br>
</div>

<div>
	<h3>Question 7</h3>
	<div id="qestiontext">How many days per week do you do moderate physical activities for at least 30 minutes?</div>
	<p><textarea name="answer7" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<div>
	<h3>Question 8</h3>
	<div id="qestiontext">In the future, do you intend to reduce the amount of fat you eat so it is lower than it is now?</div>
	<p><input name="answer8" value="Yes, and I intend to in the next 30 days" type="radio"   > Yes, and I intend to in the next 30 days </input></p>
	<p><input name="answer8" value="Yes, and I intend to in the next 6 months" type="radio"   > Yes, and I intend to in the next 6 months </input></p>
	<p><input name="answer8" value="No, and I do not intend to in the next 6 months" type="radio"   > No, and I do not intend to in the next 6 months</input></p>
	<br>
</div>

<div>
	<h3>Question 9</h3>
	<div id="qestiontext">Do you smoke cigarettes now?</div>
	<p><input name="answer9" value="Yes" type="radio"   > Yes</input></p>
	<p><input name="answer9" value="No" type="radio"   > No</input></p>
	<p><input name="answer9" value="Sometimes" type="radio"   > Sometimes</input></p>
	<br>
</div>

<div>
	<center>
		<input style="width:170px; height:40px; font-size:14px; font-weight: bold;" type="submit" value="Save Survey" />
	</center>
</div>
	
</form>

 
</body>
</html>







