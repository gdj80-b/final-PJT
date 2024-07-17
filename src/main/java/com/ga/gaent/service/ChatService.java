package com.ga.gaent.service;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.ChatRequestDTO;
import com.ga.gaent.mapper.ChatMapper;

@Transactional
@Service
public class ChatService {

    @Autowired
    private ChatMapper chatMapper;

    public void saveMessage(ChatRequestDTO message) {
        message.setTimestamp(LocalDateTime.now());
        chatMapper.save(message);
    }

    public List<ChatRequestDTO> getMessagesByRoomId(String roomId) {
        System.out.println("service chk: " + roomId);
        return chatMapper.findByRoomId(roomId);
    }
}
