package com.ga.gaent.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.service.MsgService;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.MsgVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/msg")
public class MsgController {
    final String YELLOW = "\u001B[33m\n";
    final String RED = "\u001B[31m\n";
    final String RESET = "\u001B[0m\n";
    @Autowired MsgService msgService;
    
    // 리스트출력
    @GetMapping("/{request}")
    String selectMsgList(
            @PathVariable(name= "request", required = false) Integer request,
            HttpSession session,
            Model model ){
        
        Map<String,Object> loginInfo = (Map<String,Object>)(session.getAttribute("loginInfo"));
        loginInfo.put("empCode", "20110004");
        
        // List<MsgVO>list = msgService.getMsgList((String)loginInfo.get("empCode"),request);
        List<MsgVO>list = msgService.getMsgList("20110004",request);
        
        
        
        
        model.addAttribute("list",list);
        
        if(request == 1) {                  // 받은쪽지함
            return "/msg/msgReceiveList";
        }else if (request==2){              // 보낸쪽지함
            return "/msg/msgSendList";
        }else if (request==3){              // 내게쓴쪽지함
            return "/msg/msgSelf";
        }else if (request==4){              // 휴지통
            return "/msg/msgBin";
        }else {                             // 전체
            return "/msg/msgList";
        }
    }
    
    // 발송
    @PostMapping("/sendMessage")
    @ResponseBody
    public int sendMsg(
//            @RequestParam(name = "sender") String sender,
//            @RequestParam(name = "receiver") String receiver,
//            @RequestParam(name = "msgTitle") String msgTitle,
//            @RequestParam(name = "msgContent") String msgContent
             MsgVO m
            ) {        
        
      
         log.debug(RED + "확인 : "+ m.getMsgTitle()+ RESET );
       // log.debug(TeamColor.RED + "확인 : "+ msgTitle + RESET );
        int success = msgService.sendMsg(m);
        
        
        return success;
    }

    // 삭제,복원
    @PostMapping("/modifyMsgStatus")
    @ResponseBody
    public int modifyMsgStatus(
                @RequestParam(name="empCode") String empCode,
                @RequestParam(name="request") String request,
                @RequestParam(name="msgNums", required=false) String[] msgNums) {
        // 배열의 내용을 보기 위해 Arrays.toString()을 사용합니다.
        log.debug(YELLOW + "(컨)번호: " + Arrays.toString(msgNums) + " request: " + request + RESET); 
        log.debug(YELLOW + "개수 " + msgNums.length + RESET); 
        
        int result = 0;
        Map<String, Object> deleteMsgMap = new HashMap<>();
        for (String no : msgNums) {
            deleteMsgMap.put("empCode", empCode);
            deleteMsgMap.put("request", request);
            deleteMsgMap.put("msgNum", no); // 여기서 msgNum을 각각의 no로 수정합니다.
            result = result + msgService.modifyMsgState(deleteMsgMap);
        }
        
        log.debug(RED + "result: " + result + RESET );
        if(msgNums.length == result ) {
            return 1;
        }else {
            return 0;
        }
        
    }
}
