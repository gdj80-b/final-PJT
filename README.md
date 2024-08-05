# GAEnt. 전자결재시스템 그룹웨어
# :runner: 멤버 구성
팀장 : 정건희<br>
팀원 : 김형호, 조인환<br>
<br>

# :computer: 개요
- 2024-06-27 ~ 2024-08-08
- Spring/MVC 방식을 사용한 전자결재시스템 그룹웨어 구현
- 2차 팀 프로젝트
<br>

# 🛠️ 개발 환경
- Language : HTML5, CSS3, Java, SQL, JavaScript, Ajax
- Framework : SpringBoot
- Library : JSTL, JQuery, Lombok, MyBatis, Maven, BootStrap
- Open API : FullCalendar, jsTree
- Database : MariaDB
- WAS Apache : Tomcat10
- OS : window10
- TOOL : Spring-Tool-Suite4, HeidiSQL, Github Desktop
- Collaborative Tool : Notion
<br>

# :camera: 화면구성
<p align="center">
  <img src="https://github.com/user-attachments/assets/c137f95e-383b-4564-bfa0-09e8dd3f3b19" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/573f999c-4f9b-4acb-b075-07828184116f" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/03d2189a-20e9-4cfb-979d-d7a1817ca54b" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/3e0738fe-d24a-44ee-a3c4-5d1f762a8447" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/6a6c4ac1-2cc3-4be8-9a97-a5ed4d775f97" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/9c6e7e72-c8e9-4586-9db4-bce8a82dc9a7" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/ef2a8182-2443-4335-82a0-3edca744c00a" width="800" height="400">
  <img src="https://github.com/user-attachments/assets/e5013d67-ef1d-4eab-bf29-db871372aabf" width="800" height="400">
</p>
<br>

# :pushpin: 주요 기능
#### [ 정건희 ]
- 담당기능
  - 담당 세부 기능
- 담당기능
  - 담당 세부 기능
- 담당기능
  - 담당 세부 기능
 
<br>

#### [ 김형호 ]
- 캘린더
  - FullCalendar API를 사용한 캘린더 구현
  - 개인, 팀, 전사, 아티스트 4개 카테고리에 대한 일정 조회 구현
  - 기본 일정 등록 및 캘린더 날짜를 선택하여 일정을 등록할 수 있도록 구현
  - 일정타입, 제목, 내용, 일정시작일 및 종료일에 대한 Validation 적용
  - 모달을 사용한 일정 상세 조회 및 일정 수정 기능 구현
  - 일정 삭제 기능 및 삭제 확인 메시지 구현
  - 버튼을 사용한 카테고리별 일정 필터링 기능 구현
- 조직도
  - jsTree API를 사용한 그룹 조직도 구현
  - 부서, 팀, 직원의 정보를 DB에서 동적으로 가져와 표현하도록 구현
  - 노드 클릭 시 해당하는 노드 정보의 상세 페이지로 이동 하도록 구현
  - 그룹(부서, 팀)과 직원을 구분하기 위해 아이콘 스타일 적용
- 직원조회
  - 직원 리스트를 통한 기능 직원조회 구현
  - 직원 이름 검색을 통해 직원을 조회할 수 있도록 구현
  - 사이드바의 조직도를 통한 그룹 및 직원 상세 페이지 조회 구현
  - 직원 리스트에서 직원의 이름을 클릭하여 직원 상세 페이지로 이동하도록 구현
- 인사관리
  - 부서 및 팀 등록 기능 구현
  - 그룹코드 중복검사와 관련한 유효성 검사 기능 구현
  - 모달을 통한 부서 및 팀 수정, 삭제 기능 구현
  - 사이드바의 조직도를 통한 그룹 및 직원 상세 페이지 조회 구현

<br>

#### [ 조인환 ]
- 쪽지함
  - 쪽지 조회(전체,받은,수신,내게쓰기,휴지통)
  - 쪽지 전송
      - AJAX를 이용하여 모달로 쪽지 전송(일반,내게쓰기,답장) 구현
      - 파일 첨부 기능 구현( txt, img, pdf 확장자만 전송 가능하도록 설정)
      - 모든 항목에 Validation 적용
      - 직원 이름 검색으로 수신자 선택 구현
  - 쪽지 상세 조회 시 읽기처리
  - 쪽지 일괄 삭제,복원 구현
  - 쪽지 검색 및 페이징 구현
  - 스케줄러 이용 수&발신자 모두 삭제한 메시지 영구 삭제 구현
- 근태관리
  - AJAX를 이용하여 출근,퇴근 등록 및 출퇴근 버튼 상태 변경
  - 월별 출퇴근 현황 조회(Collapse형태로 조회)
  - 휴가 이력 조회
  - 주 단위의 부서별 근태 현황 조회
  - Chart.JS를 이용한 부서별 근태현황 차트 구현
  - 스케줄러 이용 최종승인된 휴가문서 개인일정으로 자동 등록 구현
- 홈 화면
  - 네이버 뉴스API 활용 뉴스 검색 기능 구현
  - 검색어 Validation 처리, 페이징 구현
- 전자결재
  - 기안서,휴가신청서,지출결의서,경조사,보고서 입력 구현
  - 결재 대기,진행,내역 리스트 조회
  - 개인 대기,승인,반려 리스트 조회
  - 각 타입의 문서 상세보기 구현
  - 문서 승인,반려 처리 구현
