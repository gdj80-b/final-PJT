package com.ga.gaent.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.mapper.PaymentMapper;
import com.ga.gaent.vo.PaymentVO;

@Transactional
@Service
public class PaymentService {
    @Autowired PaymentMapper paymentMapper;
    
    //구매
    public int payPrd(PaymentVO m) {       
        return paymentMapper.payPrd(m);
    }
    
    // 구매이력
    public List<PaymentVO>getPaymentList(String empCode){
        
        List<PaymentVO> list = paymentMapper.getPaymentList(empCode);
        
        return list;
    }
}
