import 'package:chat_app_ui/models/chat_mesage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final ChatMessage dummyChatMessage;

  ChatScreen({
    Key key,
    this.dummyChatMessage,
  }) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  var reversedMessageList = <Message>[];

  @override
  void initState() {
    super.initState();
    reversedMessageList = widget.dummyChatMessage.messages.reversed.toList();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF1e2732),
      elevation: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.dummyChatMessage.senderName,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "online",
                style: TextStyle(
                  color: const Color(0xFFd7d9db),
                  fontSize: 12,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3, top: 2),
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00d40e),
                ),
              )
            ],
          ),
        ],
      ),
      titleSpacing: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: const Color(0xFF0cc7db),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
            color: const Color(0xff0cc7db),
          ),
          onPressed: () {},
        ),
      ],
    );
    return Scaffold(
      backgroundColor: const Color(0xFF161f29),
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              reverse: true,
              itemCount: reversedMessageList.length,
              itemBuilder: (_, index) => buildItem(reversedMessageList[index]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
            height: 70,
            color: const Color(0xFF1e2732),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 8, top: 5, bottom: 5),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF161f29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                        right: Radius.circular(50),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _textController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: const Color(0xFF0cc7db),
                              decoration: InputDecoration(
                                hintText: "Type your message",
                                hintStyle: TextStyle(
                                  color: const Color(0xFFd7d9db),
                                  fontSize: 12,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF0cc7db),
                            ),
                            child: Center(
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  onPressed: () =>
                                      _handleSubmitted(_textController.text)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: const SizedBox(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    final formattedDate = DateFormat.jm().format(DateTime.now());
    if (text.isNotEmpty) {
      _textController.clear();
      Message message = Message(
        senderId: 0,
        message: text,
        messageTime: formattedDate,
      );
      setState(() {
        reversedMessageList.insert(0, message);
      });
    }
  }

  buildItem(Message message) {
    if (message.senderId == 0) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: message ==
                          reversedMessageList.firstWhere(
                              (msg) => msg.senderId == message.senderId)
                      ? const EdgeInsets.only(bottom: 0, left: 10)
                      : const EdgeInsets.only(bottom: 10, left: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF088d9b),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            if (message ==
                reversedMessageList
                    .firstWhere((msg) => msg.senderId == message.senderId))
              Container(
                margin: const EdgeInsets.only(left: 45, top: 8, bottom: 10),
                child: Text(
                  message.messageTime,
                  style: TextStyle(
                    color: const Color(0xFFd7d9db),
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (message ==
                    reversedMessageList
                        .firstWhere((msg) => msg.senderId == message.senderId))
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage(widget.dummyChatMessage.senderPhotoURL),
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const SizedBox(
                    width: 35,
                  ),
                Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: message ==
                          reversedMessageList.firstWhere(
                              (msg) => msg.senderId == message.senderId)
                      ? const EdgeInsets.only(bottom: 0, left: 10)
                      : const EdgeInsets.only(bottom: 10, left: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1e2732),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            if (message ==
                reversedMessageList
                    .firstWhere((msg) => msg.senderId == message.senderId))
              Container(
                margin: const EdgeInsets.only(left: 45, top: 8, bottom: 10),
                child: Text(
                  message.messageTime,
                  style: TextStyle(
                    color: const Color(0xFFd7d9db),
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }
}
