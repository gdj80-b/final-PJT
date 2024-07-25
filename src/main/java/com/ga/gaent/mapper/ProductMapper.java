package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.ProductVO;

@Mapper
public interface ProductMapper {
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 상품 목록 리스트 조회
     */
    List<ProductVO> selectProdList();
}
