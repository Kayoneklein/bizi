import 'package:flutter_test/flutter_test.dart';

import 'repository/user_repository_tests.dart' as user_repo;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final store = await createStore();

  // runApp(MyApp(store: store));

  /// user Repository Tests;
  user_repo.main();
}
