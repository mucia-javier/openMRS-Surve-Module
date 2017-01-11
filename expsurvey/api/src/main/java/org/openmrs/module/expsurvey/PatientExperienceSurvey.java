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
package org.openmrs.module.expsurvey;

import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;
import org.openmrs.Concept;
import org.openmrs.BaseOpenmrsMetadata;

/**
 * It is a model class. It should extend either {@link BaseOpenmrsObject} or {@link BaseOpenmrsMetadata}.
 */
public class PatientExperienceSurvey extends BaseOpenmrsObject implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer surveyId; // X
	private Integer patientId; //X
	private String answer1;		//X
	private String answer2;
	
	
	
	public Integer getSurveyId() {
		return surveyId;
		}
	public void setSurveyId(Integer id) {
		this.surveyId = id;
		}
	
	@Override
    public Integer getId() {
        return getSurveyId();
  		}
   	@Override
   	public void setId(Integer id) {
        setSurveyId(id);
   		}
		
	public Integer getPatientId() {
		return patientId;
		}
	public void setPatientId(Integer id) {
		this.patientId = id;
		}
	
	
	public String getAnswer1() {
		return answer1;
		}
	public void setAnswer1(String s) {
		this.answer1 = s;
		}
	
	
		public String getAnswer2() {
		return answer2;
		}
	public void setAnswer2(String s) {
		this.answer2 = s;
		}
	
	
	
}