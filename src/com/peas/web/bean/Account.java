package com.peas.web.bean;

public class Account {

    private long accountId;
    private String name;
    private String password;
    private String emaiAddress;

    public Account() {

    }

    public long getAccountId() {

        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmailAddress() {
        return emaiAddress;
    }

    public void setEmailAddress(String emaiAddress) {
        this.emaiAddress = emaiAddress;
    }

}
