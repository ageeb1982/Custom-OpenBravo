/**
 * 
 */
package com.openbravo.pos.customers;

/**
 * @author erp-consultor-1
 *
 */
public class CityInfo {
	private String m_C_City_ID;
	private String m_Name;
	private String m_C_Region_ID;
	/**
	 * @param m_C_City_ID
	 * @param m_Name
	 * @param m_C_Region_ID
	 */
	public CityInfo(String m_C_City_ID, String m_Name, String m_C_Region_ID) {
		super();
		this.m_C_City_ID = m_C_City_ID;
		this.m_Name = m_Name;
		this.m_C_Region_ID = m_C_Region_ID;
	}
	/**
	 * @return the m_C_City_ID
	 */
	public String getM_C_City_ID() {
		return m_C_City_ID;
	}
	/**
	 * @param m_C_City_ID the m_C_City_ID to set
	 */
	public void setM_C_City_ID(String m_C_City_ID) {
		this.m_C_City_ID = m_C_City_ID;
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
	 * @return the m_C_Region_ID
	 */
	public String getM_C_Region_ID() {
		return m_C_Region_ID;
	}
	/**
	 * @param m_C_Region_ID the m_C_Region_ID to set
	 */
	public void setM_C_Region_ID(String m_C_Region_ID) {
		this.m_C_Region_ID = m_C_Region_ID;
	}
	
	public String toString() {
		return m_Name;
	}
	
}
