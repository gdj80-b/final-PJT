package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.PaymentDTO;
import com.ga.gaent.vo.PaymentVO;

@Mapper
public interface PaymentMapper {
    
    // 구매
    int payPrd(Map<String,Object>m);
    
    // 구매이력
    List<PaymentDTO> selectPaymentList(String empCode);

    // 구매이력 페이징
    int paymentCnt(String empCode);
    
}
