package com.solarpred.solcaster.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
public class Prediction {
	
	private int pred_seq;
	private int r_seq;
	private String pred_time;
	private double pred_aod;

}
