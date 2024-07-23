package com.ga.gaent.service;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ga.gaent.dto.PaymentDTO;
import com.ga.gaent.mapper.PaymentMapper;
import com.ga.gaent.util.Paging;
import com.ga.gaent.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class PaymentService {
    @Autowired PaymentMapper paymentMapper;
    
    @Value("${toss-clientsecret-key}") 
    String clientsecretKey;
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 토스API를 이용해서 결제 정보 가져오기 및 DB에 저장
     */
    public int payPrd(
            String orderId,String paymentKey,String amount,String prodCode,String empCode
            ) throws Exception{
               
      
      log.debug(TeamColor.YELLOW + "orderId: "+orderId + "amount: "+ amount +"prodCode"+ prodCode +  TeamColor.RESET);

      JSONParser parser = new JSONParser();
      
      JSONObject obj = new JSONObject();
      obj.put("orderId", orderId);
      obj.put("amount", amount);
      obj.put("paymentKey", paymentKey);

      String widgetSecretKey = clientsecretKey;

      Base64.Encoder encoder = Base64.getEncoder();
      byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes(StandardCharsets.UTF_8));
      String authorizations = "Basic " + new String(encodedBytes);

      // 결제 승인 API를 호출
      URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
      HttpURLConnection connection = (HttpURLConnection) url.openConnection();
      connection.setRequestProperty("Authorization", authorizations);
      connection.setRequestProperty("Content-Type", "application/json");
      connection.setRequestMethod("POST");
      connection.setDoOutput(true);


      OutputStream outputStream = connection.getOutputStream();
      outputStream.write(obj.toString().getBytes("UTF-8"));

      int code = connection.getResponseCode();
      boolean isSuccess = code == 200;

      InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

      // TODO: 결제 성공 및 실패 비즈니스 로직을 구현하세요.
      Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
      JSONObject jsonObject = (JSONObject) parser.parse(reader);
      responseStream.close();

      log.debug(TeamColor.YELLOW + "json확인: " + jsonObject +  TeamColor.RESET);
      
      JSONObject easyPay = (JSONObject) jsonObject.get("easyPay");
      
      
      String provider = (String) easyPay.get("provider");
     
      Map<String,Object>map = new HashMap<>();
      map.put("prodCode", prodCode);
      map.put("empCode", empCode);
      map.put("payType", provider);
      map.put("payPrice", amount);

      
      // db저장
      int successDB   = paymentMapper.payPrd(map);
//        
      return successDB;
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 구매이력 조회
     */
    public List<PaymentDTO>getPaymentList(String empCode){
        
        List<PaymentDTO> list = paymentMapper.selectPaymentList(empCode);
        
        return list;
    }
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 22.
     * Description : 구매 이력 페이징
     */
    public Map<String, Object> getPagingIdx(String empCode,int currentPage) {

        int totalRow = paymentMapper.paymentCnt(empCode); // 전체 row수

        Paging v = new Paging();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);

        return pagingMap;
    }
    
    
}
