import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:workspaces_app/services/caching_service.dart';
import 'package:workspaces_app/widgets/button.dart';

class ConnectivityCheck extends StatefulWidget {
  final Widget child;
  final Widget cachedChild;
  final VoidCallback onConnectionResumed;
  final VoidCallback onConnectionRetry;

  ConnectivityCheck(
      {required this.child,
      required this.onConnectionResumed,
      required this.onConnectionRetry,
      required this.cachedChild});

  @override
  _ConnectivityCheckState createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  CachingService cache = CachingService(boxName: 'workspaces');
  bool exists = false;
  List workspaces = [];

  @override
  void initState() {
    super.initState();
    checkIfCacheExists();
  }

  // loadCachedWorkspaces() async {
  //   bool isExist = await cache.isExists();
  //   var spaces = [];
  //   if (exists) {
  //     spaces = await cache.getWorkspaces();
  //   }

  //   setState(() {
  //     exists = isExist;
  //     workspaces = spaces;
  //   });
  // }

  checkIfCacheExists() async {
    var isExist = await cache.isExists();
    setState(() {
      exists = isExist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged.asBroadcastStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == ConnectivityResult.none) {
            if (!exists) {
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
                        onpressed: widget.onConnectionRetry,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return widget.cachedChild;
            }
          } else {
            widget.onConnectionResumed();
            return widget.child;
          }
        });
  }
}
