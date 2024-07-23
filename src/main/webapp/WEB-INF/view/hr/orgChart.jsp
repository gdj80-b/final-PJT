<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>조직도</title>
    <!-- jstree 관련 스타일시트 및 스크립트 로드 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
  </head>
  <body>
    <h1>조직도</h1>
    <div id="orgChart"></div>
    <!-- 모달창 -->
    <div class="modal fade" id="nodeModal" tabindex="-1" role="dialog" aria-labelledby="nodeModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="nodeModalLabel">조직도 항목 상세 정보</h4>
          </div>
          <div class="modal-body">
            <p><strong>ID:</strong> <span id="nodeId"></span></p>
            <p><strong>이름:</strong> <span id="nodeName"></span></p>
            <!-- 추가적인 필드들을 원하는 만큼 여기에 추가 -->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      $(function() {
        // jstree 초기화
        $('#orgChart').jstree({
          'core': {
            'data': {
              'url': '/gaent/hr/tree',
              'dataType': 'json'
            },
            'expand_all': true // 모든 노드를 초기에 확장
          },
          'plugins': ['state' , 'json_data']
        });
            
        // 항목 클릭 시 모달창 열기
        $('#orgChart').on('select_node.jstree', function(e, data) {
          let node = data.node;
          $('#nodeId').text(node.id);
          $('#nodeName').text(node.text);
          $('#nodeModal').modal('show');
        });
      });
    </script>
  </body>
</html>