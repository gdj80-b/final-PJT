/**
 * 
 */

let stompClient = null;
let usercode = null;
let username = null;

function connect() {
    function createSocket() {
        return new SockJS('/gaent/ws');
    }

    stompClient = StompJs.Stomp.over(createSocket);
    stompClient.connect({}, onConnected, onError);

    /*window.onbeforeunload = function() {
        sendSystemMessage('LEAVE');
    }*/
}

function onConnected() {
    console.log('Connected');

    stompClient.subscribe('/queue/messages', function(chatMessage) {
        console.log('Message:' + chatMessage);
        console.log('Message received:' + chatMessage.body);
        showMessage(JSON.parse(chatMessage.body));
    });

    sendSystemMessage('JOIN');
}

function onError(error) {
    console.log('Error: ' + error);
}

function sendMessage() {
    const messageContent = document.getElementById('message').value;
    console.log('MessageContent: ' + messageContent);
    const receiver = '20110006';

    if (messageContent && stompClient) {
        const chatMessage = {
            sender: usercode,
            content: messageContent,
            recipient: receiver,
            type: 'CHAT'
        };
        stompClient.send('/app/chat.sendMessage', {}, JSON.stringify(chatMessage));
        document.getElementById('message').value = '';
    }

    stompClient.send('/app/chat.sendMessage', {}, JSON.stringify(chatMessage));
    document.getElementById('message').value = '';

    showMessage(chatMessage);
}

function sendSystemMessage(type) {
    const receiver = '20110006';

    if (receiver && stompClient) {
        const chatMessage = {
            sender: usercode,
            content: '',
            recipient: receiver,
            type: type
        };
        stompClient.send('/app/chat.sendMessage', {}, JSON.stringify(chatMessage));
    }
}

function showMessage(message) {
    console.log('showMessage', message);
    const chatHistory = document.getElementById('chat-history');

    const messageElement = document.createElement('li');
    messageElement.classList.add('chat-message', message.sender === usercode ? 'chat-message-right' : 'chat-message-left');

    const avatarClass = message.sender === usercode ? 'ms-4' : 'me-4';
    const textClass = message.sender === usercode ? 'primary' : '';
    const textAlignClass = message.sender === usercode ? 'text-end' : '';

    messageElement.innerHTML = `
        <div class="d-flex overflow-hidden">
            <div class="user-avatar flex-shrink-0 ${avatarClass}">
                <div class="avatar avatar-sm">
                    <img src="/gaent/assets/img/avatars/default.png" alt="Avatar" class="rounded-circle"/>
                </div>
            </div>
            <div class="chat-message-wrapper flex-grow-1">
                <div class="chat-message-text ${textClass}">
                    <p class="mb-0">${message.message}</p>
                </div>
                <div class="${textAlignClass} text-muted mt-1">
                    <small>${new Date().toLocaleTimeString()}</small>
                </div>
            </div>
        </div>
    `;

    chatHistory.appendChild(messageElement);
}

// MutationObserver로 DOM 변화를 감지하여 스크롤 설정
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('send').addEventListener('click', function(event) {
        event.preventDefault();
        sendMessage();
    });

    const chatHistory = document.getElementById('chat-history');
    const observer = new MutationObserver(() => {
        chatHistory.scrollTop = chatHistory.scrollHeight;
    });

    observer.observe(chatHistory, { childList: true });

    connect();
});

observer.observe(chatHistory, { childList: true });

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('send').addEventListener('click', function(e) {
        e.preventDefault();
        sendMessage();
    });
    connect();

    usercode = document.getElementById('sessionEmpCode').value;
    username = document.getElementById('sessionKorName').value;
    console.log('usercode: ' + usercode + ' / username: ' + username);
});

function chatClose() {
    sendSystemMessage('LEAVE');
}

/*function chatBubble() {
    fetch('/gaent/bubble')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.statusText);
            }
            return response.text(); // 서버에서 HTML 템플릿을 반환한다고 가정
        })
        .then(data => {
            const messageElement = document.createElement('li');
            messageElement.innerHTML = data;
            chatHistory.appendChild(messageElement);
            chatHistory.scrollTop = chatHistory.scrollHeight;
        })
        .catch(error => {
            console.log('There has been a problem with your fetch operation: ' + error);
        });
}*/

/*document.getElementById('close').addEventListener('click', function(e) {
    e.preventDefault();
    sendSystemMessage('LEAVE');
});*/