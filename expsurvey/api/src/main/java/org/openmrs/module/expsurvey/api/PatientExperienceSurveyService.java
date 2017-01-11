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

import java.util.List;
import org.hibernate.SessionFactory;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.expsurvey.PatientExperienceSurvey;
import org.springframework.transaction.annotation.Transactional;

/**
 * This service exposes module's core functionality. It is a Spring managed bean which is configured in moduleApplicationContext.xml.
 * <p>
 * It can be accessed only via Context:<br>
 * <code>
 * Context.getService(PatientExperienceSurveyService.class).someMethod();
 * </code>
 * 
 * @see org.openmrs.api.context.Context
 */
@Transactional
public interface PatientExperienceSurveyService extends OpenmrsService {
    /**
     * Gets a list of PatientExperienceSurveys
     *
     * @return the PatientExperienceSurvey list.
     */
    @Transactional(readOnly = true)
    List<PatientExperienceSurvey> getAllSurveys();
	
    
    /**
     * Gets a PatientExperienceSurveys for a given id.
     *
     * @param id the PatientExperienceSurvey id
     * @return the PatientExperienceSurvey with the given id
     */
    @Transactional(readOnly = true)
    PatientExperienceSurvey getSurvey(Integer surveyId);
	
	
    /**
     * Saves a new or existing PatientExperienceSurvey.
     *
     * @param aSurvey the PatientExperienceSurvey to save.
     * @return the saved PatientExperienceSurvey.
     */
    PatientExperienceSurvey saveSurvey(PatientExperienceSurvey aSurvey);
	
	

    /**
     * Deletes a department from the database.
     *
     * @param department the department to delete.
     */
    void purgeSurvey(PatientExperienceSurvey aSurvey);
	
}
