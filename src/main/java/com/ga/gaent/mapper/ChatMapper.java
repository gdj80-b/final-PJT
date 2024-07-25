package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.ChatDTO;

@Mapper
public interface ChatMapper {
    
    void save(ChatDTO message);
    List<ChatDTO> findByRoomId(String roomId);
}
