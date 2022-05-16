package com.solarpred.solcaster.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Temp_weather {

    private String date_time;
    private Double temperature;
    private Double precipitation;
    private Double wind_speed;
    private Double humidity;
    private Double radiation;
    private Double total_cloudiness;
    private Double visibility;
    private Double ground_temp;

}
