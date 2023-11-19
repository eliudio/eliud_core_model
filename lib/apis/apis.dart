import 'package:eliud_core_model/apis/action_api/action_model_api.dart';
import 'package:eliud_core_model/apis/coreapi/core_api.dart';
import 'package:eliud_core_model/apis/medium/medium_api.dart';
import 'package:eliud_core_model/apis/registryapi/registry_api.dart';
import 'package:eliud_core_model/apis/routerapi/router_api.dart';
import 'package:eliud_core_model/apis/wizard_api/wizard_api.dart';

class Apis {
  static Apis? _instance;
  MediumApi? mediumApi;
  CoreApi? coreApi;
  RegistryApi? registryApi;
  RouterApi? routerApi;
  ActionModelApi? actionModelApi;
  WizardApi? wizardApi;

  Apis._internal();

  static Apis apis() {
    _instance ??= Apis._internal();

    if (_instance != null) return _instance!;

    throw "Exception: Apis couldn't be initialised";
  }

  MediumApi getMediumApi() {
    if (mediumApi == null) {
      throw "Exception: no MediumApi registered. You should include an eliud package which implements the MediumApi and registers it onto Apis.getApis().registerMediumApi(...)";
    }
    return mediumApi!;
  }

  CoreApi getCoreApi() {
    if (coreApi == null) {
      throw "Exception: no CoreApi registered. You should include an eliud package which implements the CoreApi and registers it onto Apis.getApis().registerCoreApi(...)";
    }
    return coreApi!;
  }

  RegistryApi getRegistryApi() {
    if (registryApi == null) {
      throw "Exception: no RegistryApi registered. You should include an eliud package which implements the RegistryApi and registers it onto Apis.getApis().registerRegistryApi(...)";
    }
    return registryApi!;
  }

  RouterApi getRouterApi() {
    if (routerApi == null) {
      throw "Exception: no RouterApi registered. You should include an eliud package which implements the RouterApi and registers it onto Apis.getApis().registerRouterApi(...)";
    }
    return routerApi!;
  }

  ActionModelApi getActionModelApi() {
    if (actionModelApi == null) {
      throw "Exception: no ActionModelApi registered. You should include an eliud package which implements the ActionModelApi and registers it onto Apis.getApis().registerActionModelApi(...)";
    }
    return actionModelApi!;
  }

  WizardApi getWizardApi() {
    if (wizardApi == null) {
      throw "Exception: no WizardApi registered. You should include an eliud package which implements the WizardApi and registers it onto Apis.getApis().registerWizardApi(...)";
    }
    return wizardApi!;
  }

  void registerMediumApi(MediumApi mediumApi) {
    this.mediumApi = mediumApi;
  }

  void registerRegistryApi(RegistryApi registryApi) {
    this.registryApi = registryApi;
  }

  void registerCoreApi(CoreApi coreApi) {
    this.coreApi = coreApi;
  }

  void registerRouterApi(RouterApi routerApi) {
    this.routerApi = routerApi;
  }

  void registerActionModelApi(ActionModelApi actionModelApi) {
    this.actionModelApi = actionModelApi;
  }

  void registerWizardApi(WizardApi wizardApi) {
    this.wizardApi = wizardApi;
  }
}
