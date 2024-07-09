package com.escape.kakao.domain;

public class PaymentVo {
	
	private int airplane_pay_idx;
	private int user_idx;
	private int airplane_reservation_idx;
	private int price1;
	private int price2;
	private int state;
	private String created;
	private int airplane_time_idx1;
	private int airplane_time_idx2;
	private String userId;
	private int totalCount;
	private int totalPrice;
	private String itemName1;
	private String itemName2;
	private int known;

	public PaymentVo() {}
	public PaymentVo(int airplane_pay_idx, int user_idx, int airplane_reservation_idx, int price1, int price2,
			int state, String created, int airplane_time_idx1, int airplane_time_idx2, String userId, int totalCount,
			int totalPrice, String itemName1, String itemName2, int known) {
		super();
		this.airplane_pay_idx = airplane_pay_idx;
		this.user_idx = user_idx;
		this.airplane_reservation_idx = airplane_reservation_idx;
		this.price1 = price1;
		this.price2 = price2;
		this.state = state;
		this.created = created;
		this.airplane_time_idx1 = airplane_time_idx1;
		this.airplane_time_idx2 = airplane_time_idx2;
		this.userId = userId;
		this.totalCount = totalCount;
		this.totalPrice = totalPrice;
		this.itemName1 = itemName1;
		this.itemName2 = itemName2;
		this.known = known;
	}

	public int getAirplane_pay_idx() {
		return airplane_pay_idx;
	}
	public void setAirplane_pay_idx(int airplane_pay_idx) {
		this.airplane_pay_idx = airplane_pay_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getAirplane_reservation_idx() {
		return airplane_reservation_idx;
	}
	public void setAirplane_reservation_idx(int airplane_reservation_idx) {
		this.airplane_reservation_idx = airplane_reservation_idx;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getAirplane_time_idx1() {
		return airplane_time_idx1;
	}
	public void setAirplane_time_idx1(int airplane_time_idx1) {
		this.airplane_time_idx1 = airplane_time_idx1;
	}
	public int getAirplane_time_idx2() {
		return airplane_time_idx2;
	}
	public void setAirplane_time_idx2(int airplane_time_idx2) {
		this.airplane_time_idx2 = airplane_time_idx2;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getItemName1() {
		return itemName1;
	}
	public void setItemName1(String itemName1) {
		this.itemName1 = itemName1;
	}
	public String getItemName2() {
		return itemName2;
	}
	public void setItemName2(String itemName2) {
		this.itemName2 = itemName2;
	}
	public int getKnown() {
		return known;
	}
	public void setKnown(int known) {
		this.known = known;
	}
	
	@Override
	public String toString() {
		return "PaymentVo [airplane_pay_idx=" + airplane_pay_idx + ", user_idx=" + user_idx
				+ ", airplane_reservation_idx=" + airplane_reservation_idx + ", price1=" + price1 + ", price2=" + price2
				+ ", state=" + state + ", created=" + created + ", airplane_time_idx1=" + airplane_time_idx1
				+ ", airplane_time_idx2=" + airplane_time_idx2 + ", userId=" + userId + ", totalCount=" + totalCount
				+ ", totalPrice=" + totalPrice + ", itemName1=" + itemName1 + ", itemName2=" + itemName2 + ", known="
				+ known + "]";
	}
	
}