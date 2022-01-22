import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:workspaces_app/widgets/button.dart';

class ConnectivityCheck extends StatefulWidget {
  final Widget child;
  final VoidCallback onConnectionResumed;

  ConnectivityCheck({required this.child, required this.onConnectionResumed});

  @override
  _ConnectivityCheckState createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged.asBroadcastStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == ConnectivityResult.none) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      "No Internet Connection. Connect to the internet and try again.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: Button(
                      child: Text("Try Again"),
                      onpressed: () {
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            widget.onConnectionResumed();
            return widget.child;
          }
        });
  }
}
