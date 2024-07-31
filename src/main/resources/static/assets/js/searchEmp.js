document.addEventListener('DOMContentLoaded', function() {
    let searchEmpCode = document.getElementById('searchEmpCode');
    let resultEmpCode = document.getElementById('resultEmpCode');
    let receiverName = document.getElementById('receiverName');
    let receiver = document.getElementById('receiver');
    let submitButton = document.getElementById('submitButton');

    // 검색창에 입력할 때마다 검색 결과 업데이트
    searchEmpCode.addEventListener('keyup', function() {
        let searchText = this.value; // 입력된 검색어 가져오기
        if (searchText.length >= 2) {
            let xhr = new XMLHttpRequest();
            xhr.open('POST', '/gaent/msg/searchEmpCode', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    resultEmpCode.innerHTML = ''; // 기존 옵션 모두 제거
                    resultEmpCode.style.display = 'block'; // 검색 결과 보이기
                    let defaultOption = document.createElement('option');
                    defaultOption.value = '';
                    defaultOption.textContent = '선택하세요';
                    resultEmpCode.appendChild(defaultOption);
                    let response = JSON.parse(xhr.responseText);
                    response.forEach(function(item) {
                        let option = document.createElement('option');
                        option.value = item.empCode;
                        option.textContent = item.empName;
                        resultEmpCode.appendChild(option); // 검색 결과 옵션 추가
                    });
                } else if (xhr.status !== 200) {
                    console.error('검색 중 오류가 발생했습니다.');
                }
            };
            xhr.send('empName=' + searchText); // 서버에 전달할 데이터
        } else {
            resultEmpCode.style.display = 'none'; // 입력이 부족하면 검색 결과 숨기기
        }
    });

    // select 요소에서 옵션 선택 시 처리
    resultEmpCode.addEventListener('change', function() {
        let selectedEmpCode = this.value; // 선택된 직원 코드 가져오기
        let selectedEmpName = resultEmpCode.options[resultEmpCode.selectedIndex].text; // 선택된 직원 이름 가져오기
        receiverName.value = selectedEmpName; // 선택된 직원 이름을 receiverName input 요소에 설정
        receiver.value = selectedEmpCode; // 선택된 직원 코드를 receiver input 요소에 설정
    });

    // submit 버튼 클릭 시 처리
    submitButton.addEventListener('click', function(event) {
        if (!receiver.value) {
            alert('직원을 선택해주세요.'); // receiver 값이 없을 경우 알람 띄우기
            event.preventDefault(); // 폼 제출 중지
        }
        // 여기에 폼 제출 로직 추가
        // 예: document.getElementById('myForm').submit();
    });
});
