<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous"/>
<!-- 조직도 관련 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css"/>
<style>
  .scroll {
    width: 16rem !important;
    height: 30rem !important;
    overflow-x: hidden;
    overflow-y: auto;
  }
</style>
<body>
  <aside id="layout-menu" class="layout-sub-menu menu-vertical menu bg-sub-menu-theme subside-nav">
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-3">
      <li class="menu-item">
        <div class="menu-link d-flex flex-column align-items-start">
          <span class="display-6 fw-semibold mb-0">부서근태현황</span>
        </div>
      </li>
     
      <li class="menu-item scroll">
        <div class="menu-link">
          <!-- 조직도 시작 -->
          <div id="orgChart"></div>
          <!-- 조직도 끝 -->
        </div>
      </li>
    </ul>
  </aside>
  
  <!-- 조직도 자바스크립트 -->
  <script type="text/javascript">
  $(function() {
      $('#orgChart').jstree({
        'core' : {
          'data' : {
            'url' : '/gaent/hr/tree',
            'dataType' : 'json'
          },
          'themes' : {
            'icons' : true,
            'dots' : true,
            'responsive' : true
          },
          'expand_all' : true,
        },
        'plugins' : [ 'themes', 'json_data', 'state' ]
      });

      $('#orgChart').on('select_node.jstree', function(e, data) {
          e.preventDefault(); // 기본 이벤트 동작 막기
          
          let nodeId = data.node.id;
          // nodeId 값의 길이 체크
          if (nodeId.length >= 4) {
            // nodeId 값이 4자리 이상일 경우 다른 경로로 이동
           alert('팀을 선택해주세요');
          } else {
            // nodeId 값이 4자리 미만일 경우 기존 경로로 이동
            window.location.href = '/gaent/team/atd?teamCode=' + nodeId;
          }
          
          // 선택된 노드 해제
          $('#orgChart').jstree(true).deselect_node(nodeId);
        });
      });
  </script>
</body>