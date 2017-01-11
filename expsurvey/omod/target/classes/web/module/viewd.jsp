<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
	<title>Survey Module</title>
	<STYLE TYPE="text/css"> 
		h1 {
			color:#009384;
			background-color:white;
			font-family:Arial;
			font-size: 26px;
			text-align: center;
		   }

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
	 		color:#363463;
	 		background-color:white; 
	 		font-family:Arial;  
	 		font-size: 16px;
	 		padding-left: 1cm; 
	 		}
	 		
		TABLE {
    		width: 50%;
    		font-family:Arial;
    		color:#363463
			}

		TH {
    		height: 45px;
    		color: #00463F;
			}
		TD {
    		height: 38px;
    		text-align: center;
			}
		TH, TD {
    		border-bottom: 1px solid #ddd;
			}
	</STYLE>
	
</head>



        <%  
        	String survey_info = (String)request.getAttribute("surveyId");
        	String surveyType  = survey_info.split("\\,")[0];
        	String surveyId    = survey_info.split("\\,")[1];
        	//out.println("Full string: "+survey_info+"<br> SurveyType: "+surveyType+"<br>SUrveyID: "+surveyId+"<br><br>");
        	
        	
			String username = "openmrs";
   			String password = (String)request.getAttribute("password");
   			
   			String dbURL = "jdbc:mysql://127.0.0.1:3316/openmrs";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");          
            connection = DriverManager.getConnection(dbURL, username, password);
            
            Statement statement = connection.createStatement();
            
         
            
