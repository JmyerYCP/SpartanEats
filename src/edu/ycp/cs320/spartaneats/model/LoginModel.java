package edu.ycp.cs320.spartaneats.model;




public class LoginModel {
	private String accountName;
	private String password;
	private String error;
	private String adminStatus;
	private Account account;
	private boolean admin;
	private boolean success;
	
	
	// create an account with given name and password
	public LoginModel() {
		
	}
	
	public String getAccountName() {
		return this.accountName;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getError() {
		return this.error;
	}
	public String getAdminStatus() {
		return this.adminStatus;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setError(String error) {
		this.error = error;
	}
	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
	public Account getAccount() {
		return this.account;
	}
	
	public boolean getSuccess() {
		return this.success;
	}
	
	public void setSuccess(boolean success) {
		this.success = success;
	}
	//Addition for Admin Status
	public boolean getAdmin() {
		return this.admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
}
