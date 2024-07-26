const monthYearElement = document.getElementById('monthYear');
const datesElement = document.getElementById('dates');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

let currentDate = new Date();

const updateCalendar = () => {
    const currentYear = currentDate.getFullYear();
    const currentMonth = currentDate.getMonth();
    
    // 현재 월의 첫 날과 마지막 날
    const firstDay = new Date(currentYear, currentMonth, 1);
    const lastDay = new Date(currentYear, currentMonth + 1, 0);
    const totalDays = lastDay.getDate();
    
    // 첫 날의 요일
    const firstDayIndex = firstDay.getDay(); // 일요일: 0, 월요일: 1, ..., 토요일: 6
    const lastDayIndex = lastDay.getDay(); // 마지막 날의 요일
    
    const monthYearString = currentDate.toLocaleString('default', {month: 'long', year: 'numeric'});
    monthYearElement.textContent = monthYearString;
    
    let datesHTML = '';
    
    // 이전 달 날짜 추가 (일요일부터 시작)
    for(let i = firstDayIndex; i > 0; i--){
        const prevDate = new Date(currentYear, currentMonth, 0 - i + 1);
        datesHTML += `<div class="date inactive">${prevDate.getDate()}</div>`;
    }
    
    // 현재 달 날짜 추가
    for(let i = 1; i <= totalDays; i++){
        const date = new Date(currentYear, currentMonth, i);
        const activeClass = date.toDateString() === new Date().toDateString() ? 'active' : '';
        datesHTML += `<div class="date ${activeClass}" data-date="${date.toISOString()}">${i}</div>`;
    }
    
    // 다음 달 날짜 추가
    for(let i = 1; i <= 6 - lastDayIndex; i++){
        const nextDate = new Date(currentYear, currentMonth + 1, i);
        datesHTML += `<div class="date inactive">${nextDate.getDate()}</div>`;
    }
    
    datesElement.innerHTML = datesHTML;
}

// 날짜 클릭 시 페이지 이동
datesElement.addEventListener('click', (event) => {
    const clickedElement = event.target;
    if (clickedElement.classList.contains('date') && !clickedElement.classList.contains('inactive')) {
        const selectedDate = new Date(clickedElement.dataset.date);
        const formattedDate = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(selectedDate.getDate()).padStart(2, '0')}`;
        // 페이지 이동 또는 링크 처리
        window.location.href = `/gaent/calendar`;
    }
});

prevBtn.addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() - 1);
    updateCalendar();
})

nextBtn.addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() + 1);
    updateCalendar();
})

updateCalendar();