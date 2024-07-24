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
        <div class="menu-link">
          <span class="display-6 fw-semibold mb-0">인사관리</span>
        </div>
      </li>
      <li class="menu-item">
        <div class="menu-link">
          <a href="/gaent/hr/addTeam" class="btn btn-primary"><span>부서등록</span></a>
        </div>
      </li>
      <li class="menu-item">
        <div class="menu-link">
          <a href="/gaent/hr/addEmp" class="btn btn-primary"><span>직원등록</span></a>
        </div>
      </li>
      <li class="menu-item"><a href="/gaent/hr/empList" class="menu-link"><span>인사현황</span></a></li>
      <li class="menu-item"><a href="/gaent/hr/teamList" class="menu-link"><span>부서현황</span></a></li>
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
      // jstree 초기화
      $('#orgChart').jstree({
        'core' : {
          'data' : {
            'url' : '/gaent/hr/tree',
            'dataType' : 'json'
          },
          'themes' : {
            'icons' : true, // 아이콘 사용 여부
            'dots' : true, // 점 표시 사용 여부
            'responsive' : true
          },
          'expand_all' : true, // 모든 노드를 초기에 확장
        },
        'plugins' : [ 'themes', 'json_data', 'state' ]
      })

      // 항목 클릭 시 모달창 열기
      $('#orgChart').on('select_node.jstree', function(e, data) {
        let node = data.node;
        $('#nodeId').text(node.id);
        $('#nodeName').text(node.text);

        // 부모 노드 정보 가져오기
        let parentNode = $('#orgChart').jstree(true).get_node(node.parent);
        if (parentNode) {
          $('#parentNode').text(parentNode.text);
        } else {
          $('#parentNode').text('없음');
        }
        $('#nodeModal').modal('show');
      });

      // 외부 클릭 시 처리
      $(document).on('click', function(event) {
        // 클릭된 요소가 orgChart 내의 요소인지 확인
        if (!$(event.target).closest('#orgChart').length) {
          // 클릭된 요소가 orgChart 내의 요소가 아니면 선택 해제
          deselectNode();
        }
      });

      // 선택 해제 함수
      function deselectNode() {
        $('#orgChart').jstree(true).deselect_all();
      }
    });
  </script>
  
  <!-- 조직도 모달창 -->
  <div class="modal fade" id="nodeModal" tabindex="-1" role="dialog" aria-labelledby="nodeModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="nodeModal">상세정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col mb-3">
              <label for="nameSmall" class="form-label">이름</label>
              <p><span id="nodeName"></span></p>
            </div>
          </div>
          <div class="row g-2">
            <div class="col mb-0">
              <label class="form-label" for="emailSmall">구분코드</label>
              <p><span id="nodeId"></span></p>
            </div>
            <div class="col mb-0">
              <label for="dobSmall" class="form-label">소속그룹</label>
              <p><span id="parentNode"></span></p>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">수정</button>
        </div>
      </div>
    </div>
  </div>
</body>