import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/tools/component/component_constructor.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'package:flutter/cupertino.dart';

abstract class RegistryApi {
  ComponentDropDown? getSupportingDropDown(String componentId);
  List<String>? allInternalComponents(String pluginName);
  Widget component(
      BuildContext context, AppModel app, String componentName, String id,
      {Map<String, dynamic>? parameters, Key? key});
  List<String> getExtensions();
  ComponentSpec? getComponentSpecs(String name);
  void addInternalComponents(String pluginName, List<String> list);
  void register(
      {String? componentName, ComponentConstructor? componentConstructor});
  @override
  void addDropDownSupporter(String componentId, ComponentDropDown support);
  void addComponentSpec(
      String pluginName, String pluginFriendlyName, List<ComponentSpec> specs);
  void registerRetrieveRepository(
      String pluginName, String componentId, RetrieveRepository repository);
  Widget application({required AppModel app, required bool asPlaystore});
}
