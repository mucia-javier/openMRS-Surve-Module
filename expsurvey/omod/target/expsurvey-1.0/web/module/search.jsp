<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
	<title>Survey Module</title>
	<style>
		TABLE {
    		width: 70%;
    		border-spacing: 0px
			}

		TH {
    		height: 45px;
    		color: #009384;
			}
		TD {
    		height: 38px;
    		text-align: center;
			}
		TH, TD {
    		border-bottom: 1px solid #ddd;
			}
		TR:hover {background-color: #f5f5f5}
	</style>
</head>

<div style="font-size: 11.000000pt; font-family: OpenSans, Arial, sans-serif; color: #363463;" >

<center>
	<!-- <h1 style="font-size: 16pt; font-family: OpenSans, Arial, sans-serif; color: #363463;" >Availables Surveys for this patient</h1> -->

        <%  
        	boolean isThereAnySurvey = false;
			String username = "openmrs";
   			String password = (String)request.getAttribute("password");
   			String patientId= (String)request.getAttribute("pId"); 
   			String dbURL = "jdbc:mysql://127.0.0.1:3316/openmrs";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");          
            connection = DriverManager.getConnection(dbURL, username, password);
            Statement statement = connection.createStatement();            
            String SurveyTypeAndId = "";
        %>
    <!--   THIS IS THE MAIN FORM THAT WILL BE CREATING ONE RADIO BUTTON PER AVAILABLE SURVEY -->
            <TABLE>
                <TR>
                	<TH width="1" ></TH>
                    <TH width="1">SurveyId</TH>
                    <TH>Type	</TH>
                    <TH >Date and Time Taken</TH>
                </TR>       
<form action="http://localhost:8081/openmrs-standalone/module/expsurvey/viewd.form?patientId=${thePatient.patientId}" target="_self">
        <!-- SHOW "HEART" SURVEYS -->
        <%
        	String command = "select * from survey_heart where patient_id="+patientId;
            ResultSet resultset = statement.executeQuery(command);
            while(resultset.next()){ 
            	isThereAnySurvey = true;
            	SurveyTypeAndId = resultset.getString(4)+","+resultset.getString(1);
        %>
                <TR>
                	<TD><input type="radio" name="surveyId" checked="checked"  value="<%=SurveyTypeAndId%>" /></TD>
                    <TD> <%= resultset.getString(1) %> </TD>
                    <TD> <%= resultset.getString(4) %> </TD>
                    <TD> <%= resultset.getString(3) %> </TD>
                </TR>          
        <!-- SHOW "DIABETES" SURVEYS -->
        <% 
            }        
			command = "select * from survey_diabetes where patient_id="+patientId;
            resultset = statement.executeQuery(command);
			while(resultset.next()){ 
				isThereAnySurvey = true;
				SurveyTypeAndId = resultset.getString(4)+","+resultset.getString(1);
        	%>
                <TR>
                	<TD><input type="radio" name="surveyId" checked="checked"  value="<%=SurveyTypeAndId%>" /></TD>
                    <TD> <%= resultset.getString(1) %> </TD>
                    <TD> <%= resultset.getString(4) %> </TD>
                    <TD> <%= resultset.getString(3) %> </TD>
                </TR>
        <% 
            } 
        %>
    </TABLE>
    </center>
	<input type="hidden" name="patientId" value=${thePatient.patientId}>

  	<%if(isThereAnySurvey == true) { %>
  	<br><br>
		<center>
  			<input style="width:170px; height:40px; font-size:14px; font-weight: bold;" name="view" value="See Selected Survey" type="submit" >
  			
  			<input style="width:200px; height:40px; font-size:14px; font-weight: bold;" name="delete" type="submit" value="Delete Selected Survey" />
		</center>
		<%
		}
		else{
		 out.println("<br><center>There are no available surveys for this patient at this time. Try taking a new survey instead. </center><br>");
		}
		%>
</div>
</form> 