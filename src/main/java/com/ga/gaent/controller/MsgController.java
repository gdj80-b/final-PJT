package com.ga.gaent.controller;

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
    final String RESET = "\u001B[0m\n";
    @Autowired MsgService msgService;
    
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
        
        if(request == 1) {
            return "/msg/msgReceiveList";
        }else if (request==2){
            return "/msg/msgSendList";
        }else if (request==3){
            return "/msg/msgBin";
        }else {
            return "/msg/msgList";
        }
    }
    
    
    @PostMapping("/sendMessage")
    @ResponseBody
    public int sendMsg(
            @RequestParam(name = "sender") String sender,
            @RequestParam(name = "receiver") String receiver,
            @RequestParam(name = "msgTitle") String msgTitle,
            @RequestParam(name = "msgContent") String msgContent
            // MsgVO m
            ) {        
        
      
        // log.debug(TeamColor.RED + "확인 : "+ m.getMsgTitle()+ TeamColor.RESET );
        log.debug(TeamColor.RED + "확인 : "+ msgTitle + RESET );
        int success = 1;
                
        // success = msgService.sendMsg(m);
        
        
        return success;
    }
    
    
}
