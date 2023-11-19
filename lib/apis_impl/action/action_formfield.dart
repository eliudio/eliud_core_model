import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/apis.dart';
import 'package:eliud_core_model/apis_impl/action/popup_menu.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/internal_component.dart';
import 'package:eliud_core_model/model/menu_def_model.dart';
import 'package:eliud_core_model/style/frontend/has_button.dart';
import 'package:flutter/material.dart';

import 'goto_page.dart';
import 'internal_action.dart';
import 'open_dialog.dart';

typedef SetActionValue = Function(ActionModel value);

class ActionField extends StatefulWidget {
  final ActionModel? action;
  final SetActionValue setActionValue;
  final AppModel app;

  ActionField(this.app, this.action, this.setActionValue);

  @override
  State<StatefulWidget> createState() {
    return ActionFieldState();
  }
}

class ActionFieldState extends State<ActionField> {
  int? _actionSelection;
  final List<String> _internalActions = [
    'Login',
    'Logout',
    'GoHome',
    'OtherApps'
  ];
  String? _internalAction;
  String? _pageID;
  String? _dialogID;
  String? _menuDefID;

  @override
  void initState() {
    super.initState();
    final action = widget.action;
    if (action is GotoPage) {
      _actionSelection = 0;
      _pageID = action.pageID;
    } else if (action is OpenDialog) {
      _actionSelection = 3;
      _dialogID = action.dialogID;
    } else if (action is PopupMenu) {
      _actionSelection = 2;
      _menuDefID = action.menuDef!.documentID;
    } else if (action is InternalAction) {
      _actionSelection = 1;
      if (action.internalActionEnum == InternalActionEnum.login) {
        _internalAction = _internalActions[0];
      } else if (action.internalActionEnum == InternalActionEnum.logout) {
        _internalAction = _internalActions[1];
      } else if (action.internalActionEnum == InternalActionEnum.goHome) {
        _internalAction = _internalActions[2];
      } else if (action.internalActionEnum == InternalActionEnum.otherApps) {
        _internalAction = _internalActions[3];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Apis.apis().getCoreApi().buildWhenAccessDetermined(widget.app,
        (context) {
      var appId = widget.app.documentID;
      var widgets = <Widget>[
        RadioListTile(
          value: 0,
          groupValue: _actionSelection,
          title: Text('Goto Page'),
          subtitle: Text('This action results in moving to another page'),
          onChanged: !Apis.apis().getCoreApi().memberIsOwner(context, appId)
              ? null
              : (dynamic val) {
                  setSelectionDisplayMode(val);
                },
        ),
        RadioListTile(
          value: 1,
          groupValue: _actionSelection,
          title: Text('Internal'),
          subtitle: Text(
              'This action results in one of the predefined internal actions'),
          onChanged: !Apis.apis().getCoreApi().memberIsOwner(context, appId)
              ? null
              : (dynamic val) {
                  setSelectionDisplayMode(val);
                },
        ),
        RadioListTile(
          value: 2,
          groupValue: _actionSelection,
          title: Text('Internal'),
          subtitle: Text('This action is the go home action'),
          onChanged: !Apis.apis().getCoreApi().memberIsOwner(context, appId)
              ? null
              : (dynamic val) {
                  setSelectionDisplayMode(val);
                },
        ),
        RadioListTile(
          value: 3,
          groupValue: _actionSelection,
          title: Text('Popup Menu'),
          subtitle: Text('This menu item will open another popup menu'),
          onChanged: !Apis.apis().getCoreApi().memberIsOwner(context, appId)
              ? null
              : (dynamic val) {
                  setSelectionDisplayMode(val);
                },
        ),
      ];

      if (_actionSelection == 0) {
        widgets.add(Center(
            child: DropdownButtonComponentFactory().createNew(
                app: widget.app,
                id: 'pages',
                value: _pageID,
                trigger: _onDocumentSelected,
                optional: false)));
      } else if (_actionSelection == 2) {
        widgets.add(Center(
            child: DropdownButtonComponentFactory().createNew(
                app: widget.app,
                id: 'menuDefs',
                value: _menuDefID,
                trigger: _onPopupmenuSelected,
                optional: false)));
      } else if (_actionSelection == 3) {
        widgets.add(Center(
            child: DropdownButtonComponentFactory().createNew(
                app: widget.app,
                id: 'menuDefs',
                value: _dialogID,
                trigger: _onDialogSelected,
                optional: false)));
      } else {
        List<DropdownMenuItem<String>> items = [];
        for (var ia in _internalActions) {
          items.add(DropdownMenuItem(value: ia, child: Text(ia)));
        }
        widgets.add(Center(
            child: dropdownButton<String>(
          widget.app,
          context,
          value: _internalAction,
          items: items,
          hint: Text('Select internal action'),
          onChanged: _changedDropDownItem,
        )));
      }

      return Container(
          height: (220),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: widgets));
    });
  }

  void setSelectionDisplayMode(int? val) {
    setState(() {
      _actionSelection = val;
    });
    if (_actionSelection == 0) {
      widget.setActionValue(GotoPage(widget.app, pageID: ''));
    }
    if (_actionSelection == 1) {
      widget.setActionValue(InternalAction(widget.app));
    }
    if (_actionSelection == 2) widget.setActionValue(PopupMenu(widget.app));
  }

  void _onDocumentSelected(value, _) {
    setState(() {
      _pageID = value;
    });
    if (_actionSelection == 0) {
      widget.setActionValue(GotoPage(widget.app, pageID: value));
    }
  }

  Future<void> _onPopupmenuSelected(value, _) async {
    setState(() {
      _menuDefID = value;
    });
    if (_actionSelection == 2) {
      MenuDefModel? menuDef =
          await menuDefRepository(appId: widget.app.documentID)!.get(value);
      widget.setActionValue(PopupMenu(widget.app, menuDef: menuDef));
    }
  }

  Future<void> _onDialogSelected(value, _) async {
    setState(() {
      _dialogID = value;
    });
    if (_actionSelection == 3) {
      widget.setActionValue(OpenDialog(widget.app, dialogID: value));
    }
  }

  void _changedDropDownItem(String? val) {
    setState(() {
      _internalAction = val;
    });
    var actionEnum = InternalActionEnum.unknown;
    if (_internalAction == _internalActions[0]) {
      actionEnum = InternalActionEnum.login;
    } else if (_internalAction == _internalActions[1]) {
      actionEnum = InternalActionEnum.logout;
    } else if (_internalAction == _internalActions[2]) {
      actionEnum = InternalActionEnum.goHome;
    } else if (_internalAction == _internalActions[3]) {
      actionEnum = InternalActionEnum.otherApps;
    }
    if (_actionSelection == 1) {
      widget.setActionValue(
          InternalAction(widget.app, internalActionEnum: actionEnum));
    }
  }
}
