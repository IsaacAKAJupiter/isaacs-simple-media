import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for JobsApi
void main() {
  final instance = Openapi().getJobsApi();

  group(JobsApi, () {
    // Manually trigger a scan to find and remove orphaned media records.
    //
    // This is an asynchronous task that runs in the background.
    //
    //Future triggerOrphanCleanup() async
    test('test triggerOrphanCleanup', () async {
      // TODO
    });

    // Manually trigger a scan to find and remove orphaned files without media records.
    //
    // This is an asynchronous task that runs in the background.
    //
    //Future triggerOrphanFileCleanup() async
    test('test triggerOrphanFileCleanup', () async {
      // TODO
    });

  });
}
