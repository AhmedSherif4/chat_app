import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final String username;
  final bool isMe;
  final String userimage;

  const MessageBubble(
      {required this.userimage,
      required this.key,
      required this.message,
      required this.username,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: !isMe ? Colors.grey[300] : Colors.indigo,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft:
                      isMe ? const Radius.circular(0) : Radius.circular(14),
                  bottomRight:
                      !isMe ? const Radius.circular(0) : Radius.circular(14),
                ),
              ),
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Column(
                crossAxisAlignment:isMe? CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: !isMe ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: !isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: !isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe? 175: null,
          right: !isMe?175:null,
            child: CircleAvatar(
          backgroundImage: NetworkImage(userimage),
        ))
      ],
    );
  }
}
