package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
    int selectNoticeCount(Map<String, Object> paramMap);
    List<NoticeVO> selectNoticeList(Map<String, Object> paramMap);
}
