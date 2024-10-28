import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots()
        /** السنابشوت دي بترجعلي ستريم، ودا اللي احنا هنشتغل عليه بدل الفيوتشر عشان بيرجعلي بيانات مجمعة مع بعض مرة واحدة */
        ,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = FirebaseAuth.instance.currentUser;
          final docs = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (ctx, index) {
              print('first: ${docs[index]['userId']}');
              print('sec: ${user!.uid}');
              print('key: ${docs[index]}');
              return MessageBubble(
                isMe: docs[index]['userId'] == user.uid,
                message: '${docs[index]['text']}',
                key: ValueKey('${docs[index]}'),
                username: docs[index]['username'],
                userimage: docs[index]['userImage'],
              );
            },
          );
        }));
  }
}
