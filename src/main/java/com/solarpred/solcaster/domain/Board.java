package com.solarpred.solcaster.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Time;
import java.util.Date;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private int qna_seq;
    private String qna_cat;
    private String qna_title;
    private String qna_content;
    private String qna_date;
    private String qna_file;
    private String mem_id;
    private int qna_cnt;
}
