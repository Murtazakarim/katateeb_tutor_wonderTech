
class ChatMessage{
  final String messageContent;
  final String messageType;
  ChatMessage({required  this.messageContent, required this.messageType});
}

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({required this.name,required this.messageText,required this.imageURL,required this.time});
}