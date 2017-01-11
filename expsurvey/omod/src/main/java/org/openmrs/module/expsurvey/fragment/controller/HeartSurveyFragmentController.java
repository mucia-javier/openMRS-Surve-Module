package org.openmrs.module.expsurvey.fragment.controller;

import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class HeartSurveyFragmentController {

	protected final Log log = LogFactory.getLog(getClass());

	public void controller(@RequestParam("patientId") Patient patient, UiUtils ui,
			FragmentModel model) {		
		model.addAttribute("patient", patient);
	}

	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam Map<String, String> requestParams) {
		for(Entry<String, String> entry : requestParams.entrySet()) {
			log.warn(String.format("SurveyFragmentPost: key:%s||value:%s", entry.getKey(), entry.getValue()));
		}
		return null;
	}
}
