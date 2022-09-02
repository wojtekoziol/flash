// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flash/app.dart';
import 'package:flash/bootstrap.dart';
import 'package:flash/config/get_it.dart';
import 'package:flash/config/hive.dart';

Future<void> main() async {
  initGetIt();
  await initHive();
  await bootstrap(() => const App());
}
