<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>인사관리 - GAEnt.</title>
        <!-- 부트스트랩 JS 및 jQuery (필수) -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
        <!-- 부트스트랩 CSS -->
        <!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/workspace.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pyramid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hr.css" />
        <style>
            .tree {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            
            .tree ul {
                padding-left: 20px;
            }
            
            .tree li {
                list-style-type: none;
                margin-bottom: 10px;
            }
            
            .tree a {
                text-decoration: none;
                color: black;
            }
            
            .orgChartSpace {
                margin-bottom: 80px;
            }
        </style>
    </head>
    <body>
        <div id="">
            <div id="header-area">
                <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
            </div>
            <div id="sidebar_area">
                <jsp:include page="/WEB-INF/view/common/sidebar.jsp"></jsp:include>
                <jsp:include page="/WEB-INF/view/hr/hr-sub-sidebar.jsp"></jsp:include>
            </div>
            <div id="workspace-area" class="subsidebar-from-workspace">
                <!-- 피라미드 구조 조직도 시작 -->
                <div class="orgChartSpace"></div>
                <div class="tree" id="orgChart">
                <!-- 조직도 생성 공간 -->
                </div>
                <!-- 피라미드 구조 조직도 끝 -->
                <div>
                    <c:forEach var="t" items="${teamModal}">
                        ${t.id}
                    </c:forEach>
                </div>
            </div>
        </div>
        
        <!-- 그룹 상세 모달창 시작 -->
        <div class="modal fade" id="infoModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">조직정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col mb-3">
                                <label for="nameSmall" class="form-label">부서명</label>
                                <br />
                                <div id="modalTitle">부서명</div>
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-0">
                                <label class="form-label" for="emailSmall">구분코드</label>
                                <br />
                                <div id="modalTeamCode">부서코드</div>
                            </div>
                            <div class="col mb-0">
                                <label for="dobSmall" class="form-label">소속부서</label>
                                <br />
                                <div id="modalParentTeam">소속부서</div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col mb-3">
                                <label for="nameSmall" class="form-label">Responsibilities</label>
                                <br />
                                <div id="modalDescription">담당업무</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 그룹 상세 모달창 끝 -->
        
        <script>
            $(document).ready(function() {
                $.ajax({
                    url : '/gaent/inquiry/getGroupInfo',
                    method : 'GET',
                    success : function(data) {
                        // console.log(data);
                        generateOrgChart(data);
                    },
                    error : function(xhr, status, error) {
                        console.error('조직 데이터를 가져오는 데 실패했습니다:', error);
                    }
                });

                function generateOrgChart(data) {
                    let orgChart = document.getElementById('orgChart');

                    // 데이터를 기반으로 조직도 구성
                    buildHierarchy(orgChart, data, '#'); // 최상위 노드의 parentId는 '#'으로 설정
                }

                function buildHierarchy(parentNode, items, parentId) {
                    let filteredItems = items.filter(function(item) {
                        return item.parentId === parentId;
                    });

                    if (filteredItems.length > 0) {
                        let ul = document.createElement('ul');
                        filteredItems.forEach(function(item) {
                            let li = document.createElement('li');

                            // 노드의 이름을 포함하는 링크 생성
                            let link = document.createElement('a');
                            link.href = '#';
                            link.innerHTML = '<div class="nodeName">' + item.name + '</div><div>' + item.des + '</div>';
                            link.onclick = function() {
                                
                                // 모달에 정보 설정
                                document.getElementById('modalTeamCode').textContent = item.id;
                                document.getElementById('modalTitle').textContent = item.name;
                                document.getElementById('modalDescription').textContent = item.des;

                                // item.parentId 값에 따른 처리
                                let parentTeamElement = document.getElementById('modalParentTeam');
                                if (item.parentId === '#' || item.parentId === '10') {
                                    parentTeamElement.textContent = '-';
                                } else {
                                    let parentItem = items.find(function(parent) {
                                        return parent.id === item.parentId;
                                    });
                                    parentTeamElement.textContent = parentItem ? parentItem.name : 'Unknown';
                                }

                                // 모달 표시
                                $('#infoModal').modal('show');

                                return false; // 링크 기본 동작 방지
                            };
                            li.appendChild(link);

                            ul.appendChild(li);
                            buildHierarchy(li, items, item.id);
                        });
                        parentNode.appendChild(ul);
                    }
                }
            });
        </script>
    </body>
</html>
