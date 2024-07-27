<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>조직도</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pyramid.css">
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
    </style>
</head>
<body>
	<div class="tree" id="orgChart">
	    <!-- 조직도 생성 -->
	</div>

	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $.ajax({
	            url: '/gaent/inquiry/getGroupInfo',
	            method: 'get',
	            success: function(data) {
	                generateOrgChart(data);
	            },
	            error: function(xhr, status, error) {
	                console.error('조직 데이터를 가져오는 데 실패했습니다:', error);
	            }
	        });
	    });
	
	    function generateOrgChart(data) {
	        var orgChart = document.getElementById('orgChart');
	
	        // 데이터를 기반으로 조직도 구성
	        buildHierarchy(orgChart, data, '#'); // 최상위 노드의 parentId는 '#'으로 설정
	    }
	
	    function buildHierarchy(parentNode, items, parentId) {
	        var filteredItems = items.filter(function(item) {
	            return item.parentId === parentId;
	        });
	
	        if (filteredItems.length > 0) {
	            var ul = document.createElement('ul');
	            filteredItems.forEach(function(item) {
	                var li = document.createElement('li');
	                
	                // 노드의 이름을 포함하는 링크 생성
	                var link = document.createElement('a');
	                link.href = '#';
	                link.innerHTML = item.name + '<br><br>' + item.des;
	                li.appendChild(link);
	
	                ul.appendChild(li);
	                buildHierarchy(li, items, item.id);
	            });
	            parentNode.appendChild(ul);
	        }
	    }
	</script>
</body>
</html>