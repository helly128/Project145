package com.pj.vegi.mywallet.vo;

public class WithDrawResVO {
	String api_tran_id; // 거래고유번호
	String api_tran_dtm; // 거래일시(밀리세컨드)
	String dps_bank_name; // 입금기관명
	String dps_account_num_masked; // 입금계좌번호(출력용)
	String dps_print_content; // 입금계좌인자내역
	String dps_account_holder_name; // 수취인성명
	String bank_tran_date; // 거래일자(참가은행)
	String fintech_use_num; // 출금계좌핀테크이용번호
	String bank_name; // 출금기관명
	String account_num_masked; // 출금계좌번호(출력용)
	String print_content; // 출금계좌인자내역
	String account_holder_name; // 송금인성명
	String tran_amt; // 거래금액
	String wd_limit_remain_amt; // 출금한도잔여금액
	public String getApi_tran_id() {
		return api_tran_id;
	}
	public void setApi_tran_id(String api_tran_id) {
		this.api_tran_id = api_tran_id;
	}
	public String getApi_tran_dtm() {
		return api_tran_dtm;
	}
	public void setApi_tran_dtm(String api_tran_dtm) {
		this.api_tran_dtm = api_tran_dtm;
	}
	public String getDps_bank_name() {
		return dps_bank_name;
	}
	public void setDps_bank_name(String dps_bank_name) {
		this.dps_bank_name = dps_bank_name;
	}
	public String getDps_account_num_masked() {
		return dps_account_num_masked;
	}
	public void setDps_account_num_masked(String dps_account_num_masked) {
		this.dps_account_num_masked = dps_account_num_masked;
	}
	public String getDps_print_content() {
		return dps_print_content;
	}
	public void setDps_print_content(String dps_print_content) {
		this.dps_print_content = dps_print_content;
	}
	public String getDps_account_holder_name() {
		return dps_account_holder_name;
	}
	public void setDps_account_holder_name(String dps_account_holder_name) {
		this.dps_account_holder_name = dps_account_holder_name;
	}
	public String getBank_tran_date() {
		return bank_tran_date;
	}
	public void setBank_tran_date(String bank_tran_date) {
		this.bank_tran_date = bank_tran_date;
	}
	public String getFintech_use_num() {
		return fintech_use_num;
	}
	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_num_masked() {
		return account_num_masked;
	}
	public void setAccount_num_masked(String account_num_masked) {
		this.account_num_masked = account_num_masked;
	}
	public String getPrint_content() {
		return print_content;
	}
	public void setPrint_content(String print_content) {
		this.print_content = print_content;
	}
	public String getAccount_holder_name() {
		return account_holder_name;
	}
	public void setAccount_holder_name(String account_holder_name) {
		this.account_holder_name = account_holder_name;
	}
	public String getTran_amt() {
		return tran_amt;
	}
	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}
	public String getWd_limit_remain_amt() {
		return wd_limit_remain_amt;
	}
	public void setWd_limit_remain_amt(String wd_limit_remain_amt) {
		this.wd_limit_remain_amt = wd_limit_remain_amt;
	}
	
	
}
