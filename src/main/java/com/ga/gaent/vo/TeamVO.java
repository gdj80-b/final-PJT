package com.ga.gaent.vo;

import lombok.Data;

@Data
public class TeamVO {
    
    private String teamCode;
    private String teamName;
    private String teamDes;
    private String parentTeamCode;
    private String teamCreateDate;
    private String teamUpdateDate;
}
