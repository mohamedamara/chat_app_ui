import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/chat_mesage.dart';
import 'chat_screen.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<ChatMessage> dummyChatMessage = [
    ChatMessage(
      senderName: "Bill Gates",
      senderPhotoURL: "assets/images/bill_gates.jpg",
      messages: [
        Message(
          senderId: 0,
          message: "what you think about open source projects?",
          messageTime: "10:15 AM",
        ),
        Message(
          senderId: 1,
          message: "sorry i need to update my windows",
          messageTime: "11:19 AM",
        ),
        Message(
          senderId: 1,
          message: "i have blue screen of death problem",
          messageTime: "11:19 AM",
        ),
      ],
      unreadMessages: 2,
    ),
    ChatMessage(
      senderName: "Elon Mask",
      senderPhotoURL: "assets/images/elon_musk.jpg",
      messages: [
        Message(
          senderId: 0,
          message: "hi iron man, how is the weather in mars",
          messageTime: "3:12 PM",
        ),
        Message(
          senderId: 2,
          message: "the weather in mars is amazing",
          messageTime: "3:13 PM",
        ),
      ],
      unreadMessages: 0,
    ),
    ChatMessage(
      senderName: "Tim Cook",
      senderPhotoURL: "assets/images/tim_cook.png",
      messages: [
        Message(
          senderId: 0,
          message: r"the starting price of the Mac Pro 2019 is 6000$ !!!",
          messageTime: "3:00 PM",
        ),
        Message(
          senderId: 3,
          message: "apple products are affordable",
          messageTime: "3:02 PM",
        ),
      ],
      unreadMessages: 0,
    ),
    ChatMessage(
      senderName: "Mark Zuckerberg",
      senderPhotoURL: "assets/images/mark_zuckerberg.jpg",
      messages: [
        Message(
          senderId: 4,
          message: "we care about your privacy",
          messageTime: "1:12 PM",
        ),
      ],
      unreadMessages: 0,
    ),
    ChatMessage(
      senderName: "Linux Torvalds",
      senderPhotoURL: "assets/images/linus_torvalds.jpg",
      messages: [
        Message(
          senderId: 5,
          message: "i like Nvidia",
          messageTime: "5:20 PM",
        ),
      ],
      unreadMessages: 0,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF161f29),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1e2732),
          elevation: 0,
          title: Text(
            "Chat",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.search,
              color: const Color(0xFF0cc7db),
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.edit,
                size: 19,
                color: const Color(0xff0cc7db),
              ),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: dummyChatMessage.length,
          itemBuilder: (context, index) => Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  dummyChatMessage[index].senderName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  dummyChatMessage[index].messages.last.message,
                  style: TextStyle(
                    color: const Color(0xFFd7d9db),
                    fontSize: 12,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    dummyChatMessage[index].senderPhotoURL,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 10,
                        ),
                        Text(
                          dummyChatMessage[index].messages.last.messageTime,
                          style: TextStyle(
                            color: const Color(0xFFd7d9db),
                            fontSize: 12,
                          ),
                        ),
                        if (dummyChatMessage[index].unreadMessages > 0) ...[
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF0cc7db),
                            ),
                            child: Center(
                              child: Text(
                                "${dummyChatMessage[index].unreadMessages}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        dummyChatMessage: dummyChatMessage[index],
                      ),
                    ),
                  );
                },
              ),
              Divider(
                color: const Color(0xFF29323b),
                height: 3,
                indent: 17,
                endIndent: 17,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF1e2732),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: const SizedBox(),
              icon: _selectedIndex == 0
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF0cc7db),
                      ),
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.message,
                      color: const Color(0xFF0cc7db),
                    ),
            ),
            BottomNavigationBarItem(
//            backgroundColor: const Color(0xFF1e2732),
              title: const SizedBox(),
              icon: _selectedIndex == 1
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF0cc7db),
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.photo_camera,
                      color: const Color(0xFF0cc7db),
                    ),
            ),
            BottomNavigationBarItem(
              title: const SizedBox(),
              icon: _selectedIndex == 2
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF0cc7db),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      color: const Color(0xFF0cc7db),
                    ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
