<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .news-card {
        width: 36rem;
        height: 10rem;
      }

      .news-card hr {
        margin: 0.5rem 0;
      }

      .news-card h4 {
        margin: 0;
      }

      .news-card .card-header {
        padding: 1rem 1rem;
      }

      .news-card .card-body {
        padding: 1rem 1rem;
      }

      .news-card p {
        margin-bottom: 0.05rem;
        padding-left: 0.75rem;
      }

      .news-title {
        font-size: 14px;
      }

      .news-desc {
        font-size: 12px;
      }

      .news-search-result hr {
        margin: 0.5rem 0;
      }
      
      .pagination {
        margin-bottom: 0;
      }
    </style>
  </head>
<body>
    <div class="news-card">
        <div class="card">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="card-header">
                        <h4 class="card-title">뉴스</h4>
                    </div>
                    <form id="searchForm">
                        <div class="input-group">
                            <input class="form-control from-control-sm" type="text" id="searchQuery" name="searchQuery" placeholder="검색어를 입력하세요"/>
                            <button class="btn btn-outline-primary" id="naverNewsSearchBtn" type="submit">검색</button>
                        </div>
                    </form>
                </div>
                <hr />
                <div id="searchResults" class="card-text news-search-result"></div>
                <div class="d-flex justify-content-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li id="prevNewsLi" class="page-item prev" >
                                <button id="prevNewsBtn" class="page-link btn" >
                                    <i class="tf-icon bx bx-chevron-left"></i>
                                </button>
                            </li>
                            <li id="nextNewsLi" class="page-item next">
                                <button id="nextNewsBtn" class="page-link btn btn-outline-primary">
                                    <i class="tf-icon bx bx-chevron-right"></i>
                                </button>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function() {
        let newsCurrentPage = 1;
        let searchQuery = '엔터';  // 첫 검색어
    
        // 페이지 로드 시 기본값인 '엔터'로 검색 결과 표시
        performSearch(searchQuery, newsCurrentPage);
    
        // 검색 폼 제출 시 AJAX를 통해 검색 요청
        $('#searchForm').submit(function(event) {
            event.preventDefault();
            searchQuery = $('#searchQuery').val();  // 전역 변수 업데이트
            newsCurrentPage = 1;  // 검색 시 페이지를 1로 리셋
            performSearch(searchQuery, newsCurrentPage);
            updateNewPagingStates(newsCurrentPage);
        });
    
        $('#prevNewsBtn').click(function(event) {
            event.preventDefault();
            if (newsCurrentPage > 1) {  // 페이지가 1보다 클 때만 이전 페이지로 이동
                newsCurrentPage--;
                performSearch(searchQuery, newsCurrentPage);
                updateNewPagingStates(newsCurrentPage);
            }
        });
    
        $('#nextNewsBtn').click(function(event) {
            event.preventDefault();
            newsCurrentPage++;
            performSearch(searchQuery, newsCurrentPage);
            updateNewPagingStates(newsCurrentPage);
        });
    });
    
    // 검색 API 호출 및 결과 표시
    function performSearch(searchQuery, newsCurrentPage) {
        $.ajax({
            type: 'POST',
            url: '/gaent/api/naverSearch',
            data: {
                naverSearch: searchQuery,
                page: newsCurrentPage
            },
            success: function(data) {
                displayResults(data);
                updateNewPagingStates(newsCurrentPage);
            },
            error: function() {
                alert('검색에 실패했습니다.');
            },
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
                let title = '<p class="news-title"><b><a href="' + item.link + '">' + item.title + '</a></b></p>';
                // 원본 item.description에서 앞 45글자를 가져와서 "..."을 붙여 출력
                let trimmedDescription = item.description.substring(0, 45) + (item.description.length > 45 ? '...' : '');
                let description = '<p class="news-desc">' + trimmedDescription + '</p>';
                let hr = '<hr>';
                resultDiv.append(title + description + hr);
            });
        } else {
            resultDiv.append('<p>검색 결과가 없습니다.</p>');
        }
    }
    
    // 버튼 상태 업데이트
    function updateNewPagingStates(newsCurrentPage) {
        if (newsCurrentPage <= 1) {
            $('#prevNewsLi').addClass('disabled');
        } else {
            $('#prevNewsLi').removeClass('disabled');
            $('#prevNewsBtn').addClass('btn-outline-primary');
        }
    }
</script>
</body>
</html>
