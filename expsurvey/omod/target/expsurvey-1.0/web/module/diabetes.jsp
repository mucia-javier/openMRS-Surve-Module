<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
	<title>Diabetes Survey</title>	
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

<form action="http://localhost:8081/openmrs-standalone/module/expsurvey/updaterd.form?patientId=${thePatient.patientId}"  target="_self">
<input type="hidden" name="patientId" value=${thePatient.patientId}>
<input type="hidden" name="surveyName" value="Diabetes">


<div>
	<h3>Question 1</h3>
	<div id="qestiontext">Have you started taking any new prescription?</div>
	<p><input name="answer1" value="Yes" type="radio"> Yes</p>
	<p><input name="answer1" value="None" type="radio"> None</p>
	<br>
</div>

<div>
	<h3>Question 2</h3>
	<div id="qestiontext">How often do you check your blood sugar levels?</div>
	<p><input name="answer2" value="Once daily" type="radio"> Once daily</p>
	<p><input name="answer2" value="Twice daily" type="radio"> Twice daily</p>
	<p><input name="answer2" value="3-4 times per day" type="radio"> 3-4 times per day</p>
	<p><input name="answer2" value="Before each meal or snack" type="radio"> Before each meal or snack</p>
	<p><input name="answer2" value="2-5 times per week" type="radio"> 2-5 times per week</p>
	<p><input name="answer2" value="Less than twice per wee" type="radio"> Less than twice per week</p>
	<br>
</div>

<div>
	<h3>Question 3</h3>
	<div id="qestiontext">Are you taking your insulin and/or diabetes medication as prescribed?</div>
	<p><input name="answer3" value="Yes" type="radio"> Yes</p>
	<p><input name="answer3" value="Some of the time" type="radio"> Some of the time</p>
	<p><input name="answer3" value="No" type="radio"> No</p>
	<br>
</div>

<div>
	<h3>Question 4 </h3>
	<div id="qestiontext">Which of the following statements best describe how often your glucose or blood sugar levels are within your target range.</div>
	<p><input name="answer4" value="My glucose or blood sugar levels are within my target range more than 80% of the time" type="radio"> My glucose or blood sugar levels are within my target range more than 80% of the time</p>
	<p><input name="answer4" value="My glucose or blood sugar levels are within my target range about half of the time" type="radio"> My glucose or blood sugar levels are within my target range about half of the time</p>
	<p><input name="answer4" value="My glucose or blood sugar levels are within my target range less than 20% of the time" type="radio"> My glucose or blood sugar levels are within my target range less than 20% of the time</p>
	<br>
</div>

<div>
	<h3>Question 5 </h3>
	<div id="qestiontext">What were your glucose/blood sugar levels over the past two days?</div>
	<p><textarea name="answer5" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<div>
	<h3>Question 6</h3>
	<div id="qestiontext">Are you satisfied with how well your diabetes and blood sugars are being controlled?</div>
	<p><input name="answer6" value="Yes" type="radio">Yes</p>
	<p><input name="answer6" value="No" type="radio">No</p>
	<p><input name="answer6" value="Some of the time" type="radio">Some of the time</p>
	<br>
</div>

<div>
	<h3>Question 7 </h3>
	<div id="qestiontext">Have you experienced a change in your weight since your last visit or consultation?
	<br>Please say gain or loss and indicate how many pounds; otherwise, type "none."</div>
	<p><textarea name="answer7" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<div>
	<h3>Question 8 </h3>
	<div id="qestiontext">Have you experienced any of the following issues since your last examination or consultation? Select all that apply.</div>
	<p><input name="answer8" value="Chest pain" type="checkbox"> Chest pain</p>
	<p><input name="answer8" value="Dizziness" type="checkbox"> Dizziness</p>
	<p><input name="answer8" value="Headacke" type="checkbox"> Headacke</p>
	<p><input name="answer8" value="Numbness and/or tingling in feet and/or legs" type="checkbox"> Numbness and/or tingling in feet and/or legs</p>
	<p><input name="answer8" value="Sores/wounds on feet" type="checkbox"> Sores/wounds on feet</p>
	<p><input name="answer8" value="Pain and/or discomfort in feet and/or legs" type="checkbox"> Pain and/or discomfort in feet and/or legs</p>
	<p><input name="answer8" value="Vision changes" type="checkbox"> Vision changes</p>
	<p><input name="answer8" value="Fatigue and/or tiredness" type="checkbox"> Fatigue and/or tiredness</p>
	<p><input name="answer8" value="Stress and irritability" type="checkbox"> Stress and irritability</p>
	<p><input name="answer8" value="Excessive thirst" type="checkbox"> Excessive thirst</p>
	<p><input name="answer8" value="Excessive urination" type="checkbox"> Excessive urination</p>
	<p><input name="answer8" value="Blood sugar levels over 300" type="checkbox"> Blood sugar levels over 300</p>
	<p><input name="answer8" value="Blood sugar levels below 70" type="checkbox"> Blood sugar levels below 70</p>
	<p><input name="answer8" value="Episodes of sweating, anxiety, and palpitations that get better after eating or drinking" type="checkbox">  Episodes of sweating, anxiety, and palpitations that get better after eating or drinking</p>
	<p><input name="answer8" value="None" type="checkbox"> None</p>
	<br>
</div>

<div>
	<h3>Question 9 </h3>
	<div id="qestiontext">Please list the date (mm/dd/yyyy) of your last eye examination. If you have 
	not had an eye examination, please type "never."</div>
	<p><textarea name="answer9" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<div>
	<h3>Question 10 </h3>
	<div id="qestiontext">Please list the date (mm/dd/yyyy) of your last foot examination by a physician
	 or podiatrist. If you have not had a foot examination, please type 
	"never."</div>
	<p><textarea name="answer10" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<div>
	<h3>Question 11</h3>
	<div id="qestiontext">Please
	 describe your exercise routine. Include type of exercise, how many 
	times per week you exercise, and how many minutes per session. If you 
	are not exercising, please type "not exercising."</div>
	<p><textarea name="answer11" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>


<div>
	<h3>Question 12 </h3>
	<div id="qestiontext">Please list the approximate date (mm/dd/yyyy) and reading of your most recent 
						 blood pressure test. If you have not had your blood pressure checked 
						 since your last visit or consultation, type "none."</div>
	<p><textarea name="answer12" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>


<div>
	<h3>Question 13</h3>
	<div id="qestiontext"> Please enter any additional comments that you may have, or describe how I can help you.</div>
	<p><textarea name="answer13" value="" rows="4" style="width:80%"></textarea></p>
	<br>
</div>

<br>
<div>
	<center>
		<input style="width:170px; height:40px; font-size:14px; font-weight: bold;" type="submit" value="Save Survey" />
	</center>
</div>
	
</form>

 
</body>
</html>




