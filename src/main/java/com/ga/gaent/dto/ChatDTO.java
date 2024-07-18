package com.ga.gaent.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatDTO {
    
    private String sender;
    private String receiver;
    private String name;
    private String team;
    
    private String roomNum;
    private String roomName;
    private String roomStatus;
    
    private String message;
    private LocalDateTime timestamp;
    
    private MessageType type;
    
    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE
    }
}
