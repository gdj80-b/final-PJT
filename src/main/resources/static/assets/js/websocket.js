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
        console.log('Message received:' + chatMessage.body);
        showMessage(JSON.parse(chatMessage.body));
    });

    sendSystemMessage('JOIN');
}

function onError(error) {
    console.log('Error: ' + error);
}

function sendMessage() {
    const messageContent = document.getElementById('messageInput').value;
    const receiver = '20110006';

    if (messageContent) {
        const chatMessage = {
            sender: usercode,
            message: messageContent,
            receiver: receiver,
            type: 'CHAT'
        };
        stompClient.send('/app/chat.sendMessage', {}, JSON.stringify(chatMessage));
        document.getElementById('messageInput').value = '';
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
            message: '',
            receiver: receiver,
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

/*document.getElementById('close').addEventListener('click', function(e) {
    e.preventDefault();
    sendSystemMessage('LEAVE');
});*/