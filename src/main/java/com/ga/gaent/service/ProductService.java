package com.ga.gaent.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.ProductMapper;
import com.ga.gaent.vo.PaymentVO;
import com.ga.gaent.vo.ProductVO;

@Transactional
@Service
public class ProductService {
    @Autowired ProductMapper productMapper;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 상픔 리스트 조회
     */
    public List<ProductVO> getProdList(){
        
         return productMapper.selectProdList();
    }
}
