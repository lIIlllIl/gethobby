package com.gethobby.service.domain;

public class AuthData {

	//Field
	private String imp_key;
	private String imp_secret;
	
	//Constructor
	public AuthData(String imp_key, String imp_secret) {
		this.imp_key = imp_key;
		this.imp_secret = imp_secret;
	}

	//Method
	public String getImp_key() {
		return imp_key;
	}

	public void setImp_key(String imp_key) {
		this.imp_key = imp_key;
	}

	public String getImp_secret() {
		return imp_secret;
	}

	public void setImp_secret(String imp_secret) {
		this.imp_secret = imp_secret;
	}
	
}//end of AuthData Domain
