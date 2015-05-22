package com.openbravo.pos.customers;

public class RegionInfo {
	
	private String m_C_Region_ID = "";
	private String m_Name = "";
	private String m_C_Country_ID ="";
	
	/**
	 * @param m_C_Region_ID
	 * @param m_Name
	 * @param m_C_Country_ID
	 */
	public RegionInfo(String m_C_Region_ID, String m_Name, String m_C_Country_ID) {
		super();
		this.m_C_Region_ID = m_C_Region_ID;
		this.m_Name = m_Name;
		this.m_C_Country_ID = m_C_Country_ID;
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

	public String toString () {
		return m_Name;
	}
	
	
	

}
