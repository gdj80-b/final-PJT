package com.ga.gaent.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRequestDTO {
    
    private Long id;
    private String roomId;
    private String sender;
    private String content;
    private LocalDateTime timestamp;
}
