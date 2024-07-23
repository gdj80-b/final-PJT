package com.ga.gaent.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.BoardRequestDTO;

@Mapper
public interface BoardMapper {

    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(자유게시판) 작성하기
     */
    int insertBoard(BoardRequestDTO boardRequestDTO);
    
    /*
     * @author : 정건희
     * @since : 2024. 07. 24.
     * Description : 게시글(공지사항) 작성하기
     */
    int insertNotice(BoardRequestDTO boardRequestDTO);
}
