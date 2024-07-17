package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.ChatRequestDTO;

@Mapper
public interface ChatMapper {
    
    void save(ChatRequestDTO message);
    List<ChatRequestDTO> findByRoomId(String roomId);
}
