/**
 * 
 */
package com.openbravo.pos.customers;


/**
 * @author erp-consultor-1
 *
 */
public class CountryInfo {

	private String m_C_Country_ID	= "";
	private String m_IsActive 		= "";
	private String m_Name			= "";
	private String m_Description	= "";
	private String m_CountryCoude	= "";
	private String m_HasRegion		= "";
	private String m_RegionName		= "";
	private String m_C_Currency_ID	= "";
	
	/**
	 * @param m_C_Country_ID
	 * @param m_IsActive
	 * @param m_Name
	 * @param m_Description
	 * @param m_CountryCoude
	 * @param m_HasRegion
	 * @param m_RegionName
	 * @param m_C_Currency_ID
	 */
	public CountryInfo(String m_C_Country_ID, String m_IsActive, String m_Name,
			String m_Description, String m_CountryCoude, String m_HasRegion,
			String m_RegionName, String m_C_Currency_ID) {
		super();
		this.m_C_Country_ID = m_C_Country_ID;
		this.m_IsActive = m_IsActive;
		this.m_Name = m_Name;
		this.m_Description = m_Description;
		this.m_CountryCoude = m_CountryCoude;
		this.m_HasRegion = m_HasRegion;
		this.m_RegionName = m_RegionName;
		this.m_C_Currency_ID = m_C_Currency_ID;
	}

	public CountryInfo(String m_C_Country_ID, String m_Name) {
		this.m_C_Country_ID = m_C_Country_ID;
		this.m_Name = m_Name;
	}

	/**
	 * @return the m_C_Country_ID
	 */
	public String getM_C_Country_ID() {
		return m_C_Country_ID;
	}

	/**
	 * @param m_C_Country_ID the m_C_Country_ID to set
	 */
	public void setM_C_Country_ID(String m_C_Country_ID) {
		this.m_C_Country_ID = m_C_Country_ID;
	}

	/**
	 * @return the m_IsActive
	 */
	public String getM_IsActive() {
		return m_IsActive;
	}

	/**
	 * @param m_IsActive the m_IsActive to set
	 */
	public void setM_IsActive(String m_IsActive) {
		this.m_IsActive = m_IsActive;
	}

	/**
	 * @return the m_Name
	 */
	public String getM_Name() {
		return m_Name;
	}

	/**
	 * @param m_Name the m_Name to set
	 */
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	/**
	 * @return the m_Description
	 */
	public String getM_Description() {
		return m_Description;
	}

	/**
	 * @param m_Description the m_Description to set
	 */
	public void setM_Description(String m_Description) {
		this.m_Description = m_Description;
	}

	/**
	 * @return the m_CountryCoude
	 */
	public String getM_CountryCoude() {
		return m_CountryCoude;
	}

	/**
	 * @param m_CountryCoude the m_CountryCoude to set
	 */
	public void setM_CountryCoude(String m_CountryCoude) {
		this.m_CountryCoude = m_CountryCoude;
	}

	/**
	 * @return the m_HasRegion
	 */
	public String getM_HasRegion() {
		return m_HasRegion;
	}

	/**
	 * @param m_HasRegion the m_HasRegion to set
	 */
	public void setM_HasRegion(String m_HasRegion) {
		this.m_HasRegion = m_HasRegion;
	}

	/**
	 * @return the m_RegionName
	 */
	public String getM_RegionName() {
		return m_RegionName;
	}

	/**
	 * @param m_RegionName the m_RegionName to set
	 */
	public void setM_RegionName(String m_RegionName) {
		this.m_RegionName = m_RegionName;
	}

	/**
	 * @return the m_C_Currency_ID
	 */
	public String getM_C_Currency_ID() {
		return m_C_Currency_ID;
	}

	/**
	 * @param m_C_Currency_ID the m_C_Currency_ID to set
	 */
	public void setM_C_Currency_ID(String m_C_Currency_ID) {
		this.m_C_Currency_ID = m_C_Currency_ID;
	}
	
	@Override
	public String toString(){
	    return m_Name;
	}
	
	
}
