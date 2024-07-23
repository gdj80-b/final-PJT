<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .profile-card {
        width: 14rem;
        height: 10rem;
      }

      .img-preview {
        width: 6rem;
        height: 8rem;
        background-color: #f0f0f0;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd;
        margin-bottom: 10px;
        overflow: hidden;
      }

      .img-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
  </head>
  <body>
    <div class="profile-card">
      <div class="card">
        <div class="card-body">
          <table class="table mypage-table">
            <tr>
              <td>
                <div class="img-preview">
                  <img
                    src="${pageContext.request.contextPath}/upload/profile/thumbs.jpeg"
                  />
                </div>
              </td>
            </tr>
            <tr>
              <td><span id="myPageTeamName"></span></td>
            </tr>
            <tr>
              <td>
                <span id="myPageKorName"></span>
                <span id="myPageRankName"></span>
              </td>
            </tr>
            <tr>
              <td><span id="myPageEmpId"></span></td>
            </tr>
            <tr>
              <td><span id="myPagePhone"></span></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <script></script>
  </body>
</html>
