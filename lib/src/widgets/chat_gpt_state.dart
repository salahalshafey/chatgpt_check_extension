import 'package:chatgpt_check_extension/src/utils/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'current_chat_gpt_state.dart';

class ChatGptState extends StatelessWidget {
  const ChatGptState({
    super.key,
    required this.currentUserId,
  });

  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chatgpt_states')
          .doc('current_state')
          .snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || snapshot.data!.data() == null) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        }

        final documentData = snapshot.data!.data()!;
        final bool isOccupied = documentData["is_occupied"];
        final String lastOccupiedUserId = documentData["last_occupied_user_id"];
        final String lastOccupiedUserName =
            documentData["last_occupied_user_name"];
        final DateTime firstSeenTime =
            (documentData["first_seen_time"] as Timestamp).toDate().toLocal();
        final DateTime lastSeenTime =
            (documentData["last_seen_time"] as Timestamp).toDate().toLocal();

        if (isOccupied && lastOccupiedUserId == currentUserId) {
          return CurrentChatGptState(
            key: const Key("1"),
            color: Colors.red,
            lastOccupiedUserId: lastOccupiedUserId,
            lastOccupiedUserName: lastOccupiedUserName,
            switchState: true,
            occupationDetails: "OCCUPIED BY ME",
            since: firstSeenTime,
            onTap: () {
              FirebaseFirestore.instance
                  .collection('chatgpt_states')
                  .doc("current_state")
                  .update({
                'is_occupied': false,
                'last_seen_time': DateTime.now().toLocal(),
              });
            },
          );
        }

        if (isOccupied && lastOccupiedUserId != currentUserId) {
          return CurrentChatGptState(
            key: const Key("2"),
            color: Colors.grey,
            lastOccupiedUserId: lastOccupiedUserId,
            lastOccupiedUserName: lastOccupiedUserName,
            switchState: false,
            occupationDetails:
                "OCCUPIED BY ${lastOccupiedUserName.toUpperCase()}",
            since: firstSeenTime,
            onTap: () {},
          );
        }

        return CurrentChatGptState(
          key: const Key("3"),
          color: Colors.green,
          lastOccupiedUserId: "chatgpt",
          lastOccupiedUserName: lastOccupiedUserName,
          switchState: true,
          occupationDetails: "NOT OCCUPIED",
          since: lastSeenTime,
          onTap: () async {
            final currentUserName = await getUserName();

            FirebaseFirestore.instance
                .collection('chatgpt_states')
                .doc("current_state")
                .update({
              'is_occupied': true,
              'last_occupied_user_id': currentUserId,
              'last_occupied_user_name': currentUserName,
              'first_seen_time': DateTime.now().toLocal(),
            });
          },
        );
      },
    );
  }
}
