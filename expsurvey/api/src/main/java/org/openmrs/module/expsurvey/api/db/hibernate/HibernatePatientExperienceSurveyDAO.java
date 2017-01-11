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
package org.openmrs.module.expsurvey.api.db.hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.openmrs.Patient;
import org.openmrs.Encounter;
import org.openmrs.module.expsurvey.PatientExperienceSurvey;
import org.openmrs.module.expsurvey.api.db.PatientExperienceSurveyDAO;

/**
 * It is a default implementation of  {@link PatientExperienceSurveyDAO}.
 */
public class HibernatePatientExperienceSurveyDAO implements PatientExperienceSurveyDAO {
	protected final Log log = LogFactory.getLog(this.getClass());
	private SessionFactory sessionFactory;
			
	/**
     * @param sessionFactory the sessionFactory to set
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
    }
    
	/**
     * @return the sessionFactory
     */
    public SessionFactory getSessionFactory() {
	    return sessionFactory;
    }
    
    /**
     * @see org.openmrs.module.department.api.db.DepartmentDAO#getAllDepartments()
     */
    @Override
    public List<PatientExperienceSurvey> getAllSurveys() {
            return sessionFactory.getCurrentSession().createCriteria(PatientExperienceSurvey.class).list();
    }
    /**
     * @see org.openmrs.module.department.api.DepartmentService#getDepartment(java.lang.Integer)
     */
    @Override
    public PatientExperienceSurvey getSurvey(Integer surveyId) {
            return (PatientExperienceSurvey) sessionFactory.getCurrentSession().get(PatientExperienceSurvey.class, surveyId);
    }
    /**
     * @see org.openmrs.module.department.api.db.DepartmentDAO#saveDepartment(org.openmrs.module.department.Department)
     */
    @Override
    public PatientExperienceSurvey saveSurvey(PatientExperienceSurvey aSurvey){
            sessionFactory.getCurrentSession().save(aSurvey);
            return aSurvey;
    }
    /**
     * @see org.openmrs.module.department.api.db.DepartmentDAO#purgeDepartment(org.openmrs.module.department.Department)
     */
    @Override
    public void purgeSurvey(PatientExperienceSurvey aSurvey) {
            sessionFactory.getCurrentSession().delete(aSurvey);
    }
    
    
}
