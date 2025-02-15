import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  Future<String> getAppVersion() async {
    // Retrieve app version information
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
