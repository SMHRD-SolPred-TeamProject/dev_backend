package com.solarpred.solcaster.domain;

import lombok.*;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_zipcode;
    private String mem_addr;
    private String mem_addrdetail;
    private String mem_phone;
    private String mem_purchase;
    private String mem_type;
    private String mem_joindate;
}
