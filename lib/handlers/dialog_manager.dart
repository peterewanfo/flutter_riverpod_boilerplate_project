import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate_project/handlers/dialog_handler.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key? key, required this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  OverlayEntry? _overlayEntry;
  late DialogHandler _dialogHandler;

  @override
  void initState() {
    super.initState();
    _dialogHandler = locator<DialogHandler>();
    _dialogHandler.registerDismissDialogListener(_dismissDialog);
    _dialogHandler.registerCustomTopToastDialog(showTopToastDialog);
  }

  void showTopToastDialog(String message) {
    print("show toast dialog");
  }

  void _dismissDialog(Map<DialogState, String>? response) {
    if (_overlayEntry != null) {
      _dialogHandler.dialogComplete(response);
      _overlayEntry!.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
