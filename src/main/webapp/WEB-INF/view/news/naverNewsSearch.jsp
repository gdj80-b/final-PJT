<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>네이버 뉴스</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.newsSearchResult p{
    font-size:12px;
}
</style>
</head>
<body>
    <div class="card-bodyj">
        <h3 class="card-title">네이버 뉴스 검색</h3>
        <form id="searchForm">
            <input type="text" id="searchQuery" name="searchQuery" placeholder="검색어를 입력하세요" value="엔터">
            <button id="naverNewsSearchBtn" type="submit">검색</button>
        </form>
        <div id="searchResults" class="card-text newsSearchResult"></div>
    </div>    

    <script>
        $(document).ready(function() {
            // 페이지 로드 시 기본값인 '엔터'로 검색 결과 표시
            performSearch('엔터');
            
            // 검색 폼 제출 시 AJAX를 통해 검색 요청
            $('#searchForm').submit(function(event) {
                event.preventDefault();
                let searchQuery = $('#searchQuery').val();
                performSearch(searchQuery);
            });
        });

        // 검색 API 호출 및 결과 표시
        function performSearch(query) {
            $.ajax({
                type: "GET",
                url: "/gaent/api/naverSearch?id=" + query,
                success: function(data) {
                    displayResults(data);
                    console.log(data);
                },
                error: function() {
                    alert('검색에 실패했습니다.');
                }
            });
        }

        // 검색 결과를 화면에 출력
        function displayResults(data) {
            let results = JSON.parse(data);
            let resultDiv = $('#searchResults');
            resultDiv.empty();
            if (results.hasOwnProperty('items')) {
                let items = results.items;
                items.forEach(function(item) {
                    let title = '<p><b><a href="' + item.link + '">' + item.title + '</a></b></p>';
                 	// 원본 item.description에서 앞 40글자를 가져와서 "..."을 붙여 출력
                    let trimmedDescription = item.description.substring(0, 40) + (item.description.length > 40 ? "..." : "");
                    let description = '<p>' + trimmedDescription + '</p>';
                    let hr = '<hr>';
                    resultDiv.append(title + description + hr);
                });
            } else {
                resultDiv.append('<p>검색 결과가 없습니다.</p>');
            }
        }
    </script>
</body>
</html>

