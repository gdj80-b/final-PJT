package com.ga.gaent.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.ga.gaent.dto.PaymentDTO;
import com.ga.gaent.vo.PaymentVO;

@Mapper
public interface PaymentMapper {
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 상품구매시 이력 DB에 저장
     */
    int payPrd(Map<String,Object>m);
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 상품 구매 리스트 조회
     */
    List<PaymentDTO> selectPaymentList(Map<String,Object>m);

    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 상품 구매 리스트 페이징
     */
    int paymentCnt(String empCode);
    
}
