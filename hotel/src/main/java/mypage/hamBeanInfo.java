package mypage;

//my_info 자바 빈즈 파일
import java.sql.*;

public class hamBeanInfo{
	
	private String MEM_NAME = "";
	private Date MEM_BIRTH;
	private String MEM_MAIL = "";
	private String MEM_PHONE = "";
	
	
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String MEM_NAME) {
		this.MEM_NAME = MEM_NAME;
	}
	public Date getMEM_BIRTH() {
		return MEM_BIRTH;
	}
	public void setMEM_BIRTH(Date MEM_BIRTH) {
		this.MEM_BIRTH = MEM_BIRTH;
	}
	public String getMEM_MAIL() {
		return MEM_MAIL;
	}
	public void setMEM_MAIL(String MEM_MAIL) {
		this.MEM_MAIL = MEM_MAIL;
	}
	public String getMEM_PHONE() {
		return MEM_PHONE;
	}
	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}
		
	
	
  
}

