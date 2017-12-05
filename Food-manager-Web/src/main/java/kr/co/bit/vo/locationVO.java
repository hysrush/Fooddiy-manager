package kr.co.bit.vo;

public class locationVO {

	public int locationNo;
	public String locationName;
	public int cityNo;
	
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	@Override
	public String toString() {
		return "locationVO [locationNo=" + locationNo + ", locationName=" + locationName + ", cityNo=" + cityNo + "]";
	}

	
	
	
	
	
}
