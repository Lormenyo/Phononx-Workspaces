import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workspaces_app/services/workspace_service.dart';
import 'package:workspaces_app/widgets/connectivity_checker.dart';
import 'package:workspaces_app/widgets/workspace_widget.dart';

class WorkspaceScreen extends StatefulWidget {
  WorkspaceScreen({Key? key}) : super(key: key);

  @override
  _WorkspaceScreenState createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  StreamController? _workspacesStreamController;

  loadWorkspaces() async {
    print("Loading workspaces");
    WorkspaceService.getWorkspaces().then((res) async {
      _workspacesStreamController?.add(res);
      return res;
    });
  }

  Future<Null> _handleRefresh() async {
    WorkspaceService.getWorkspaces().then((res) async {
      _workspacesStreamController?.add(res);
      return null;
    });
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _workspacesStreamController = new StreamController();
      loadWorkspaces();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _workspacesStreamController?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          "My Workspaces",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: ConnectivityCheck(
        child: StreamBuilder(
          stream: _workspacesStreamController?.stream.asBroadcastStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Scrollbar(
                      child: RefreshIndicator(
                        onRefresh: _handleRefresh,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var workspace = snapshot.data[index];

                            return WorkspaceWidget(
                              id: workspace["id"],
                              name: workspace["name"],
                              imageUrl: workspace["image_url"],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        onConnectionResumed: () {
          loadWorkspaces();
        },
      ),
    );
  }
}
