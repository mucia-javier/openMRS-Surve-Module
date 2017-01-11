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
package org.openmrs.module.expsurvey.api;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.openmrs.api.context.Context;
import org.openmrs.module.expsurvey.PatientExperienceSurvey;
import org.openmrs.module.expsurvey.api.db.PatientExperienceSurveyDAO;
import org.openmrs.module.expsurvey.api.impl.PatientExperienceSurveyServiceImpl;
import org.openmrs.test.BaseModuleContextSensitiveTest;

/**
 * Tests {@link ${PatientExperienceSurveyService}}.
 */
public class  PatientExperienceSurveyServiceTest extends BaseModuleContextSensitiveTest {
	
	private PatientExperienceSurveyService surveyService;
	private PatientExperienceSurveyDAO surveyDao;
	
	@Before
	public void setUp() {
		surveyService = new PatientExperienceSurveyServiceImpl();
		surveyDao = Mockito.mock(PatientExperienceSurveyDAO.class);
		((PatientExperienceSurveyServiceImpl)surveyService).setDao(surveyDao);
	}
	
	@Test
	public void testContextSetup() {
		assertNotNull(Context.getService(PatientExperienceSurveyService.class));
	}

	@Test
	public void testSaveSurvey() {
		PatientExperienceSurvey survey = this.getDummySurvey(0, 0, 0);
		surveyService.saveSurvey(survey);
		Mockito.verify(surveyDao).saveSurvey(survey);
	}

	@Test
	public void testGetSurvey() {
		surveyService.saveSurvey(this.getDummySurvey(1, 1, 1));
		PatientExperienceSurvey sv = surveyService.getSurvey(1);
		Mockito.verify(surveyDao).getSurvey(1);
	}

	@Test
	public void testGetAllSurvey() {
		surveyService.saveSurvey(this.getDummySurvey(2, 2, 2));
		List<PatientExperienceSurvey> surveys = surveyService.getAllSurveys();
		Mockito.verify(surveyDao).getAllSurveys();
	}

	@Test
	public void testPurgeSurvey() {
		PatientExperienceSurvey sv = this.getDummySurvey(3, 3, 3);
		surveyService.saveSurvey(sv);
		surveyService.purgeSurvey(sv);
		Mockito.verify(surveyDao).purgeSurvey(sv);
	}
	
	private PatientExperienceSurvey getDummySurvey(int surveyId, int patientId, int id) {
		PatientExperienceSurvey survey = new PatientExperienceSurvey();
		survey.setAnswer1(String.format("answer1:%s", surveyId));
		survey.setAnswer2(String.format("answer2:%s", surveyId));
		survey.setId(id);
		survey.setPatientId(patientId);
		survey.setSurveyId(surveyId);
		survey.setUuid(String.format("uuid:%s", surveyId));;
		return survey;
	}
}
