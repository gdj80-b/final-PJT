package com.ga.gaent.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ga.gaent.dto.FileReqDTO;
import com.ga.gaent.dto.MsgDTO;
import com.ga.gaent.dto.MsgRequestDTO;
import com.ga.gaent.service.MsgService;
import com.ga.gaent.util.FileUploadSetting;
import com.ga.gaent.util.TeamColor;
import com.ga.gaent.vo.MsgVO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/msg")
public class MsgController {
    @Autowired MsgService msgService;
    
    // 세션에서 로그인한사람의 empCode추출
    private String getEmpCode(HttpSession session) {
        Map<String, Object> loginInfo = (Map<String, Object>) (session.getAttribute("loginInfo"));
        return (String) loginInfo.get("empCode");
    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 12.
     * Description : 모든 쪽지 리스트 호출
     */
    @GetMapping("/{request}")
    String selectMsgList(
            HttpSession session, Model model,
            @PathVariable(name = "request", required = false) Integer request, 
            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(name = "searchMsg", defaultValue = "") String searchMsg) {
        
        if(request != 0 && request != 1 && request != 2 && request != 3 && request != 4 ) {
          return "/msg/msgFail";
        }
        
        String empCode = getEmpCode(session);
        
        // 리스트가져오기
        List<MsgDTO> list = msgService.getMsgList(empCode, request, currentPage, searchMsg);
        // 페이징에 필요한 요소 가져오기
        Map<String, Object> pagingMap = msgService.getPagingIdx(empCode, request, currentPage, searchMsg);


        model.addAttribute("list", list);
        model.addAttribute("pg", pagingMap);

        if(request == 0) {// 전체
            return "/msg/msgList";
        } else if (request == 1) { // 받은쪽지함
            return "/msg/msgReceiveList";
        } else if (request == 2) { // 보낸쪽지함
            return "/msg/msgSendList";
        } else if (request == 3) { // 내게쓴쪽지함
            return "/msg/msgSelf";
        } else if (request == 4) { // 휴지통
            return "/msg/msgBin";
        } else { 
            return "/msg/msgFail";
        }
    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 13.
     * Description : Ajax를 이용해 메시지 전송
     */
    @PostMapping("/sendMessage")
    @ResponseBody
    public String sendMsg(
            @Valid MsgRequestDTO m,
            Errors errors,
            FileReqDTO fileReqDTO) {
        
        int sendMsgResult = -1;
        log.debug(TeamColor.RED + "확인 : " + m.getMsgTitle() + TeamColor.RESET);
        log.debug(TeamColor.YELLOW + "원본이름 :" + fileReqDTO.getGaFile() + TeamColor.RESET);

        // 파일을 업로드 했을 시에만 동작
        if (!fileReqDTO.getGaFile().isEmpty()) {
            // 파일 확장자 확인
            fileReqDTO.validateFileType();
        }
        System.out.println("에러: "+errors.toString());
        if (errors.hasErrors()) {
            // 오류가 있을 경우 오류 메시지들을 리스트로 반환
            for(FieldError e : errors.getFieldErrors()) {
                // 에러가 발생한 form 필드 name
                log.debug(TeamColor.RED_BG + "에러필드: "+ e.getField() + TeamColor.RESET);
                log.debug(TeamColor.RED_BG + "에러메시지: "+ e.getDefaultMessage() + TeamColor.RESET);
                return e.getDefaultMessage();
            }
        }
        
        // 쪽지전송
        sendMsgResult = msgService.sendMsg(m, fileReqDTO);

        if(sendMsgResult == 1) {
            return "1";
        }else {
            return "-1";
        }
        
    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 13.
     * Description : Ajax를 이용해 메시지 상태 변경(삭제,복원)
     */
    @PostMapping("/modifyMsgStatus")
    @ResponseBody
    public int modifyMsgStatus(
            HttpSession session,
            @RequestParam(name = "request") String request, 
            @RequestParam(name = "msgNums", required = false) String[] msgNums) {
        String empCode = getEmpCode(session);
        
        // 배열의 내용을 보기 위해 Arrays.toString()을 사용
        log.debug(TeamColor.YELLOW + "(컨)번호: " + Arrays.toString(msgNums) + " request: " + request + TeamColor.RESET);
        log.debug(TeamColor.YELLOW + "개수 " + msgNums.length + TeamColor.RESET);

        int result = 0;
        Map<String, Object> deleteMsgMap = new HashMap<>();
        for (String no : msgNums) {
            deleteMsgMap.put("empCode", empCode);
            deleteMsgMap.put("request", request);
            deleteMsgMap.put("msgNum", no); // 여기서 msgNum을 각각의 no로 수정합니다.
            result = result + msgService.modifyMsgState(deleteMsgMap);
        }

        log.debug(TeamColor.RED + "result: " + result + TeamColor.RESET);
        if (msgNums.length == result) {
            return 1;
        } else {
            return 0;
        }

    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 15
     * Description : 메시지 상세보기
     */
    @GetMapping("/msgDetail/{msgNum}")
    public String msgDetail(
            HttpSession session, Model model, 
            @PathVariable(name = "msgNum", required = false) String msgNum) {
        
        String empCode = getEmpCode(session);

        MsgDTO msgDetail = msgService.msgDetail(msgNum, empCode);
        
        // 뎨이터가 없을시 fail페이지로 이동
        if(msgDetail == null) {
            log.debug(TeamColor.YELLOW + "데이터 없음 " + TeamColor.RESET);
            return "/msg/msg-error";
        }
        
        model.addAttribute("m", msgDetail);
        return "/msg/msgDetail";
    }

    /*
     * @author : 조인환
     * @since : 2024. 07. 14.
     * Description : Ajax를 이용해 안읽은 메시지 수 확인
     */
    @GetMapping("/msgNotReadCnt")
    @ResponseBody
    public int msgNotReadCnt(HttpSession session) {
        String empCode = getEmpCode(session);
        return msgService.msgNotReadCnt(empCode);
    }


    /*
     * @author : 조인환
     * @since : 2024. 07. 13.
     * Description : Ajax를 이용해 메시지 읽기 처리
     */
    @PostMapping("/readMsg")
    @ResponseBody
    public int readMsg(
            HttpSession session, 
            @RequestParam(name = "msgNums", required = false) String[] msgNums) {
        
        String empCode = getEmpCode(session);
        // 배열의 내용을 보기 위해 Arrays.toString()을 사용합니다.
        log.debug(TeamColor.YELLOW + "번호: " + Arrays.toString(msgNums) + TeamColor.RESET);
        log.debug(TeamColor.YELLOW + "개수 " + msgNums.length + TeamColor.RESET);

        int result = 0;
        for (String no : msgNums) {
            result = result + msgService.readMsg(empCode, no);
        }

        log.debug(TeamColor.RED + "result: " + result + TeamColor.RESET);

        return result;
    }
    
    
    /*
     * @author : 조인환
     * @since : 2024. 07. 26.
     * Description : 쪽지를 보낼 때 받는 이 검색
     */
    @PostMapping("/searchEmpCode")
    @ResponseBody
    public List<Map<String,Object>> searchEmpCode(@RequestParam String empName) {
        
        return msgService.searchEmpCode(empName);
    }
}


