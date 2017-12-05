package kr.co.bit.vo;

public class CityVO {

	public int cityNo;
	public String cityName;
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	@Override
	public String toString() {
		return "CityVO [cityNo=" + cityNo + ", cityName=" + cityName + "]";
	}
	
	

	
	
}
