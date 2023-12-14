
document.addEventListener("DOMContentLoaded", function () {
    // 클래스 이름으로 요소 가져오기
    var imgMypage = document.querySelector('.img-mypage');
    var text1 = document.querySelector('.text-1');
    console.log(text1);
    // 클릭 이벤트 리스너 추가
    imgMypage.addEventListener('click', function () {
        // img-mypage가 클릭되었을 때 새로운 페이지로 이동
        window.location.href = '#'; // 실제 경로로 대체
    });

    text1.addEventListener('click', function () {
        // text-1이 클릭되었을 때 새로운 페이지로 이동
        window.location.href = '#'; // 실제 경로로 대체
    });
});
document.addEventListener("DOMContentLoaded", function () {
    // 클래스 이름으로 요소 가져오기
    var imgMypage = document.querySelector('.img-logout');
    var text1 = document.querySelector('.text-2');

    // 클릭 이벤트 리스너 추가
    imgMypage.addEventListener('click', function () {
        // img-logout 클릭되었을 때 새로운 페이지로 이동
        window.location.href = '#'; // 실제 경로로 대체
    });

    text1.addEventListener('click', function () {
        // text-1이 클릭되었을 때 새로운 페이지로 이동
        window.location.href = '#'; // 실제 경로로 대체
    });
});
