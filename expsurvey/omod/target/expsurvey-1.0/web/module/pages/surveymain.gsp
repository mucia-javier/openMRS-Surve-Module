<%
    ui.decorateWith("appui", "standardEmrPage")
%>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "Experience Survey", link: "${ ui.pageLink("coreapps", "findpatient/findPatient", [app: "expsurvey"]) }" },
        { label: "${ ui.format(patient.familyName) }, ${ ui.format(patient.givenName) }" , link: '${ui.pageLink("coreapps", "patientdashboard/patientDashboard", [patientId: patient.patientId])}'},
    ];
    
    
    if ('${returnUrl}') {
    	breadcrumbs = [
	        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
	        { label: "${ ui.format(patient.familyName) }, ${ ui.format(patient.givenName) }" , link: '${ui.escapeJs(returnUrl)}'},
	        { label: "Experience Survey", link: "${ ui.pageLink("coreapps", "findpatient/findPatient", [app: "expsurvey"]) }" }
    	];
    }
    
    jq(function(){
		jq(".tabs").tabs();
	});
</script>

${ ui.includeFragment("coreapps", "patientHeader", [ patient: patient ]) }


<h2>Welcome to the Experience Survey Module</h2>
<p>The patient experience survey module allows the medical practitioner to keep track of the patient’s experience of the treatment of their long-term medical condition. 
The medical practitioner would be up to date in between visits on the patient’s recovery through a short survey that is taken through a phone call from the hospital.</p>
<br> 




<div id="links">
	<a  class="pastSurveys" href="#">See Past Surveys</a> &nbsp; &nbsp; &nbsp; &nbsp;
	<a  class="newSurvey" href="#">New Survey</a> &nbsp; &nbsp; &nbsp; &nbsp;
	<a  class="renderSurvey" href="#">Diabetes Survey</a> &nbsp; &nbsp; &nbsp; &nbsp;
	<a  class="renderHeartSurvey"  href="#">Heart Survey</a>
</div>





<div id="past" style="display:none;">
	<div>
  	 	 <iframe src="http://localhost:8081/openmrs-standalone/module/expsurvey/search.form?patientId=${patient.patientId}" id="newSurveyIframe" width="976px" height="450px" frameborder="0">
		 </iframe> 
	</div>
</div>

<div id="newSurvey" style="display:none;">
	${ ui.includeFragment("expsurvey", "newSurvey",  [ patientId: patient.patientId ]) }
</div>

<div id="attid" style="display:none;">
	
	<div>
  	 	 <iframe src="http://localhost:8081/openmrs-standalone/module/expsurvey/diabetes.form?patientId=${patient.patientId}" id="newSurveyIframe" width="976px" height="450px" frameborder="0">
		 </iframe> 
	</div>
	<!--
	${ ui.includeFragment("expsurvey", "diabetesSurvey",  [ patientId: patient.patientId ]) }
	-->
</div>

<div id="heart" style="display:none;">
	
	<div>
  	 	 <iframe src="http://localhost:8081/openmrs-standalone/module/expsurvey/heart.form?patientId=${patient.patientId}" id="newSurveyIframe" width="976px" height="450px" frameborder="0">
		 </iframe> 
	</div>
	 
	<!--
	${ ui.includeFragment("expsurvey", "heartSurvey",  [ patientId: patient.patientId ]) }  
	-->
</div>

<% ui.includeCss("expsurvey", "surveymain.css") %>

<script type="text/javascript">
var e = document.getElementsByTagName("a"); 
for(var i=0; i<e.length; i++){
	if(e[i].className == 'renderHeartSurvey') {	 
		e[i].onclick = function(){ 
			document.getElementById("attid").style.display = 'none';
			document.getElementById("heart").style.display = 'block';
			document.getElementById("newSurvey").style.display = 'none';
			document.getElementById("past").style.display = 'none';
		}
	}
	else if(e[i].className == 'newSurvey') {	 
		e[i].onclick = function(){ 
			document.getElementById("attid").style.display = 'none';
			document.getElementById("heart").style.display = 'none';
			document.getElementById("newSurvey").style.display = 'block';
			document.getElementById("past").style.display = 'none';
		}
	}
	else if (e[i].className == 'renderSurvey') {	 
		e[i].onclick = function(){ 
			document.getElementById("heart").style.display = 'none';
			document.getElementById("attid").style.display = 'block';
			document.getElementById("newSurvey").style.display = 'none';
			document.getElementById("past").style.display = 'none';
		}	
	}
	else if (e[i].className == 'pastSurveys') {	 
		e[i].onclick = function(){ 
			document.getElementById("heart").style.display = 'none';
			document.getElementById("attid").style.display = 'none';
			document.getElementById("newSurvey").style.display = 'none';
			document.getElementById("past").style.display = 'block';
		}	
	}
}
</script>