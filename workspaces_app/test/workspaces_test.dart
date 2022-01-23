import 'package:flutter_test/flutter_test.dart';
import 'package:workspaces_app/services/workspace_service.dart';

void main() {
  test('Workspaces can be fetched', () async {
    final workspaces = await WorkspaceService.getWorkspaces();

    expect(workspaces.length, greaterThan(0));
  });
}
