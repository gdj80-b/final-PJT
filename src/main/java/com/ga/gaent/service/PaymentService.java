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
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.PagingVO;
import com.ga.gaent.vo.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class PaymentService {
    @Autowired PaymentMapper paymentMapper;
    
    @Value("${toss-clientsecret-key}") 
    String clientsecretKey;
    
    //구매
    public int payPrd(
            String orderId,String paymentKey,String amount,String prodCode,String empCode
            ) throws Exception{
               
      
      log.debug(TeamColor.YELLOW + "orderId: "+orderId + "amount: "+ amount +"prodCode"+ prodCode +  TeamColor.RESET);

      JSONParser parser = new JSONParser();
      
      JSONObject obj = new JSONObject();
      obj.put("orderId", orderId);
      obj.put("amount", amount);
      obj.put("paymentKey", paymentKey);

      
   // TODO: 개발자센터에 로그인해서 내 결제위젯 연동 키 > 시크릿 키를 입력하세요. 시크릿 키는 외부에 공개되면 안돼요.
      // @docs https://docs.tosspayments.com/reference/using-api/api-keys
      // String widgetSecretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6";
       String widgetSecretKey = clientsecretKey ;
      // String widgetSecretKey = "test_sk_ORzdMaqN3weplJO1xJwgr5AkYXQG";

      // 토스페이먼츠 API는 시크릿 키를 사용자 ID로 사용하고, 비밀번호는 사용하지 않습니다.
      // 비밀번호가 없다는 것을 알리기 위해 시크릿 키 뒤에 콜론을 추가합니다.
      // @docs https://docs.tosspayments.com/reference/using-api/authorization#%EC%9D%B8%EC%A6%9D
      Base64.Encoder encoder = Base64.getEncoder();
      byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes(StandardCharsets.UTF_8));
      String authorizations = "Basic " + new String(encodedBytes);

      // 결제 승인 API를 호출하세요.
      // 결제를 승인하면 결제수단에서 금액이 차감돼요.
      // @docs https://docs.tosspayments.com/guides/payment-widget/integration#3-결제-승인하기
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

      
      // db넣기
     int successDB   = paymentMapper.payPrd(map);
//        
      return successDB;
    }
    
    // 구매이력
    public List<PaymentDTO>getPaymentList(String empCode){
        
        List<PaymentDTO> list = paymentMapper.selectPaymentList(empCode);
        
        return list;
    }
    
    public Map<String, Object> getPagingIdx(String empCode,int currentPage) {

        int totalRow = paymentMapper.paymentCnt(empCode); // 전체 row수

        PagingVO v = new PagingVO();
        Map<String, Object> pagingMap = v.Paging(currentPage, totalRow);

        return pagingMap;
    }
    
    
}
