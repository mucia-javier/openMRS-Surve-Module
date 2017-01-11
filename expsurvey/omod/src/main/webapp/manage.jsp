<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
	<title>Survey Module</title>
	<style TYPE="text/css"> 
		body {
			color:#009384;
			background-color:white;
			font-family:Arial;
			font-size: 18px;
			padding-left: 1cm; 
		   }
		</style>
</head>

<center>
<h1>Survey Successfully Saved!</h1>



        <%
        String pid = request.getParameter("patientId");
        String stype = request.getParameter("surveyName");
        

        
        String a1 = request.getParameter("answer1");
        String a2 = request.getParameter("answer2");
        String a3 = request.getParameter("answer3");
        String a4 = request.getParameter("answer4");
        String a5 = request.getParameter("answer5");
        String a6 = request.getParameter("answer6");
        String a7 = request.getParameter("answer7");
        String a8 = request.getParameter("answer8");
        String a9 = request.getParameter("answer9");
        
        
        %>

        <%  
        
			String username = "openmrs";
   			String password = (String)request.getAttribute("password");
   			String dbURL = "jdbc:mysql://127.0.0.1:3316/openmrs";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");          
            connection = DriverManager.getConnection(dbURL, username, password);
            Statement statement = connection.createStatement();

            String command = "INSERT INTO survey_heart (patient_id, date, survey_name, ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9) VALUES ('"+pid+"', NOW(), '"+stype+"', '"+a1+"', '"+a2+"', '"+a3+"', '"+a4+"', '"+a5+"', '"+a6+"', '"+a7+"', '"+a8+"', '"+a9+"')";
            statement.executeUpdate(command);

        %>


<input style="width:70px; height:40px; font-size:14px; font-weight: bold;" type="submit" value="OK" 
    onclick="parent.location='http://localhost:8081/openmrs-standalone/expsurvey/surveymain.page?patientId=${thePatient.patientId}';" />
</center>





