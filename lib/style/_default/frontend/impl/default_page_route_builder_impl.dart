import 'package:eliud_core_model/style/frontend/has_page_route_builder.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core_model/tools/route_builders/route_builders.dart';

class DefaultPageRouteBuilderImpl implements HasPageRouteBuilder {
  DefaultPageRouteBuilderImpl();

  @override
  PageRouteBuilder pageRoute(
      String name, Map<String, dynamic>? parameters, Widget page) {
    return FadeRoute(
        name: name, parameters: parameters, page: page, milliseconds: 1000);
  }
}
