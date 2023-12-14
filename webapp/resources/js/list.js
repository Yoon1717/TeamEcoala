
var isResizing = false;
var isDragging = false;
var lastX;
var lastY;

document.getElementById("chatContainer").style.display = 'none';

var toggleSwitch = false;
function toggleChat() {
    var chatBody = document.getElementById("chatBody");
    console.log(toggleSwitch);

    if (toggleSwitch === false) {
        while (chatBody.firstChild) {
            chatBody.firstChild.remove();
        }
    }

    var chatContainer = document.getElementById("chatContainer");
    chatContainer.style.display = (chatContainer.style.display === 'none' || chatContainer.style.display === '') ? 'block' : 'none';

    if (chatContainer.style.display === 'none') {
        toggleSwitch = false;
    } else {
        toggleSwitch = true;
    }

    console.log(chatContainer.style.display);

    var botMessage = document.createElement("div");
    var userMessage = document.createElement("div");
            
    botMessage.className = "ch1";
    botMessage.innerHTML = "<div class='chat ch1'><div class='icon'></div><div class='textbox'>" + "안녕하세요! 사용자님 코봇입니다!" + "</div></div>";
    chatBody.appendChild(botMessage);
    
}

function handleKeyPress(event) {
    if (event.key === 'Enter') {
        sendMessage();
    }
}


function sendMessage() {
    var userInput = document.getElementById("userInput").value;
    var chatBody = document.getElementById("chatBody");
    var botMessage = document.createElement("div");

    if (userInput.trim() !== '') {
        // 사용자 메시지 추가
        var userMessage = document.createElement("p");
        userMessage.className = "ch2";
        userMessage.innerHTML = "<div class='chat ch2'><div class='icon2'></div><div class='textbox'>" + userInput + "</div></div>";
        chatBody.appendChild(userMessage);
       
        $(document).ready(function () {
            $.ajax({
                url: 'http://192.168.0.44:5000/chatBot',
                type: "POST",
                contentType: 'application/json',  // 데이터 전송 형식 지정
                dataType: 'json',  // 서버에서 받아올 데이터 형식 지정
                data: JSON.stringify({"Q": userInput}),  // 보낼 데이터를 JSON 문자열로 변환  */
                success: function (res) {
                    console.log(res.result);  // 성공 시 서버에서 받은 데이터 출력
                    var botMessage = document.createElement("div");
                    botMessage.className = "ch1";
                    botMessage.innerHTML = "<div class='chat ch1'><div class='icon'></div><div class='textbox'>" + res.result + "</div></div>";
                    chatBody.appendChild(botMessage);          
                    // 스크롤을 가장 아래로 이동
                    chatBody.scrollTop = chatBody.scrollHeight;                  
                },
                error: function (xhr, status, error) {
                    console.error('AJAX 오류: ' + status, error);                            
                }
            });
        })
         // 입력 필드 초기화
         document.getElementById("userInput").value = '';
        
    }
}

function startResize(e) {
    isResizing = true;
    lastX = e.clientX;
    lastY = e.clientY;
    document.addEventListener('mousemove', handleMouseMove);
    document.addEventListener('mouseup', stopResize);
}

function stopResize() {
    isResizing = false;
    document.removeEventListener('mousemove', handleMouseMove);
    document.removeEventListener('mouseup', stopResize);
}

function handleMouseMove(e) {
    if (isResizing) {
        var chatContainer = document.getElementById("chatContainer");
        chatContainer.style.width = (parseInt(chatContainer.style.width) || chatContainer.clientWidth) - (e.clientX - lastX) + 'px';
        chatContainer.style.height = (parseInt(chatContainer.style.height) || chatContainer.clientHeight) - (e.clientY - lastY) + 'px';
        lastX = e.clientX;
        lastY = e.clientY;
    }
}

function startDrag(e) {
    isDragging = true;
    lastX = e.clientX;
    lastY = e.clientY;
    document.addEventListener('mousemove', handleDrag);
    document.addEventListener('mouseup', stopDrag);
}

function stopDrag() {
    isDragging = false;
    document.removeEventListener('mousemove', handleDrag);
    document.removeEventListener('mouseup', stopDrag);
}

function handleDrag(e) {
    if (isDragging) {
        var chatContainer = document.getElementById("chatContainer");
        var deltaX = e.clientX - lastX;
        var deltaY = e.clientY - lastY;
        chatContainer.style.right = (parseInt(chatContainer.style.right) || 0) - deltaX + 'px';
        chatContainer.style.bottom = (parseInt(chatContainer.style.bottom) || 0) - deltaY + 'px';
        lastX = e.clientX;
        lastY = e.clientY;
    }
}