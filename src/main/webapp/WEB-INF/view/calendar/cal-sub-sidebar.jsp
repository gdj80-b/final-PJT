<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/assets/css/sidebar.css"
/>
<style>
	.btn {
	width: 120px;
	}
	
	.artist {
	border: 1px solid #f792a4;
	color: #f792a4;
	}
	
	.artist:hover{
	background-color: #f792a4;
	border: 1px solid #f792a4;
	}
</style>
<body>
  <aside
    id="layout-menu"
    class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav"
  >
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item">
        <a href="/gaent/calendar" class="menu-link">
          <span>메인화면</span>
        </a>
      </li>
      <li class="menu-item">
          <span class="menu-link">일정필터</span>
        <span class="menu-link">
        	<button type="button" class="btn btn-outline-primary" id=allEventBtn>전체</button>
        </span>
        <span class="menu-link">
        	<button type="button" class="btn btn-outline-info personal" id="personalEventBtn">개인일정</button>
        </span>
        <span class="menu-link">
        	<button type="button" class="btn btn-outline-warning" id="teamEventBtn">팀일정</button>
        </span>
        <span class="menu-link">
        	<button type="button" class="btn btn-outline-success" id="companyEventBtn">전사일정</button>
        </span>
        <span class="menu-link">
        	<button type="button" class="btn btn-outline-danger artist" id="artistEventBtn">아티스트</button>
        </span>
      </li>
    </ul>
  </aside>
  
  <script>
        $(document).ready(function() {
            function updateCalendar(filter, empCode, teamCode) {
                $.ajax({
                    url: '/gaent/calendar/event',
                    method: 'get',
                    data: {
                        filter: filter,
                        empCode: empCode,
                        teamCode: teamCode
                    },
                    success: function(data) {
                        // Ensure `calendar` is available
                        if (window.calendar) {
                            // Remove existing events
                            window.calendar.getEvents().forEach(function(event) {
                                event.remove();
                            });
                            // Add new events
                            window.calendar.addEventSource(data);
                        } else {
                            console.error('Calendar is not initialized');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('일정 필터링 실패:', error);
                    }
                });
            }

            $('#allEventBtn').on('click', function() {
                var empCode = '${loginInfo.empCode}';
                var teamCode = '${loginInfo.teamCode}';
                updateCalendar('all', empCode, teamCode);
            });

            $('#personalEventBtn').on('click', function() {
                var empCode = '${loginInfo.empCode}';
                var teamCode = '${loginInfo.teamCode}';
                updateCalendar('personal', empCode, teamCode);
            });

            $('#teamEventBtn').on('click', function() {
                var empCode = '${loginInfo.empCode}';
                var teamCode = '${loginInfo.teamCode}';
                updateCalendar('team', empCode, teamCode);
            });

            $('#companyEventBtn').on('click', function() {
                updateCalendar('company');
            });

            $('#artistEventBtn').on('click', function() {
                updateCalendar('artist');
            });
        });
    </script>
</body>