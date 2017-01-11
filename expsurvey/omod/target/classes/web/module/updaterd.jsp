
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
	<%! String[] ans8; %>
	<% ans8 = request.getParameterValues("answer8");

        String pid = request.getParameter("patientId");
        String stype = request.getParameter("surveyName");

        
        String a1 = request.getParameter("answer1");
        String a2 = request.getParameter("answer2");
        String a3 = request.getParameter("answer3");
        String a4 = request.getParameter("answer4");
        String a5 = request.getParameter("answer5");
        String a6 = request.getParameter("answer6");
        String a7 = request.getParameter("answer7");
        
        String a81 = "";
        String a82 = ""; 
        String a83 = "";
        String a84 = "";
        String a85 = "";
        String a86 = "";
        String a87 = "";
        String a88 = "";
        String a89 = "";
        String a810 = "";
        String a811 = "";
        String a812 = "";
        String a813 = "";
        String a814 = "";
        String a815 = "";
        if (ans8 != null) {
        if(0 < ans8.length) a81 = ans8[0];
        if(1 < ans8.length) a82 = ans8[1];
        if(2 < ans8.length) a83 = ans8[2];
        if(3 < ans8.length) a84 = ans8[3];
        if(4 < ans8.length) a85 = ans8[4];
        if(5 < ans8.length) a86 = ans8[5];
        if(6 < ans8.length) a87 = ans8[6];
        if(7 < ans8.length) a88 = ans8[7];
        if(8 < ans8.length) a89 = ans8[8];
        if(9 < ans8.length) a810 = ans8[9];
        if(10 < ans8.length) a811 = ans8[10];
        if(11 < ans8.length) a812 = ans8[11];
        if(12 < ans8.length) a813 = ans8[12];
        if(13 < ans8.length) a814 = ans8[13];
        if(14 < ans8.length) a815 = ans8[14];
        }      
              
        String a9 =  request.getParameter("answer9");
        String a10 = request.getParameter("answer10");
        String a11 = request.getParameter("answer11");
        String a12 = request.getParameter("answer12");
        String a13 = request.getParameter("answer13");
        %>

        <%  
        
			String username = "openmrs";
   			String password = (String)request.getAttribute("password");
   			
   			String dbURL = "jdbc:mysql://127.0.0.1:3316/openmrs";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");          
            connection = DriverManager.getConnection(dbURL, username, password);
            Statement statement = connection.createStatement();
			String command = "INSERT INTO survey_diabetes (patient_id, date, survey_name, ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans81, ans82, ans83, ans84, ans85, ans86, ans87, ans88, ans89, ans810, ans811, ans812, ans813, ans814, ans815, ans9, ans10, ans11, ans12, ans13) Values ("+pid+", NOW(), '"+stype+"', '"+a1+"', '"+a2+"', '"+a3+"', '"+a4+"', '"+a5+"', '"+a6+"', '"+a7+"', '"+a81+"', '"+a82+"', '"+a83+"', '"+a84+"', '"+a85+"', '"+a86+"', '"+a87+"', '"+a88+"', '"+a89+"', '"+a810+"', '"+a811+"', '"+a812+"', '"+a813+"', '"+a814+"', '"+a815+"', '"+a9+"', '"+a10+"', '"+a11+"', '"+a12+"', '"+a13+"')";
            statement.executeUpdate(command);

        %>


<input style="width:70px; height:40px; font-size:14px; font-weight: bold;" type="submit" value="OK" 
    onclick="parent.location='http://localhost:8081/openmrs-standalone/expsurvey/surveymain.page?patientId=${thePatient.patientId}';" />
</center>



