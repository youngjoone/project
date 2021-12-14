package com.hk.project.age.vo;

public class AgeVO {

	public String age;
	public int price;
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "AgeVO [age=" + age + ", price=" + price + "]";
	}
	
	
}
