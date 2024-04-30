import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LastOccupiedUserImage extends StatelessWidget {
  const LastOccupiedUserImage({
    super.key,
    required this.lastOccupiedUserId,
  });

  final String lastOccupiedUserId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('images')
            .doc(lastOccupiedUserId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircleAvatar(
              radius: 56,
              backgroundColor: Colors.white,
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data!.data() == null) {
            return CircleAvatar(
              radius: 56,
              backgroundColor: Colors.white,
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }
          final documentData = snapshot.data!.data()!;

          return CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(documentData["image_url"]),
          );
        });
  }
}
