// lib/providers/home_map_data_provider.dart

import 'package:infra_report/models/home_map_data.dart';
import 'package:infra_report/providers/location_provider.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_map_data_provider.g.dart';

@Riverpod(keepAlive: true)
Future<HomeMapData> homeMapData(ref) async {
  // 1. Get the user's location.
  final userPosition = await ref.watch(userLocationProvider.future);

  // 2. Get the repository instance.
  final repository = ref.watch(reportRepositoryProvider);

  // 3. *** TRIGGER THE SIDE EFFECT EXPLICITLY AND ONLY ONCE ***
  // We do NOT await this. We kick it off and let it run in the background.
  // The UI will update reactively when the sync completes and writes to the DB.
  await repository.syncReportsWithApi(userPosition);

  // 4. Await the first value from the pure database stream.
  final reports = await repository.watchReports().first;

  // 5. Return the combined data.
  return HomeMapData(reports: reports, userPosition: userPosition);
}
