import 'package:package_info/package_info.dart';

import '../constant.dart';

class Version {
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version + " + " + packageInfo.buildNumber;
  }

  static String getBdVersion() {
    var version = Constant.HOMOLOGATION_KEY;
    return version.isEmpty ? "PROD" : "HOML";
  }
}
