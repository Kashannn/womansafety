import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();

  List<MessageBubble> _messages = [
    MessageBubble(
      sender: 'Fit Bot',
      text: 'Hey Susan! It\'s time for your weekly weight update...',
      isMe: false,
    ),
    MessageBubble(
      sender: 'Susan',
      text: '69 kg',
      isMe: true,
    ),
    MessageBubble(
      sender: 'Fit Bot',
      text: 'Awesome! Your dedication to this routine...',
      isMe: false,
    ),
  ];

  void _sendMessage() {
    String text = _textController.text.trim();
    if (text.isNotEmpty) {
      MessageBubble newMessage = MessageBubble(
        sender: 'Susan', // Assuming the user sending the message is Susan
        text: text,
        isMe: true,
      );

      setState(() {
        _messages.add(newMessage);
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fit Bot',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/your_image.png'), // Replace with your image path
          radius: 20, // Adjust the radius as needed
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add your code for the 'Three Dots' functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          BottomAppBar(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.sender,
    required this.text,
    required this.isMe,
  });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 30.0 : 0),
              topRight: Radius.circular(isMe ? 0 : 30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
