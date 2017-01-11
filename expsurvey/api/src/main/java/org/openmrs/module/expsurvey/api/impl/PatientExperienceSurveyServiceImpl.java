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
package org.openmrs.module.expsurvey.api.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.expsurvey.api.PatientExperienceSurveyService;
import org.openmrs.module.expsurvey.api.db.PatientExperienceSurveyDAO;
import org.openmrs.module.expsurvey.PatientExperienceSurvey;
import org.springframework.transaction.annotation.Transactional;



/**
 * It is a default implementation of {@link PatientExperienceSurveyService}.
 */
public class PatientExperienceSurveyServiceImpl extends BaseOpenmrsService implements PatientExperienceSurveyService {
	protected final Log log = LogFactory.getLog(this.getClass());	
	private PatientExperienceSurveyDAO dao;
	/**
     * @param dao the dao to set
     */
    public void setDao(PatientExperienceSurveyDAO dao) {
	    this.dao = dao;
    }
    
    /**
     * @return the dao
     */
    public PatientExperienceSurveyDAO getDao() {
	    return dao;
    }
    /**
     * @see org.openmrs.module.department.api.DepartmentService#getAllDepartments()
     */
    @Override
    public List<PatientExperienceSurvey> getAllSurveys() {
            return dao.getAllSurveys();
    }
    
    /**
     * @see org.openmrs.module.department.api.DepartmentService#getDepartment(java.lang.Integer)
     */
    @Override
    public PatientExperienceSurvey getSurvey(Integer surveyId) {
        	return dao.getSurvey(surveyId);
    }
    
    /**
     * @see org.openmrs.module.department.api.DepartmentService#saveDepartment(org.openmrs.module.department.Department)
     */
    @Override
    public PatientExperienceSurvey saveSurvey(PatientExperienceSurvey aSurvey) {
            return dao.saveSurvey(aSurvey);
    }
    
    
    /**
     * @see org.openmrs.module.department.api.DepartmentService#purgeDepartment(org.openmrs.module.department.Department)
     */
    @Override
    public void purgeSurvey(PatientExperienceSurvey aSurvey) {
            dao.purgeSurvey(aSurvey);
    }

}
