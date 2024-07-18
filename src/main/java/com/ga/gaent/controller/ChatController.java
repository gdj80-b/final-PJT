package com.ga.gaent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.ga.gaent.dto.ChatDTO;
import com.ga.gaent.dto.ChatDTO.MessageType;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {

    @Autowired private SimpMessagingTemplate simpMessagingTemplate;

    @GetMapping("/chat")
    public String chat() {
        return "chat/chat";
    }

    @GetMapping("/bubble")
    public String speechBubble() {
        return "chat/speechBubble";
    }

    /*
     * @MessageMapping("/chat.sendMessage")
     * 
     * @SendToUser("/queue/messages") public void sendMessage(@Payload ChatDTO chatDTO) { if
     * (chatDTO.getType() == MessageType.CHAT) { log.debug(TeamColor.BLUE_BG + "CHAT.TYPE: " + chatDTO +
     * TeamColor.RESET); simpMessagingTemplate.convertAndSendToUser(chatDTO.getReceiver(),
     * "/queue/messages", chatDTO); } else if (chatDTO.getType() == MessageType.JOIN) {
     * log.debug(TeamColor.PURPLE_BG + "JOIN.TYPE: " + chatDTO + TeamColor.RESET);
     * chatDTO.setMessage(chatDTO.getSender() + " joined the chat");
     * simpMessagingTemplate.convertAndSendToUser(chatDTO.getReceiver(), "/queue/messages", chatDTO); }
     * else if (chatDTO.getType() == MessageType.LEAVE) { log.debug(TeamColor.RED_BG + "LEAVE.TYPE: " +
     * chatDTO + TeamColor.RESET); chatDTO.setMessage(chatDTO.getSender() + " left the chat");
     * simpMessagingTemplate.convertAndSendToUser(chatDTO.getReceiver(), "/queue/messages", chatDTO); }
     * }
     */

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatDTO chatDTO) {
        if (chatDTO.getType() == MessageType.CHAT) {
            log.debug(TeamColor.BLUE_BG + "CHAT.TYPE: " + chatDTO + TeamColor.RESET);
            simpMessagingTemplate.convertAndSend("/queue/messages", chatDTO);
        } else if (chatDTO.getType() == MessageType.JOIN) {
            log.debug(TeamColor.PURPLE_BG + "JOIN.TYPE: " + chatDTO + TeamColor.RESET);
            chatDTO.setMessage(chatDTO.getSender() + " joined the chat");
            simpMessagingTemplate.convertAndSend("/queue/messages", chatDTO);
        } else if (chatDTO.getType() == MessageType.LEAVE) {
            log.debug(TeamColor.RED_BG + "LEAVE.TYPE: " + chatDTO + TeamColor.RESET);
            chatDTO.setMessage(chatDTO.getSender() + " left the chat");
            simpMessagingTemplate.convertAndSend("/queue/messages", chatDTO);
        }
    }
}
