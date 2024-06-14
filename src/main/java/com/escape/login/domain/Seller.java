package com.escape.login.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Seller {
    private int seller_idx;
    private int user_idx;
    private String name;
    private int cnum;
    private String phone;
    private String logo;

    public Seller() {}
	public Seller(int seller_idx, int user_idx, String name, int cnum, String phone, String logo) {
		super();
		this.seller_idx = seller_idx;
		this.user_idx = user_idx;
		this.name = name;
		this.cnum = cnum;
		this.phone = phone;
		this.logo = logo;
	}
	
	public int getSeller_idx() {
		return seller_idx;
	}
	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	@Override
	public String toString() {
		return "Seller [seller_idx=" + seller_idx + ", user_idx=" + user_idx + ", name=" + name + ", cnum=" + cnum
				+ ", phone=" + phone + ", logo=" + logo + "]";
	}
	
}