import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workspaces_app/models/workspace_model.dart';
import 'package:workspaces_app/screens/workspaces_screen.dart';
import 'package:workspaces_app/theme/appThemeNotifier.dart';
import 'package:workspaces_app/theme/theme.dart';

void main() async {
  await Hive.initFlutter();

  var workspaces = await Hive.openBox('workspaces');

  runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(builder: (context, appState, _) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Workspaces App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: WorkspaceScreen());
    });
  }
}
