/* Interface for AdminApp */

import '../model/app_model.dart';
import '../model/menu_def_model.dart';

abstract class AdminAppInstallerBase {
  Future<void> run();
}

abstract class AdminAppMenuInstallerBase {
  Future<MenuDefModel> menu(AppModel app);
}

abstract class AdminAppWiperBase {
  Future<void> deleteAll(String appID);
}
