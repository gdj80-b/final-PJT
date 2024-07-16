package com.ga.gaent.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.vo.PaymentVO;

@Mapper
public interface PaymentMapper {
    
    // 구매
    int payPrd(PaymentVO m);
    
    // 구매이력
    List<PaymentVO> getPaymentList(String empCode);
    
}
