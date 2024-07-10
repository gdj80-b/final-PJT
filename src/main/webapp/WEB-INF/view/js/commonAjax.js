/**
 * @author: 정건희
 * @since: 2024.07.12
 * @description: ajax get 요청에 관한 공통 함수
 */

function getAjax(url, callback) {
    $.ajax({
        url: url,
        // async : true,
        method: "GET",
        dataType: "json",
        data: paramData,
        success: function(data, status, xr) {
            console.log(data);
            return callback(data);
        },
        error: function(xhr, status, error) {
            console.log(error);
            return callback(data);
        }
    });
}

/**
 * @author: 정건희
 * @since: 2024.07.12
 * @description: ajax post 요청에 관한 공통 함수
 */

function postAjax(url, traditional, inData, callback) {
    $.ajax({
        url: url,
        // async : true,
        method: "POST",
        dataType: "json",
        traditional: traditional,
        data: inData,
        success: function(data, status, xr) {
            console.log(data);
            return callback(data);
        },
        error: function(xhr, status, error) {
            console.log(error);
            return callback(data);
        }
    });
}