package com.escape.kakao.domain;

public class PaymentVo {
	
	private int airplane_pay_idx;
	private int user_idx;
	private int airplane_reservation_idx;
	private int price;
	private int state;
	private String created;
	private int airplane_time_idx;
	private String userId;

	public PaymentVo() {}
	public PaymentVo(int airplane_pay_idx, int user_idx, int airplane_reservation_idx, int price, int state,
			String created, int airplane_time_idx, String userId) {
		super();
		this.airplane_pay_idx = airplane_pay_idx;
		this.user_idx = user_idx;
		this.airplane_reservation_idx = airplane_reservation_idx;
		this.price = price;
		this.state = state;
		this.created = created;
		this.airplane_time_idx = airplane_time_idx;
		this.userId = userId;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public int getAirplane_time_idx() {
		return airplane_time_idx;
	}
	public void setAirplane_time_idx(int airplane_time_idx) {
		this.airplane_time_idx = airplane_time_idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "PaymentVo [airplane_pay_idx=" + airplane_pay_idx + ", user_idx=" + user_idx
				+ ", airplane_reservation_idx=" + airplane_reservation_idx + ", price=" + price + ", state=" + state
				+ ", created=" + created + ", airplane_time_idx=" + airplane_time_idx + ", userId=" + userId + "]";
	}
	
}
