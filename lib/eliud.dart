import 'package:eliud_core_model/style/style_family.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'apis/apis.dart';
import 'decoration/decoration.dart' as deco;
import 'decoration/decorations.dart' as deco;
import 'package/packages.dart';
import 'package/package.dart';

class Eliud {
  void registerPackage(Package package) {
    Packages.instance().registerPackage(package);
  }

  void registerDecoration(deco.Decoration decoration) {
    deco.Decorations.instance().registerDecoration(decoration);
  }

  void registerStyleFamily(StyleFamily styleFamily) {
    StyleRegistry.registry().registerStyleFamily(styleFamily);
  }

  /*
   * Finalise the initialisation of the app.
   * This must be called before running the app, and/or before wiping the app and reinstalling
   */
  void finalizeInitialisation() {
    try {
//    This must be set in the package, as that's the convention:  ComponentRegistry().init();

      var plugins = Packages.registeredPackages;
      for (var i = 0; i < plugins.length; i++) {
        var plugin = plugins[i];
        plugin.registerDependencies(this);
      }

      for (var i = 0; i < plugins.length; i++) {
        var plugin = plugins[i];
        plugin.init();
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<bool> doesAppExist(String appId) async {
    var app = await appRepository()!.get(appId);
    return (app != null);
  }

  // Run the application without playstore
  // appId is the application you want to start and therefore not be null.
  // asPlayStore flag allows to run the playstore app where people can use it to switch to other apps, create apps, ....
  // Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to thePlayStoreApp
  void run(String appId, bool asPlaystore) async {
    appId = appId.toUpperCase();
    var app = await appRepository()!.get(appId);
    if (app == null) {
      print("App with appId '$appId' does not exist");
    } else {
      runApp(Apis.apis()
          .getRegistryApi()
          .application(app: app, asPlaystore: asPlaystore));
    }
  }
}
