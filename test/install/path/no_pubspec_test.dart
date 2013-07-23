// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS d.file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE d.file.

import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:scheduled_test/scheduled_test.dart';

import '../../descriptor.dart' as d;
import '../../test_pub.dart';

main() {
  initConfig();
  integration('path dependency to non-package directory', () {
    // Make an empty directory.
    d.dir('foo').create();
    var fooPath = path.join(sandboxDir, "foo");

    d.dir(appPath, [
      d.appPubspec({
        "foo": {"path": fooPath}
      })
    ]).create();

    pubInstall(error: 'Package "foo" doesn\'t have a pubspec.yaml file.');
  });
}