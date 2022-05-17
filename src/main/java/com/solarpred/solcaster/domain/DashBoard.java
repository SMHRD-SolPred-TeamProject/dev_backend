package com.solarpred.solcaster.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor

public class DashBoard {
	
	private int r_seq;
	private String r_date;
	private double r_temperature;
	private double r_precipitaion;
	private double r_wind;
	private double r_humidity;
	private double r_radiation;
	private double r_total_cloudiness;
	private double r_visibility;
	private double r_ground_temp;
	private int r_aod;
	private String r_id;
	
	

}
