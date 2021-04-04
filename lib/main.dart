import 'package:background_fetch/background_fetch.dart';
import 'package:driverapp/routes.dart';

/// This "Headless Task" is run when app is terminated.
void backgroundFetchHeadlessTask(String taskId) async {
  BackgroundFetch.finish(taskId);
}

void main() {
  Routes();
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
