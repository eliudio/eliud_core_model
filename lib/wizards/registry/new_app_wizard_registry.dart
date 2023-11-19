import 'package:collection/collection.dart';
import 'package:eliud_core_model/apis/wizard_api/new_app_wizard_info.dart';

/*
 * Global registry with new app wizards
 */
class NewAppWizardRegistry {
  static NewAppWizardRegistry? _instance;

  NewAppWizardRegistry._internal();

  static NewAppWizardRegistry registry() {
    _instance ??= NewAppWizardRegistry._internal();
    if (_instance == null) {
      throw Exception('Can create NewAppWizardRegistry registry');
    }

    return _instance!;
  }

  List<NewAppWizardInfo> registeredNewAppWizardInfos = [];

  void register(NewAppWizardInfo newAppWizardInfo) {
    var found = registeredNewAppWizardInfos.firstWhereOrNull(
        (NewAppWizardInfo? element) =>
            element != null &&
            element.newAppWizardName == newAppWizardInfo.newAppWizardName);
    if (found != null) {
      throw Exception(
          "Adding $newAppWizardInfo clashes with existing entry $found. Both have the same newAppWizardName. These must be unique");
    }
    registeredNewAppWizardInfos.add(newAppWizardInfo);
  }
}
