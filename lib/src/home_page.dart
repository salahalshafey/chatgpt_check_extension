//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'utils/user.dart';
import 'widgets/chat_gpt_state.dart';
import 'widgets/user_name_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: Text("Loading"),
              ),
            );
          }

          final user = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: UserNameField(userName: user.userName),
              centerTitle: true,
            ),
            body: SizedBox(
              // height: kIsWeb ? 350 : null,
              // width: kIsWeb ? 250 : null,
              child: Center(
                child: ChatGptState(currentUserId: user.userId),
              ),
            ),
          );
        },
      ),
    );
  }
}
