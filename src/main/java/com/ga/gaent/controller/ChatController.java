package com.ga.gaent.controller;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.ga.gaent.dto.ChatRequestDTO;
import com.ga.gaent.service.ChatService;

@Controller
public class ChatController {
    
    @Autowired private SimpMessagingTemplate simpMessagingTemplate;
    
    @Autowired private ChatService chatService;

    @GetMapping("/chat")
    public String chat() {
        return "chat/chat";
    }
    
    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatRequestDTO chatMessage) {
        chatMessage.setTimestamp(LocalDateTime.now());
        chatService.saveMessage(chatMessage);
        simpMessagingTemplate.convertAndSend("/topic/" + chatMessage.getRoomId(), chatMessage);
    }

    @SuppressWarnings("null")
    @MessageMapping("/chat.addUser")
    public void addUser(@Payload ChatRequestDTO chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        chatMessage.setContent("User joined: " + chatMessage.getSender());
        chatService.saveMessage(chatMessage);
        simpMessagingTemplate.convertAndSend("/topic/" + chatMessage.getRoomId(), chatMessage);
    }

    @GetMapping("/chat/history/{roomId}")
    public List<ChatRequestDTO> getChatHistory(@PathVariable(name = "roomId") String roomId) {
        System.out.println("chk: " + roomId);
        List<ChatRequestDTO> chatHistory = chatService.getMessagesByRoomId(roomId);
        System.out.println("chk: " + chatHistory);
        return chatHistory;
    }
}
 