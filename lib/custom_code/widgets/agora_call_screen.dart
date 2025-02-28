// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_token_service/agora_token_service.dart';
import 'dart:math';

class AgoraCallScreen extends StatefulWidget {
  const AgoraCallScreen({
    super.key,
    this.width,
    this.height,
    required this.channelName,
    required this.userName,
    required this.callEndFunc,
    required this.role,
  });

  final double? width;
  final double? height;
  final String channelName;
  final String userName;
  final Future Function() callEndFunc;
  final String role;

  @override
  State<AgoraCallScreen> createState() => _AgoraCallScreenState();
}

class _AgoraCallScreenState extends State<AgoraCallScreen> {
  late AgoraClient client;
  bool isInitialized = false;
  // final AgoraClient client = AgoraClient(
  //   agoraConnectionData: AgoraConnectionData(
  //     appId: "616088a8b8b4417eba97e00d293f763c",
  //     channelName: "TestRoom",
  //     username: "user",
  //   ),
  // );

  List<int> generatedInts = [];

  // Function to generate a random integer that hasn't been generated before
  int generateUniqueInt({int min = 0, int max = 100}) {
    if (generatedInts.length >= (max - min + 1)) {
      throw Exception("All possible integers have been generated");
    }

    int randomInt;
    do {
      randomInt = Random().nextInt(max - min + 1) + min;
    } while (generatedInts.contains(randomInt)); // Ensure uniqueness

    generatedInts.add(randomInt); // Add to the list
    return randomInt;
  }

  @override
  void initState() {
    super.initState();
    print(widget.channelName.toString());
    var i = widget.channelName.toString();
    initAgora();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    client.release();
  }

  void initAgora() async {
    int uid = generateUniqueInt();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "890d078e20354484be96a221747c2b51",
        channelName: widget.channelName.toString(),
        uid: uid, // Let Agora generate unique UIDs
        username: widget.userName.toString(),
        tempToken: RtcTokenBuilder.build(
            appId: "890d078e20354484be96a221747c2b51",
            appCertificate: "bf08308e4bb34e57b89a6d8f34e0a536",
            channelName: widget.channelName.toString(),
            uid: uid.toString(), // Use 0 for UID to avoid conflict
            expireTimestamp:
                (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 3600,
            role:
                // widget.role == "provider"
                RtcRole.publisher
            // : RtcRole.subscriber
            // widget.role == "provider"
            //     ? RtcRole.publisher
            //     : RtcRole.subscriber,
            ),
      ),
    );

    await client.initialize();

    //await Future.delayed(const Duration(seconds: 3));

    Timer(const Duration(seconds: 3), start);
  }

  start() {
    setState(() {
      isInitialized = true; // Show the video UI after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (popAllowed) async {
          Navigator.pop(context);
        },
        child: Scaffold(
          body: SafeArea(
            child: (isInitialized)
                ? Stack(
                    children: [
                      AgoraVideoViewer(
                          client: client!,
                          layoutType: Layout.floating,
                          disabledVideoWidget: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                // Text(
                                //   widget.role == "provider"
                                //       ? client.agoraConnectionData.username ??
                                //           ''
                                //       : '',
                                //   style: TextStyle(color: Colors.white),
                                // )
                              ],
                            ),
                          ),
                          enableHostControls: false, // Enable host controls
                          showNumberOfUsers: false),
                      AgoraVideoButtons(
                        client: client!,
                        onDisconnect: () {
                          Navigator.pop(context); // Navigate back on call end
                          // widget.callEndFunc();
                        },
                        addScreenSharing: false, // Disable screen sharing
                      ),
                    ],
                  )
                : const Center(
                    child:
                        CircularProgressIndicator(), // Show loader while initializing
                  ),
          ),
        ));
  }
}
