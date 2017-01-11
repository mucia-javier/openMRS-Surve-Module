/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.expsurvey.page.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
//import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;

import org.openmrs.api.context.Context;

import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class SurveymainPageController{
	
	public void controller(@RequestParam("patientId") Patient patient, UiUtils ui,
	                       @RequestParam(value = "returnUrl", required = false) String returnUrl,
	                       PageModel model) {		
		model.addAttribute("returnUrl", returnUrl);
		model.addAttribute("patient", patient);
		
		List<Patient> patients = Context.getPatientService().getAllPatients();
		int SizeOfCollection = patients.size();
		model.addAttribute("SizeOfC", SizeOfCollection);
		model.addAttribute("thePatientList", patients);
	}
}
