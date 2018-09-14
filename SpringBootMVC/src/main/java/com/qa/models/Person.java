package com.qa.models;

public class Person {

	private String firstName;
	private String surname;
	private int age;
	private String email;

	public Person(){
		
	}
	public Person(String firstName, String surname, int age, String email) {
		super();
		this.firstName = firstName;
		this.surname = surname;
		this.age = age;
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
