<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .news-card {
        width: 34rem;
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
    </style>
  </head>
  <body>
    <div class="news-card">
      <div class="card">
        <div class="card-body">
          <div class="d-flex align-items-center justify-content-between">
            <div class="card-header">
              <h4 class="card-title">네이버 뉴스</h4>
            </div>
            <form id="searchForm">
              <div class="input-group">
                <input
                  class="form-control from-control-sm"
                  type="text"
                  id="searchQuery"
                  name="searchQuery"
                  placeholder="검색어를 입력하세요"
                  value="엔터"
                />
                <button
                  class="btn btn-outline-primary"
                  id="naverNewsSearchBtn"
                  type="submit"
                >
                  검색
                </button>
              </div>
            </form>
          </div>
          <hr />
          <div id="searchResults" class="card-text news-search-result"></div>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function () {
        // 페이지 로드 시 기본값인 '엔터'로 검색 결과 표시
        performSearch('엔터');

        // 검색 폼 제출 시 AJAX를 통해 검색 요청
        $('#searchForm').submit(function (event) {
          event.preventDefault();
          let searchQuery = $('#searchQuery').val();
          performSearch(searchQuery);
        });
      });

      // 검색 API 호출 및 결과 표시
      function performSearch(query) {
        $.ajax({
          type: 'GET',
          url: '/gaent/api/naverSearch?id=' + query,
          success: function (data) {
            displayResults(data);
          },
          error: function () {
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
          items.forEach(function (item) {
            let title =
              '<p class="news-title"><b><a href="' +
              item.link +
              '">' +
              item.title +
              '</a></b></p>';
            // 원본 item.description에서 앞 40글자를 가져와서 "..."을 붙여 출력
            let trimmedDescription =
              item.description.substring(0, 56) +
              (item.description.length > 40 ? '...' : '');
            let description =
              '<p class="news-desc">' + trimmedDescription + '</p>';
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
