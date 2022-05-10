package com.solarpred.solcaster.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

    private int reply_seq;
    private int qna_seq;
    private String reply_content;
    private String reply_id;
    private String reply_date;

}
