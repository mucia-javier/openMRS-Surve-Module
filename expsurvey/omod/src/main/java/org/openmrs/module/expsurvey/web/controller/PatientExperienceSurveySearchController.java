/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.expsurvey.web.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import org.openmrs.Patient;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.context.Context;
import org.openmrs.messagesource.MessageSourceService;
import org.openmrs.web.WebConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;




/**
 * The main controller.
 */
@Controller
public class  PatientExperienceSurveySearchController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@RequestMapping(value = "/module/expsurvey/search", method = RequestMethod.GET)
	public void manage(ModelMap model, @RequestParam("patientId") Patient patient, 
					  @RequestParam(value = "returnUrl", required = false) String returnUrl) {
				
		//######## Fetch the DB-Connection information, to be used on the *.jsp page #####
		String username = Context.getRuntimeProperties().getProperty("connection.username");
		String password = Context.getRuntimeProperties().getProperty("connection.password");
		String patientID = String.valueOf(patient.getPatientId());

		
		//#######  Make the follwing variables available in the *.jsp page ###########
		model.addAttribute("user", Context.getAuthenticatedUser());
		model.addAttribute("thePatient", patient);
		model.addAttribute("username", username);
		model.addAttribute("password", password);
		model.addAttribute("pId", patientID);
		if(returnUrl != null)
			model.addAttribute("returnUrl", returnUrl);

		
		
	}
	
}
