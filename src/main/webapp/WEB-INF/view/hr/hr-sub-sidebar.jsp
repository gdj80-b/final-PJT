<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous"/>
<!-- 조직도 관련 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css"/>
<body>
    <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav sub-sidebar">
        <div class="menu-inner-shadow"></div>
        <ul class="menu-inner pt-3">
            <li class="menu-item-scroll menu-shadow">
                <div class="menu-link">
                    <span class="display-6 fw-semibold mb-0">인사관리</span>
                </div>
                <ul class="menu-item">
                    <li class="menu-item">
                        <a href="/gaent/hr" class="menu-link"><span>인사관리 홈</span></a>
                    </li>
                </ul>
            </li>
            <div class="scroll">
                <!-- 조직도 시작 -->
                <div id="orgChart"></div>
                <!-- 조직도 끝 -->
            </div>
        </ul>
    </aside>
  
    <!-- 조직도 자바스크립트 -->
    <script type="text/javascript">
        $(function() {
            $('#orgChart').jstree({
                'core': {
                    'data': {
                        'url': '/gaent/hr/tree',
                        'dataType': 'json'
                    },
                    'themes': {
                        'icons': true,
                        'dots': true,
                        'responsive': true
                    },
                    'expand_all': true,
                },
                'plugins': [ 'themes', 'json_data', 'state' ]
            });

            $('#orgChart').on('select_node.jstree', function(e, data) {
                e.preventDefault();
                
                let nodeId = data.node.id;
                let empCode = null;
                let teamCode = null;
                let deptCode = null;
                
                if(nodeId.length >= 4) {
                    empCode = data.node.id;
                    window.location.href = '/gaent/hr/empDetail/' + empCode;
                } else if(nodeId[1] == 0) {
                    deptCode = data.node.id;
                    if(deptCode == 10){
                        window.location.href = '/gaent/hr';
                    }else{                        
                    	window.location.href = '/gaent/hr/deptDetail?teamCode=' + deptCode + "&currentPage=1&rowPerPage=5";
                    }
                } else {
                    teamCode = data.node.id;
                    window.location.href = '/gaent/hr/teamDetail?teamCode=' + teamCode + "&currentPage=1&rowPerPage=5";
                }

                $('#orgChart').jstree(true).deselect_node(nodeId);
            });
        });
    </script>
</body>