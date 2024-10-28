import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enteredMessage = '';

  _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'username': userData['username'],
      'userId': user.uid,
      'userImage': userData['image_url']
    });
    _controller.clear();
    setState(() {
      _enteredMessage = '';
    });

    /* FirebaseFirestore.instance.collection('chat').snapshots()
        /** السنابشوت دي بترجعلي ستريم، ودا اللي احنا هنشتغل عليه بدل الفيوتشر عشان بيرجعلي بيانات مجمعة مع بعض مرة واحدة */
        .listen((event) {
      print(event.docs[0]['text']);
      print('___');
      event.docs.forEach((element) {
        print(element['text']);
      });
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (val) {
                setState(
                  () {
                    _enteredMessage = val;
                  },
                );
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(
              Icons.send_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
