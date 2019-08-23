class ChatMessage {
  final String senderName;
  final String senderPhotoURL;
  final List<Message> messages;
  final int unreadMessages;

  ChatMessage({
    this.senderName,
    this.senderPhotoURL,
    this.messages,
    this.unreadMessages,
  });
}

class Message {
  final int senderId;
  final String message;
  final String messageTime;

  Message({
    this.senderId,
    this.message,
    this.messageTime,
  });
}
