package com.phil.aic.bean;

public class Account {
    public Account() {
		super();
	}

	private String accountId;

    private String password;

    public Account(String accountId, String password, Integer deptId, Integer isLeader, String tel, String accountName) {
		super();
		this.accountId = accountId;
		this.password = password;
		this.deptId = deptId;
		this.isLeader = isLeader;
		this.tel = tel;
		this.accountName = accountName;
	}

	private Integer deptId;

    private Integer isLeader;

    private String tel;

    private String accountName;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId == null ? null : accountId.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getIsLeader() {
        return isLeader;
    }

    public void setIsLeader(Integer isLeader) {
        this.isLeader = isLeader;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName == null ? null : accountName.trim();
    }
}