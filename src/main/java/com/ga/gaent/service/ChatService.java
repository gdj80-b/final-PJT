package com.ga.gaent.service;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.ChatDTO;
import com.ga.gaent.mapper.ChatMapper;

@Transactional
@Service
public class ChatService {

    @Autowired
    private ChatMapper chatMapper;

    public void saveMessage(ChatDTO message) {
        message.setTimestamp(LocalDateTime.now());
        chatMapper.save(message);
    }

    public List<ChatDTO> getMessagesByRoomId(String roomId) {
        System.out.println("service chk: " + roomId);
        return chatMapper.findByRoomId(roomId);
    }
}
