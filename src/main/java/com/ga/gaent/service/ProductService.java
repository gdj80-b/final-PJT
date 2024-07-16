package com.ga.gaent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.ProductMapper;
import com.ga.gaent.vo.PaymentVO;

@Transactional
@Service
public class ProductService {
    @Autowired ProductMapper productMapper;
    
    
}
