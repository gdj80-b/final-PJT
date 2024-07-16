package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.ProductVO;

@Mapper
public interface ProductMapper {
    
    List<ProductVO> getProdList();    
}