if (request.getParameter("view") != null) {    
    // 	THE REQUESTED SURVEY IS A "DIABETES SURVEY"        
    if(surveyType.equals("Diabetes")){
            out.print("<center><h1>Diabetes Survey</h1></center>");            

    
			String command = "select * from survey_diabetes where survey_id="+surveyId;
            ResultSet resultset = statement.executeQuery(command);
            while(resultset.next()){ 
        %>
        <center>
            <TABLE>
                <TR>
                    <TH>SurveyId</TH>
                    <TH>Date and Time Taken</TH>
                </TR>
                <TR>
                    <TD> <%= resultset.getString(1) %> </TD>
                    <TD> <%= resultset.getString(3) %> </TD>
                </TR>
            </TABLE>
            
            </center>

			
			<div>
				<h3>Question 1</h3>
				<div id="qestiontext">Have you started taking any new prescription?</div>
				<p style="margin-left:2em" ><%= resultset.getString(5) %></p><br>
			</div>

			<div>
				<h3>Question 2</h3>
				<div id="qestiontext">How often do you check your blood sugar levels?</div>
				<p style="margin-left:2em"><%= resultset.getString(6) %></p><br>
			</div>

			<div>
				<h3>Question 3</h3>
				<div id="qestiontext">&nbsp;Are you taking your insulin and/or diabetes medication as prescribed?</div>
				<p style="margin-left:2em"><%= resultset.getString(7) %></p><br>
			</div>            
			<div>
				<h3>Question 4 </h3>
				<div id="qestiontext">Which of the following statements best describe how often your glucose or blood sugar levels are within your target range.</div>
				<p style="margin-left:2em"><%= resultset.getString(8) %></p><br>				
			</div>			

			<div>
				<h3>Question 5 </h3>
				<div id="qestiontext">What were your glucose/blood sugar levels over the past two days?</div>
				<p style="margin-left:2em"><%= resultset.getString(9) %></p><br>				
			</div>

			<div>
				<h3>Question 6</h3>
				<div id="qestiontext">Are you satisfied with how well your diabetes and blood sugars are being controlled?</div>
				<p style="margin-left:2em"><%= resultset.getString(10) %></p><br>				
			</div>            
            
  			<div>
				<h3>Question 7 </h3>
				<div id="qestiontext">Have you experienced a change in your weight since your last visit or consultation?
				Please say gain or loss and indicate how many pounds; otherwise, type "none."</div>
				<p style="margin-left:2em"><%= resultset.getString(11) %></p><br>				
			</div>          
            
            
            <div>
				<h3>Question 8 </h3>
				<div id="qestiontext">Have you experienced any of the following issues since your last examination or consultation? Select all that apply.</div>			
				<p style="margin-left:2em"><%= resultset.getString(12) %></p>	
				<p style="margin-left:2em"><%= resultset.getString(13) %></p>
				<p style="margin-left:2em"><%= resultset.getString(14) %></p>
				<p style="margin-left:2em"><%= resultset.getString(15) %></p>
				<p style="margin-left:2em"><%= resultset.getString(16) %></p>
				
				<p style="margin-left:2em"><%= resultset.getString(17) %></p>
				<p style="margin-left:2em"><%= resultset.getString(18) %></p>
				<p style="margin-left:2em"><%= resultset.getString(19) %></p>
				<p style="margin-left:2em"><%= resultset.getString(20) %></p>
				<p style="margin-left:2em"><%= resultset.getString(21) %></p>
				
				<p style="margin-left:2em"><%= resultset.getString(22) %></p>
				<p style="margin-left:2em"><%= resultset.getString(23) %></p>
				<p style="margin-left:2em"><%= resultset.getString(24) %></p>
				<p style="margin-left:2em"><%= resultset.getString(25) %></p>
				<p style="margin-left:2em"><%= resultset.getString(26) %></p><br>
			</div>
            


			<div>
				<h3>Question 9 </h3>
				<div id="qestiontext">Please list the date (mm/dd/yyyy) of your last eye examination. If you have 
					not had an eye examination, please type "never."</div>
				<p style="margin-left:2em"><%= resultset.getString(27) %></p><br>
			</div>

			<div>
				<h3>Question 10 </h3>
				<div id="qestiontext">Please list the date (mm/dd/yyyy) of your last foot examination by a physician
	 			or podiatrist. If you have not had a foot examination, please type 
				"never."</div>
				<p style="margin-left:2em"><%= resultset.getString(28) %></p><br>
			</div>

			<div>
				<h3>Question 11</h3>
				<div id="qestiontext">Please
	 			describe your exercise routine. Include type of exercise, how many 
				times per week you exercise, and how many minutes per session. If you 
				are not exercising, please type "not exercising."</div>
				<p style="margin-left:2em"><%= resultset.getString(29) %></p><br>

			</div>


			<div>
				<h3>Question 12 </h3>
				<div id="qestiontext">Please
 				list the approximate date (mm/dd/yyyy) and reading of your most recent 
				blood pressure test. If you have not had your blood pressure checked 
				since your last visit or consultation, type "none."</p>
				</div>
				<p style="margin-left:2em"><%= resultset.getString(30) %></p><br>
			</div>

			<div>
				<h3>Question 13</h3>
				<div id="qestiontext">Please 
				enter any additional comments that you may have, or describe how I can help you.
				</div>
				<p style="margin-left:2em"><%= resultset.getString(31) %></p>
			</div> 
			<br><br>          
        <% 
            } 
        }
        
        
        

        
        
        
        
      
      
      
      
	// 	THE REQUESTED SURVEY IS A "HEART SURVEY"            
    if(surveyType.equals("Heart")){
			out.print("<center><h1>Heart Survey</h1></center>");            
			String command = "select * from survey_heart where survey_id="+surveyId;
            ResultSet resultset = statement.executeQuery(command);
            while(resultset.next()){ 
        %>
        <center>
            <TABLE>
                <TR>
                    <TH>SurveyId</TH>
                    <TH>Date Taken</TH>
                </TR>
                <TR>
                    <TD> <%= resultset.getString(1) %> </TD>
                    <TD> <%= resultset.getString(3) %> </TD>
                </TR>
            </TABLE>
        </center>

			<div>
			
			<div>
				<h3>Question 1</h3>
				<div id="qestiontext">When was the last time you had your blood pressure checked?</div>
				<p style="margin-left:2em" ><%= resultset.getString(5) %></p><br>
			</div>

			<div>
				<h3>Question 2</h3>
				<div id="qestiontext">The last time you had your blood pressure checked, was it normal or high?</div>
				<p style="margin-left:2em" ><%= resultset.getString(6) %></p><br>	
			</div>

			<div>
				<h3>Question 3</h3>
				<div id="qestiontext">Have you ever been told by a doctor, nurse, or other health professional that you have high blood pressure?</div>
				<p style="margin-left:2em" ><%= resultset.getString(7) %></p><br>
			</div>

<div>
	<h3>Question 4</h3>
	<div id="qestiontext">Are you currently taking medicine for your high blood pressure?</div>
	<p style="margin-left:2em" ><%= resultset.getString(8) %></p><br>
</div>

<div>
	<h3>Question 5</h3>
	<div id="qestiontext">Are you changing your eating habits to help lower or control your blood pressure?</div>
	<p style="margin-left:2em" ><%= resultset.getString(9) %></p><br>
</div>

<div>
	<h3>Question 6</h3>
	<div id="qestiontext">Are you cutting down on salt to help lower or control your blood pressure?</div>
	<p style="margin-left:2em" ><%= resultset.getString(10) %></p><br>

</div>

<div>
	<h3>Question 7</h3>
	<div id="qestiontext">How many days per week do you do moderate physical activities for at least 30 minutes?</div>
	<p style="margin-left:2em" ><%= resultset.getString(11) %></p><br>

</div>

<div>
	<h3>Question 8</h3>
	<div id="qestiontext">In the future, do you intend to reduce the amount of fat you eat so it is lower than it is now?</div>
	<p style="margin-left:2em" ><%= resultset.getString(12) %></p><br>
</div>

<div>
	<h3>Question 9</h3>
	<div id="qestiontext">Do you smoke cigarettes now?</div>
	<p style="margin-left:2em" ><%= resultset.getString(13) %></p><br>
</div> 		
   		

   			<br><br>          
	<% 
        }
}

	} 
else if (request.getParameter("delete") != null) {		
    // 	THE REQUESTED SURVEY IS A "DIABETES SURVEY"        
    if(surveyType.equals("Diabetes")){
            out.print("<center><h1>Diabetes survey with id \'"+surveyId+"\' has been deleted</h1></center>");            

			String command = "delete from survey_diabetes where survey_id="+surveyId;
 			statement.executeUpdate(command);

            } 
        
        
      
	// 	THE REQUESTED SURVEY IS A "HEART SURVEY"            
    if(surveyType.equals("Heart")){
			out.print("<center><h1>Heart survey with id \'"+surveyId+"\' has been deleted</h1></center>");            
			String command = "delete from survey_heart where survey_id="+surveyId;
            statement.executeUpdate(command);

        }
}
%>
<center>
<input style="width:240px; height:40px; font-size:12px; font-weight: bold;" type="submit" value="Go Back" 
    onclick="parent.location='http://localhost:8081/openmrs-standalone/expsurvey/surveymain.page?patientId=${thePatient.patientId}';" />
</center>
<br><br>


