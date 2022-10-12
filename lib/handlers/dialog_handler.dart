import 'dart:async';

enum DialogState {
  Close,
  Proceed,
}

abstract class DialogHandler {
  ///Dismisses a dialog or loader
  void dismissDialog(Map<DialogState, String>? response);

  ///Registers a callback to dismiss a dialog
  void registerDismissDialogListener(
      Function(Map<DialogState, String>?) dismissCurrentDialog);

  ///Regsiters a callback to complete the completer
  void dialogComplete(Map<DialogState, String>? response);

  /// Registers a callback function to show toast message
  void registerCustomTopToastDialog(
      Function(String message) showCustomTopToast);

  void showCustomToastDialog(String message);
}

class DialogHandlerImpl implements DialogHandler {
  late Function(Map<DialogState, String>?) _dismissCurrentDialog;
  late Function(String message) _showCustomTopToast;
  late Completer<Map<DialogState, String>> _dialogCompleter;

  @override
  dismissDialog(Map<DialogState, String>? response) {
    _dismissCurrentDialog(response);
  }

  @override
  registerDismissDialogListener(
      Function(Map<DialogState, String>?) dismissCurrentDialog) {
    _dismissCurrentDialog = dismissCurrentDialog;
  }

  @override
  dialogComplete(Map<DialogState, String>? response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = Completer<Map<DialogState, String>>();
  }

  @override
  registerCustomTopToastDialog(Function(String message) showCustomTopToast) {
    _showCustomTopToast = showCustomTopToast;
  }

  @override
  showCustomToastDialog(String message) {
    _showCustomTopToast(message);
  }
}
