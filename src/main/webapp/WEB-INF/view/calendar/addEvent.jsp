<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정등록 - GAEnt.</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css" />
    <script>
    // 일정타입에 따른 일정분류 옵션 설정
    const categoryOptions = {
        "personal": [{value: "${loginInfo.empCode}", text: "개인"}],
        "team": [{value: "${loginInfo.teamCode}", text: "${loginInfo.teamName}"}],
        "company": [{value: "10", text: "전사"}],
        "artist": [{value: "900", text: "아티스트"}]
    };

    function updateCategoryOptions() {
        const calTypeSelect = document.getElementById('calType');
        const calTargetTypeSelect = document.getElementById('calTargetType');
        const selectedType = calTypeSelect.value;
        
        // 일정분류 옵션 초기화
        calTargetTypeSelect.innerHTML = '';
        
        // 새 옵션 추가
        const options = categoryOptions[selectedType] || [];
        options.forEach(option => {
            const opt = document.createElement('option');
            opt.value = option.value;
            opt.textContent = option.text;
            calTargetTypeSelect.appendChild(opt);
        });
    }
	
    // 유효성 검사
    function validateForm() {
        var type = document.getElementById('calType').value.trim();
        var title = document.getElementById('calTitle').value.trim();
        var content = document.getElementById('calContent').value.trim();
        var startDate = document.getElementById('calStartDate').value.trim();
        var endDate = document.getElementById('calEndDate').value.trim();
        if (type === '') {
            alert('일정타입이 선택되지 않았습니다');
            return false;
        }
        
        if (title === '') {
            alert('제목이 입력되지 않았습니다');
            return false;
        }
        
        if (content === '') {
            alert('내용이 입력되지 않았습니다');
            return false;
        }
        
        if (startDate === '') {
            alert('일정시작일이 입력되지 않았습니다');
            return false;
        }
        
        if (endDate === '') {
            alert('일정종료일이 입력되지 않았습니다');
            return false;
        }
        
        var startDateTime = new Date(startDate);
        var endDateTime = new Date(endDate);
        
        // 일정비교
        if (endDateTime <= startDateTime) {
            alert('일정 종료일은 시작일 이후로 지정해야 합니다');
            return false;
        }
        
        return true;
    }
    </script>
</head>
<body>
    <div id="">
        <div id="header-area">
            <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
        </div>
        <div id="sidebar_area">
            <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
            <jsp:include page="/WEB-INF/view/calendar/cal-sub-sidebar.jsp"></jsp:include>
        </div>
        <div id="workspace-area" class="subsidebar-from-workspace">
            <h5 class="fs-4 fw-semibold mb-2">일정등록</h5>
            <hr />
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="/gaent/calendar/addEvent" method="post" onsubmit="return validateForm()">
                            <div class="mb-3">
                                <input type="hidden" name="calWriter" value="${loginInfo.empCode}">
                                <label for="calType" class="form-label">일정타입</label>
                                <c:if test="${loginInfo.rankCode == 1}">
	                                <select name="calType" id="calType" class="form-select" onchange="updateCategoryOptions()">
	                                    <option value="">-- 선택하세요 --</option>
	                                    <option value="personal">개인일정</option>
	                                    <option value="company">전사일정</option>
	                                    <option value="artist">아티스트일정</option>
	                                </select>
                                </c:if>
                                <c:if test="${loginInfo.rankCode == 2 || loginInfo.rankCode == 3}">
	                                <select name="calType" id="calType" class="form-select" onchange="updateCategoryOptions()">
	                                    <option value="">-- 선택하세요 --</option>
	                                    <option value="personal">개인일정</option>
	                                    <option value="team">팀일정</option>
	                                    <option value="company">전사일정</option>
	                                    <option value="artist">아티스트일정</option>
	                                </select>
                                </c:if>
                                <c:if test="${loginInfo.rankCode == 4}">
	                                <select name="calType" id="calType" class="form-select" onchange="updateCategoryOptions()">
	                                    <option value="">-- 선택하세요 --</option>
	                                    <option value="personal">개인일정</option>
	                                    <option value="team">팀일정</option>
	                                </select>
                                </c:if>
                                <c:if test="${loginInfo.rankCode == 5}">
	                                <select name="calType" id="calType" class="form-select" onchange="updateCategoryOptions()">
	                                    <option value="">-- 선택하세요 --</option>
	                                    <option value="personal">개인일정</option>
	                                </select>
                                </c:if>
                            </div>
                            <div class="mb-3">
                                <label for="calTargetType" class="form-label">일정분류</label>
                                <select name="calTargetType" id="calTargetType" class="form-select">
                                    <!-- 동적으로 옵션 추가 -->
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="calTitle" class="form-label">제목</label>
                                <input name="calTitle" id="calTitle" class="form-control" type="text" placeholder="제목을 입력해주세요.">
                            </div>
                            <div class="mb-3">
                                <label for="calContent" class="form-label">내용</label>
                                <input name="calContent" id="calContent" class="form-control" type="text" placeholder="내용을 입력해주세요.">
                            </div>
                            <div class="mb-3">
                                <label for="calStartDate" class="form-label">시작시간</label>
                                <input name="calStartDate" class="form-control" type="datetime-local" id="calStartDate">
                            </div>
                            <div class="mb-3">
                                <label for="calEndDate" class="form-label">종료시간</label>
                                <input name="calEndDate" class="form-control" type="datetime-local" id="calEndDate">
                            </div>
                            <button type="submit" class="btn btn-primary">등록</button>
                            <a href="/gaent/calendar" class="btn btn-secondary">취소</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>